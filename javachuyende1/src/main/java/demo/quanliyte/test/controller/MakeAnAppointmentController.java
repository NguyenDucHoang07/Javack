package demo.quanliyte.test.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import demo.quanliyte.test.entity.MedicalServic;
import demo.quanliyte.test.service.MedicalServiceService;

@Controller
public class MakeAnAppointmentController {

    @Autowired
    private MedicalServiceService medicalServiceService;

    // Hiển thị danh sách dịch vụ khám
    @GetMapping("/giaodien/lichhenkham")
    public String showServiceList(Model model) {
        List<MedicalServic> services = medicalServiceService.findAll();
        model.addAttribute("services", services);
        return "giaodien/lichhenkham"; // JSP hiển thị danh sách dịch vụ
    }
}