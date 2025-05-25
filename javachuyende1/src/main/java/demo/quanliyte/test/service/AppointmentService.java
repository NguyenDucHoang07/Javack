package demo.quanliyte.test.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import demo.quanliyte.test.entity.Appointment;
import demo.quanliyte.test.repository.AppointmentRepository;

@Service
public class AppointmentService {

    @Autowired
    private AppointmentRepository repository;

    public List<Appointment> findAll() {
        return repository.findAll();
    }

    public Optional<Appointment> findById(Long id) {
        return repository.findById(id);
    }

    public Appointment save(Appointment appointment) {
        return repository.save(appointment);
    }

    public void deleteById(Long id) {
        repository.deleteById(id);
    }

    public List<Appointment> searchByPatientName(String keyword) {
        return repository.findByPatientFullNameContainingIgnoreCase(keyword);
    }

}
