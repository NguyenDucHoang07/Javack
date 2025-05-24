package demo.quanliyte.test.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import demo.quanliyte.test.entity.Status;

public interface StatusRepository extends JpaRepository<Status, Long> {
    Status findByName(String name);

}