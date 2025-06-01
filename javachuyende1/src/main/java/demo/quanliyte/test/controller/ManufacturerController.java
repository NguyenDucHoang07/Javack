package demo.quanliyte.test.controller;

import demo.quanliyte.test.entity.Manufacturer;
// import demo.quanliyte.test.entity.Patient;
import demo.quanliyte.test.service.ManufacturerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/quanlynhasanxuat")
public class ManufacturerController {

    @Autowired
    private ManufacturerService manufacturerService;

    // Hiển thị danh sách nhà sản xuất
    @GetMapping
    public String listManufacturers(Model model) {
        List<Manufacturer> manufacturers = manufacturerService.getAllManufacturers();
        model.addAttribute("manufacturers", manufacturers);
        model.addAttribute("manufacturer", new Manufacturer()); // phải là "manufacturer"
        return "admin/medicine/nhasanxuat"; // trả về login.jsp
    }

    // Xử lý lưu nhà sản xuất mới hoặc cập nhật
    @PostMapping("/save")
    public String saveManufacturer(@ModelAttribute("manufacturer") Manufacturer manufacturer) {
        manufacturerService.saveManufacturer(manufacturer);
        return "redirect:/quanlynhasanxuat";
    }

    @PostMapping("/deletenhasanxuat/{id}")
    public String deletenhasanxuat(@PathVariable Long id) {
        manufacturerService.deleteManufacturer(id);
        return "redirect:/quanlynhasanxuat";
    }

    @GetMapping("/editnhasanxuat/{id}")
    public String showEditForm(@PathVariable Long id, Model model) {
        Manufacturer manufacturer = manufacturerService.getManufacturerById(id)
                .orElseThrow(() -> new IllegalArgumentException("Invalid patient Id:" + id));
        model.addAttribute("manufacturer", manufacturer);
        return "admin/medicine/editnhasanxuat"; // trả về login.jsp
    }

    @PostMapping("/updatenhasanxuat")
    public String updatePatient(@ModelAttribute("manufacturer") Manufacturer manufacturer, Model model) {
        try {
            manufacturerService.updateanufacturer(manufacturer);
            return "redirect:/quanlynhasanxuat?success=update"; // chuyển về danh sách bệnh nhân
        } catch (Exception e) {
            model.addAttribute("errorMessage", "Cập nhật thất bại: " + e.getMessage());
            model.addAttribute("manufacturer", manufacturer);
            return "admin/medicine/editnhasanxuat"; // trả về login.jsp
        }
    }

}