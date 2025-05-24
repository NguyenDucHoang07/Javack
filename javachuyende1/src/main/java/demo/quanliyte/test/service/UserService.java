package demo.quanliyte.test.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import demo.quanliyte.test.entity.Role;
import demo.quanliyte.test.entity.Status;
import demo.quanliyte.test.entity.User;
import demo.quanliyte.test.repository.RoleRepository;
import demo.quanliyte.test.repository.StatusRepository;
import demo.quanliyte.test.repository.UserRepository;

import java.util.List;
import java.util.Optional;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private RoleRepository roleRepository;

    @Autowired
    private StatusRepository statusRepository;

    public List<User> getAllUsers() {
        return userRepository.findAll();
    }

    public User getUserById(Long id) {
        return userRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Không tìm thấy người dùng với ID: " + id));
    }

    public void updateUser(User user) {
        userRepository.save(user); // save = update nếu đã có ID
    }

    public User saveUser(User user) {
        return userRepository.save(user);
    }

    public void deleteUser(Long id) {
        userRepository.deleteById(id);
    }

    public List<Role> getAllRoles() {
        return roleRepository.findAll();
    }

    public List<Status> getAllStatuses() {
        return statusRepository.findAll();
    }

    public Status findStatusByName(String name) {
        return statusRepository.findByName(name);
    }

    public List<User> getDoctors() {
        return userRepository.findByRole_Id(2L); // 2 là ID của role "doctor"
    }

}