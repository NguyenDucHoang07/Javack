package demo.quanliyte.test.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import demo.quanliyte.test.entity.Role;
import demo.quanliyte.test.entity.Status;
import demo.quanliyte.test.entity.User;
import demo.quanliyte.test.service.UserService;

import java.io.File;
import java.io.IOException;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/users")
public class UserController {

    @Autowired
    private UserService userService;

    private static final DateTimeFormatter DATE_FORMATTER = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm");

    @GetMapping
    public String listUsers(Model model) {
        List<User> users = userService.getAllUsers();
        List<Role> roles = userService.getAllRoles();
        List<Status> statuses = userService.getAllStatuses();

        Map<Long, String> createdAtFormattedMap = users.stream()
                .collect(Collectors.toMap(
                        User::getId,
                        user -> {
                            if (user.getCreatedAt() == null)
                                return "";
                            return user.getCreatedAt().format(DATE_FORMATTER);
                        }));

        // Tính toán thống kê
        long totalUsers = users.size();
        long activeUsers = users.stream()
                .filter(user -> user.getStatus() != null && "Kích hoạt".equals(user.getStatus().getName()))
                .count();
        long lockedUsers = users.stream()
                .filter(user -> user.getStatus() != null && "Đã khóa".equals(user.getStatus().getName()))
                .count();
        long doctorUsers = users.stream()
                .filter(user -> user.getRole() != null && "Bác sĩ".equals(user.getRole().getName()))
                .count();

        // Đưa vào model
        model.addAttribute("users", users);
        model.addAttribute("roles", roles);
        model.addAttribute("statuses", statuses);
        model.addAttribute("newUser", new User());
        model.addAttribute("createdAtFormattedMap", createdAtFormattedMap);

        model.addAttribute("totalUsers", totalUsers);
        model.addAttribute("activeUsers", activeUsers);
        model.addAttribute("lockedUsers", lockedUsers);
        model.addAttribute("doctorUsers", doctorUsers);

        return "admin/user/quanlynguoidung";
    }

    @GetMapping("/loc")
    public String listUsersFiltered(
            @RequestParam(value = "roleFilter", required = false) String roleFilter,
            @RequestParam(value = "statusFilter", required = false) String statusFilter,
            Model model) {

        List<User> users = userService.getAllUsers();

        if (roleFilter != null && !roleFilter.isEmpty()) {
            users = users.stream()
                    .filter(u -> u.getRole() != null && roleFilter.equals(u.getRole().getName()))
                    .collect(Collectors.toList());
        }

        if (statusFilter != null && !statusFilter.isEmpty()) {
            users = users.stream()
                    .filter(u -> u.getStatus() != null && statusFilter.equals(u.getStatus().getName()))
                    .collect(Collectors.toList());
        }

        // Tạo map ngày tạo đã format
        Map<Long, String> createdAtFormattedMap = users.stream()
                .collect(Collectors.toMap(
                        User::getId,
                        user -> {
                            if (user.getCreatedAt() == null)
                                return "";
                            return user.getCreatedAt().format(DATE_FORMATTER);
                        }));

        // Tính toán thống kê lại cho trang lọc
        long totalUsers = users.size();
        long activeUsers = users.stream()
                .filter(user -> user.getStatus() != null && "Kích hoạt".equals(user.getStatus().getName()))
                .count();
        long lockedUsers = users.stream()
                .filter(user -> user.getStatus() != null && "Đã khóa".equals(user.getStatus().getName()))
                .count();
        long doctorUsers = users.stream()
                .filter(user -> user.getRole() != null && "Bác sĩ".equals(user.getRole().getName()))
                .count();

        // Truyền dữ liệu về model
        model.addAttribute("users", users);
        model.addAttribute("roles", userService.getAllRoles());
        model.addAttribute("statuses", userService.getAllStatuses());
        model.addAttribute("newUser", new User());

        model.addAttribute("createdAtFormattedMap", createdAtFormattedMap);

        // Thống kê
        model.addAttribute("totalUsers", totalUsers);
        model.addAttribute("activeUsers", activeUsers);
        model.addAttribute("lockedUsers", lockedUsers);
        model.addAttribute("doctorUsers", doctorUsers);

        // Giữ lại giá trị lọc để set selected
        model.addAttribute("roleFilter", roleFilter);
        model.addAttribute("statusFilter", statusFilter);

        return "admin/user/quanlynguoidung";
    }

