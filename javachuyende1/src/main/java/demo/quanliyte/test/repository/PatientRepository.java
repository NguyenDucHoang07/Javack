package demo.quanliyte.test.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import demo.quanliyte.test.entity.Patient;

@Repository
public interface PatientRepository extends JpaRepository<Patient, Long> {
}