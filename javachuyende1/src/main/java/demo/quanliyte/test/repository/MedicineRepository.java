package demo.quanliyte.test.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import demo.quanliyte.test.entity.Medicine;

public interface MedicineRepository extends JpaRepository<Medicine, Long> {
}
