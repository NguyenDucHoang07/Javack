package demo.quanliyte.test.controller;

import demo.quanliyte.test.service.UserService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import java.io.File;
import java.io.IOException;
import java.time.format.DateTimeFormatter;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.multipart.MultipartFile;

import demo.quanliyte.test.entity.User;
import demo.quanliyte.test.repository.RegistrationRepository;
import demo.quanliyte.test.service.RegistrationService;
import jakarta.validation.Valid;

@Controller
public class RegistrationController {

    private final UserService userService;

    @Autowired
    private RegistrationService registrationService;

    @Autowired
    private RegistrationRepository registrationRepository;

    RegistrationController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/register")
    public String showRegistrationForm(Model model) {
        model.addAttribute("user", new User());
        return "admin/user/Register"; // Tên file JSP (register.jsp)
    }

    @PostMapping("/register")
    public String processRegistration(
            @ModelAttribute("user") @Valid User user,
            BindingResult result,
            @RequestParam("avatarFile") MultipartFile avatarFile,
            HttpServletRequest request,
            Model model) {

        if (result.hasErrors()) {
            return "admin/user/Register"; // Tên file JSP (register.jsp)
        }

        try {
            registrationService.register(user, avatarFile, request);
        } catch (RuntimeException e) {
            model.addAttribute("errorMessage", e.getMessage());
            return "admin/user/Register"; // Tên file JSP (register.jsp)
        }

        return "redirect:/login"; // Hoặc trang đăng nhập hoặc trang thành công
    }

    @GetMapping("/login")
    public String showLoginForm() {
        return "admin/user/Login"; // login.jsp
    }

    @PostMapping("/login")
    public String processLogin(
            @RequestParam("email") String email,
            @RequestParam("password") String password,
            HttpSession session,
            Model model) {

        User user = registrationRepository.findByEmail(email);
        if (user == null) {
            model.addAttribute("errorMessage", "Email không tồn tại");
            return "admin/user/Login"; // login.jsp
        }

        if (!user.getPassword().equals(password)) {
            model.addAttribute("errorMessage", "Mật khẩu không đúng");
            return "admin/user/Login"; // login.jsp
        }

        session.setAttribute("loggedInUser", user);

        if (user.getRole() != null) {
            Long roleId = user.getRole().getId();
            if (Long.valueOf(4).equals(roleId)) {
                return "redirect:/giaodien/home"; // Trang dành cho khách hàng
            } else if (Long.valueOf(1).equals(roleId)) {
                return "redirect:/"; // Trang admin
            }
        }

        // Nếu không có role hoặc role không phải 1 hoặc 4, trả về trang mặc định
        return "redirect:/";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate(); // Xóa hết session
        return "redirect:/giaodien/home";
    }

    @GetMapping("/profile")
    public String showProfile(HttpSession session, Model model) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser == null) {
            return "redirect:/login";
        }

        model.addAttribute("user", loggedInUser);

        // Format LocalDateTime sang chuỗi
        if (loggedInUser.getCreatedAt() != null) {
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm");
            String createdAtFormatted = loggedInUser.getCreatedAt().format(formatter);
            model.addAttribute("createdAtFormatted", createdAtFormatted);
        }

        return "admin/user/profile";
    }

    @PostMapping("/update-profile")
    public String updateProfile(
            @ModelAttribute("user") User user,
            @RequestParam("avatarFile") MultipartFile avatarFile,
            HttpServletRequest request,
            HttpSession session,
            Model model) {

        // Lấy user đang đăng nhập từ session
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser == null) {
            return "redirect:/login";
        }

        // Gán id user đăng nhập vào user nhận từ form để đảm bảo cập nhật đúng user
        user.setId(loggedInUser.getId());

        // Xử lý upload avatar nếu có
        if (!avatarFile.isEmpty()) {
            try {
                String fileName = UUID.randomUUID() + "_" + avatarFile.getOriginalFilename();
                String uploadDir = request.getServletContext().getRealPath("/resources/avatars");
                File dir = new File(uploadDir);
                if (!dir.exists())
                    dir.mkdirs();

                File dest = new File(dir, fileName);
                avatarFile.transferTo(dest);

                user.setAvatar("/avatars/" + fileName);

            } catch (IOException e) {
                model.addAttribute("errorMessage", "Lỗi khi upload avatar");
                return "admin/user/profile"; // hoặc tên file jsp phù hợp
            }
        } else {
            // Nếu không upload ảnh mới, giữ lại avatar cũ từ user đăng nhập
            user.setAvatar(loggedInUser.getAvatar());
        }

        // Cập nhật user trong DB
        userService.update(user);

        // Cập nhật lại session với thông tin mới (nếu cần)
        User updatedUser = userService.getUserById(user.getId());
        session.setAttribute("loggedInUser", updatedUser);

        return "redirect:/profile";
    }

}