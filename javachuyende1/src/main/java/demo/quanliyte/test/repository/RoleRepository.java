package demo.quanliyte.test.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import demo.quanliyte.test.entity.Role;

public interface RoleRepository extends JpaRepository<Role, Long> {
}