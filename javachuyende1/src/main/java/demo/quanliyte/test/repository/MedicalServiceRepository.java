package demo.quanliyte.test.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import demo.quanliyte.test.entity.MedicalServic;

@Repository
public interface MedicalServiceRepository extends JpaRepository<MedicalServic, Long> {
}
