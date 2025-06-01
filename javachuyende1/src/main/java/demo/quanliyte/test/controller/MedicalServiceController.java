package demo.quanliyte.test.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import demo.quanliyte.test.entity.MedicalServic;
// import demo.quanliyte.test.entity.Patient;
import demo.quanliyte.test.service.MedicalService;
import demo.quanliyte.test.service.MedicalServiceService;

@Controller
@RequestMapping("/quanlydichvu")
public class MedicalServiceController {
    @Autowired
    private MedicalServiceService medicalServiceService;

    @GetMapping
    public String list(Model model) {
        model.addAttribute("services", medicalServiceService.findAll());
        model.addAttribute("newService", new MedicalServic());
        return "admin/servicemanagement/quanlydichvu"; // JSP
    }

    @PostMapping("/save")
    public String save(@ModelAttribute("newService") MedicalServic svc) {
        medicalServiceService.save(svc);
        return "redirect:/quanlydichvu";
    }

    @PostMapping("/delete/{id}")
    public String delete(@PathVariable Long id) {
        medicalServiceService.delete(id);
        return "redirect:/quanlydichvu";
    }

    // @GetMapping("/edit/{id}")
    // public String showEditForm(@PathVariable("id") Long id, Model model) {
    // MedicalServic services = service.findById(id);
    // model.addAttribute("service", service);
    // return "service/editService"; // JSP nằm ở views/service/editService.jsp
    // }

    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable Long id, Model model) {
        MedicalServic services = medicalServiceService.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Invalid patient Id:" + id));
        model.addAttribute("services", services);
        return "admin/servicemanagement/editService"; // file JSP hiển thị form sửa
    }

    @PostMapping("/update")
    public String updateService(@ModelAttribute("service") MedicalServic service) {
        medicalServiceService.save(service);
        return "redirect:/quanlydichvu";
    }

}
