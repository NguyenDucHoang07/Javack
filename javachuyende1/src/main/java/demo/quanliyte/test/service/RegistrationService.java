package demo.quanliyte.test.service;

import demo.quanliyte.test.entity.User;
import demo.quanliyte.test.entity.Role;
import demo.quanliyte.test.entity.Status;
import demo.quanliyte.test.repository.RegistrationRepository;
import demo.quanliyte.test.repository.RoleRepository;
import demo.quanliyte.test.repository.StatusRepository;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDateTime;

@Service
@Transactional
public class RegistrationService {

    @Autowired
    private RegistrationRepository registrationRepository;

    @Autowired
    private RoleRepository roleRepository;

    @Autowired
    private StatusRepository statusRepository;

    public void register(User user, MultipartFile avatarFile, HttpServletRequest request) {
        // Check email đã tồn tại
        if (registrationRepository.existsByEmail(user.getEmail())) {
            throw new RuntimeException("Email đã được sử dụng");
        }

        Role role = roleRepository.findById(4L)
                .orElseThrow(() -> new RuntimeException("Không tìm thấy role mặc định"));

        Status status = statusRepository.findByName("Kích hoạt");
        if (status == null) {
            throw new RuntimeException("Không tìm thấy status Kích hoạt");
        }

        user.setRole(role);
        user.setStatus(status);

        // Xử lý upload avatar
        if (avatarFile != null && !avatarFile.isEmpty()) {
            try {
                String uploadDir = request.getServletContext().getRealPath("/resources/avatars");

                File uploadPath = new File(uploadDir);
                if (!uploadPath.exists()) {
                    uploadPath.mkdirs();
                }

                String originalFilename = avatarFile.getOriginalFilename();
                String sanitizedFilename = originalFilename.replaceAll("\\s+", "_");
                String fileName = java.util.UUID.randomUUID() + "_" + sanitizedFilename;

                File dest = new File(uploadPath, fileName);
                avatarFile.transferTo(dest);

                user.setAvatar("/avatars/" + fileName);

            } catch (IOException e) {
                throw new RuntimeException("Lỗi khi lưu ảnh avatar: " + e.getMessage());
            }
        }

        user.setCreatedAt(LocalDateTime.now());

        registrationRepository.save(user);
    }

}