    // Xử lý thêm người dùng mới
    @PostMapping("/add")
    public String addUser(
            @ModelAttribute("newUser") @Valid User user,
            BindingResult result,
            @RequestParam("avatarFile") MultipartFile avatarFile,
            Model model,
            HttpServletRequest request) {

        if (result.hasErrors()) {
            model.addAttribute("users", userService.getAllUsers());
            model.addAttribute("roles", userService.getAllRoles());
            return "admin/user/quanlynguoidung";
        }

        if (!avatarFile.isEmpty()) {
            try {
                // Đường dẫn thư mục lưu file trong webapp/resources/avatars
                String uploadDir = request.getServletContext().getRealPath("/resources/avatars");

                File uploadPath = new File(uploadDir);
                if (!uploadPath.exists()) {
                    uploadPath.mkdirs();
                }

                // Đổi tên file để tránh trùng và loại bỏ dấu cách
                String originalFilename = avatarFile.getOriginalFilename();
                String sanitizedFilename = originalFilename.replaceAll("\\s+", "_");
                String fileName = UUID.randomUUID() + "_" + sanitizedFilename;

                File dest = new File(uploadPath, fileName);
                avatarFile.transferTo(dest);

                // Lưu đường dẫn URL để hiển thị (theo ResourceHandler cấu hình)
                user.setAvatar("/avatars/" + fileName);

            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        Status defaultStatus = userService.findStatusByName("Kích hoạt");
        user.setStatus(defaultStatus);

        userService.saveUser(user);

        return "redirect:/users";
    }

    @GetMapping("/editUser")
    public String showEditUserForm(@RequestParam Long id, Model model) {
        User user = userService.getUserById(id);
        model.addAttribute("user", user);
        model.addAttribute("roles", userService.getAllRoles()); // load roles để đổ vào select
        model.addAttribute("statuses", userService.getAllStatuses()); // load trạng thái
        return "admin/user/editUser"; // tên file jsp chỉnh sửa
    }

    @PostMapping("/updateUser")
    public String updateUser(@ModelAttribute("user") User user,
            @RequestParam("avatarFile") MultipartFile avatarFile,
            HttpServletRequest request) throws IOException {

        // Lấy user cũ từ DB
        User existingUser = userService.getUserById(user.getId());

        // Giữ nguyên createdAt không thay đổi
        user.setCreatedAt(existingUser.getCreatedAt());

        // Xử lý upload avatar như đã nói
        if (avatarFile != null && !avatarFile.isEmpty()) {
            String realPath = request.getServletContext().getRealPath("/resources/avatars/");
            File uploadDir = new File(realPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }
            String filename = System.currentTimeMillis() + "_" + avatarFile.getOriginalFilename();
            File file = new File(uploadDir, filename);
            avatarFile.transferTo(file);
            user.setAvatar("/avatars/" + filename);
        } else {
            // Giữ nguyên avatar nếu không upload ảnh mới
            user.setAvatar(existingUser.getAvatar());
        }

        // Cập nhật user
        userService.updateUser(user);

        return "redirect:/users";
    }

    // @GetMapping("/deleteUser")
    // public String deleteUser(@RequestParam("id") Long id) {
    // userService.deleteUser(id);
    // return "redirect:/users"; // chuyển về trang danh sách sau khi xóa
    // }
    @PostMapping("/deleteUser")
    public String deleteUser(@RequestParam("id") Long id) {
        userService.deleteUser(id);
        return "redirect:/users";
    }

}
