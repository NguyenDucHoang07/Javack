package demo.quanliyte.test.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import demo.quanliyte.test.entity.MedicalSupply;
import demo.quanliyte.test.entity.Medicine;
import demo.quanliyte.test.service.ManufacturerService;
import demo.quanliyte.test.service.MedicalService;

@Controller // ✅ ĐÚNG
@RequestMapping("/quanlyvattu")
public class MedicalSupplyController {

    @Autowired
    private MedicalService medicalSupplyService;

    @Autowired
    private ManufacturerService manufacturerService;

    @GetMapping
    public String listSupplies(Model model) {
        model.addAttribute("supplies", medicalSupplyService.findAll());
        model.addAttribute("manufacturers", manufacturerService.getAllManufacturers());
        return "admin/medicine/quanlyvattu"; // trang quản lý vật tư
    }

    @PostMapping("/save")
    public String addSupply(@ModelAttribute MedicalSupply supply) {
        medicalSupplyService.save(supply);
        return "redirect:/quanlyvattu";
    }

    @GetMapping("/editvattu/{id}")
    public String editForm(@PathVariable Long id, Model model) {
        MedicalSupply supply = medicalSupplyService.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Invalid medicine Id:" + id));
        model.addAttribute("supply", supply);
        model.addAttribute("manufacturers", manufacturerService.getAllManufacturers());
        return "admin/medicine/editvattu";
    }

    @PostMapping("/update")
    public String updateSupply(@ModelAttribute MedicalSupply supply) {
        medicalSupplyService.save(supply);
        return "redirect:/quanlyvattu?success=update";
    }

    @PostMapping("/deletevattu/{id}")
    public String delete(@PathVariable Long id) {
        medicalSupplyService.deleteById(id);
        return "redirect:/quanlyvattu?success=delete";
    }
}
