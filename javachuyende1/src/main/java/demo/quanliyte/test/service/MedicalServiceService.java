package demo.quanliyte.test.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import demo.quanliyte.test.entity.MedicalServic;
import demo.quanliyte.test.entity.MedicalSupply;
import demo.quanliyte.test.repository.MedicalServiceRepository;

@Service
public class MedicalServiceService {
    @Autowired
    private MedicalServiceRepository repo;

    public List<MedicalServic> findAll() {
        return repo.findAll();
    }

    public MedicalServic save(MedicalServic service) {
        return repo.save(service);
    }

    public Optional<MedicalServic> findById(Long id) {
        return repo.findById(id);
    }

    public void delete(Long id) {
        repo.deleteById(id);
    }
}
