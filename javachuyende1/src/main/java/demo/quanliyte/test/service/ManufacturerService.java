package demo.quanliyte.test.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import demo.quanliyte.test.entity.Manufacturer;

import demo.quanliyte.test.repository.ManufactRepository;

@Service
public class ManufacturerService {

    @Autowired
    private ManufactRepository manufacturerRepository;

    // Lấy danh sách tất cả nhà sản xuất
    public List<Manufacturer> getAllManufacturers() {
        return manufacturerRepository.findAll();
    }

    // Tìm nhà sản xuất theo id
    public Optional<Manufacturer> getManufacturerById(Long id) {
        return manufacturerRepository.findById(id);
    }

    // Lưu hoặc cập nhật nhà sản xuất, tự sinh mã code nếu để trống
    public Manufacturer saveManufacturer(Manufacturer manufacturer) {
        if (manufacturer.getCode() == null || manufacturer.getCode().trim().isEmpty()) {
            String newCode = generateNewCode();
            manufacturer.setCode(newCode);
        }
        return manufacturerRepository.save(manufacturer);
    }

    // Xóa nhà sản xuất theo id
    public void deleteManufacturer(Long id) {
        manufacturerRepository.deleteById(id);
    }

    public void updateanufacturer(Manufacturer manufacturer) {
        manufacturerRepository.save(manufacturer); // save = update nếu đã có ID
    }

    // Phương thức sinh mã mới dạng NSX001, NSX002, ...
    private String generateNewCode() {
        String maxCode = manufacturerRepository.findMaxCode();
        if (maxCode == null) {
            return "NSX001";
        }
        try {
            int number = Integer.parseInt(maxCode.substring(3));
            number++;
            return String.format("NSX%03d", number);
        } catch (Exception e) {
            // Nếu format code hiện tại không đúng, trả về mặc định
            return "NSX001";
        }
    }
}
