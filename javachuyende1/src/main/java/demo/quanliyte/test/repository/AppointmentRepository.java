package demo.quanliyte.test.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import demo.quanliyte.test.entity.Appointment;

@Repository
public interface AppointmentRepository extends JpaRepository<Appointment, Long> {
    // Bạn có thể thêm phương thức tùy chỉnh nếu cần
    List<Appointment> findByPatientFullNameContainingIgnoreCase(String keyword);

}
