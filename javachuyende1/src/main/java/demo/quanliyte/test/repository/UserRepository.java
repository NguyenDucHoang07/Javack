package demo.quanliyte.test.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import demo.quanliyte.test.entity.User;

public interface UserRepository extends JpaRepository<User, Long> {
    List<User> findByRole_Id(Long roleId);
}
