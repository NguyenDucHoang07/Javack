package demo.quanliyte.test.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import demo.quanliyte.test.entity.MedicalSupply;

public interface MedicalRepository extends JpaRepository<MedicalSupply, Long> {
    // bạn có thể thêm phương thức custom nếu cần
}