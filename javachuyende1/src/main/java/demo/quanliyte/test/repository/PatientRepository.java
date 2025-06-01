package demo.quanliyte.test.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import demo.quanliyte.test.entity.Patient;
import demo.quanliyte.test.entity.User;

@Repository
public interface PatientRepository extends JpaRepository<Patient, Long> {
    Patient findByUser(User user);

    Patient findByUserId(Long userId);

}