package demo.quanliyte.test.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import demo.quanliyte.test.entity.Manufacturer;
import demo.quanliyte.test.entity.Medicine;
import demo.quanliyte.test.repository.MedicineRepository;

@Service
public class MedicineService {

    @Autowired
    private MedicineRepository medicineRepository;

    public List<Medicine> getAllMedicines() {
        return medicineRepository.findAll();
    }

    public Medicine saveMedicine(Medicine medicine) {
        return medicineRepository.save(medicine);
    }

    public void deleteById(Long id) {
        medicineRepository.deleteById(id);
    }

    public void updateMedicine(Medicine medicine) {
        medicineRepository.save(medicine); // save = update nếu đã có ID
    }

    public Optional<Medicine> getById(Long id) {
        return medicineRepository.findById(id);
    }

}
