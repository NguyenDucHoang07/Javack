package demo.quanliyte.test.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import demo.quanliyte.test.entity.Manufacturer;
import demo.quanliyte.test.entity.Medicine;
import demo.quanliyte.test.service.ManufacturerService;
import demo.quanliyte.test.service.MedicineService;

@Controller
@RequestMapping("/quanlythuoc")
public class MedicineController {

    @Autowired
    private MedicineService medicineService;

    @Autowired
    private ManufacturerService manufacturerService;

    @GetMapping
    public String showMedicines(Model model) {
        model.addAttribute("medicines", medicineService.getAllMedicines());
        model.addAttribute("manufacturers", manufacturerService.getAllManufacturers());
        model.addAttribute("newMedicine", new Medicine());
        return "admin/medicine/quanlythuoc"; // trả về login.jsp
    }

    @PostMapping("/add")
    public String addMedicine(@ModelAttribute("newMedicine") Medicine medicine) {
        medicineService.saveMedicine(medicine);
        return "redirect:/quanlythuoc";
    }

    @PostMapping("/deletethuoc/{id}")
    public String deletenhasanxuat(@PathVariable Long id) {
        medicineService.deleteById(id);
        return "redirect:/quanlythuoc";
    }

    @GetMapping("/editthuoc/{id}")
    public String showEditForm(@PathVariable Long id, Model model) {
        Medicine medicine = medicineService.getById(id)
                .orElseThrow(() -> new IllegalArgumentException("Invalid medicine Id:" + id));
        model.addAttribute("medicine", medicine);
        model.addAttribute("manufacturers", manufacturerService.getAllManufacturers());
        return "admin/medicine/editthuoc";
    }

    @PostMapping("/updatethuoc")
    public String updateMedicine(@ModelAttribute("medicine") Medicine medicine, Model model) {
        try {
            medicineService.saveMedicine(medicine); // hoặc update tùy theo logic bạn dùng
            return "redirect:/quanlythuoc?success=update";
        } catch (Exception e) {
            model.addAttribute("errorMessage", "Cập nhật thất bại: " + e.getMessage());
            model.addAttribute("medicine", medicine);
            model.addAttribute("manufacturers", manufacturerService.getAllManufacturers());
            return "admin/medicine/editthuoc";
        }
    }

}
