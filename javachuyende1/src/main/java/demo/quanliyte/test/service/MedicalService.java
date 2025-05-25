package demo.quanliyte.test.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import demo.quanliyte.test.entity.MedicalSupply;
import demo.quanliyte.test.repository.MedicalRepository;

import java.util.List;
import java.util.Optional;

@Service
public class MedicalService {

    @Autowired
    private MedicalRepository supplyRepository;

    public List<MedicalSupply> findAll() {
        return supplyRepository.findAll();
    }

    public Optional<MedicalSupply> findById(Long id) {
        return supplyRepository.findById(id);
    }

    public void save(MedicalSupply supply) {
        supplyRepository.save(supply);
    }

    public void deleteById(Long id) {
        supplyRepository.deleteById(id);
    }
}
