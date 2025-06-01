package demo.quanliyte.test.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import demo.quanliyte.test.entity.Patient;

import demo.quanliyte.test.service.PatientService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;

import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/patients")
public class PatientController {

    @Autowired
    private PatientService patientService;

    private static final DateTimeFormatter DATE_FORMATTER = DateTimeFormatter.ofPattern("dd/MM/yyyy");

    @GetMapping
    public String getAllPatients(Model model) {
        List<Patient> patients = patientService.getAllPatient();

        Map<Long, String> createdAtFormattedMap = patients.stream()
                .collect(Collectors.toMap(
                        Patient::getId,
                        patient -> {
                            if (patient.getBirthDate() == null)
                                return "";
                            return patient.getBirthDate().format(DATE_FORMATTER);
                        }));
        model.addAttribute("patients", patients);
        model.addAttribute("birthdate", createdAtFormattedMap);
        model.addAttribute("newPatient", new Patient());
        // đưa danh sách vào Model
        return "admin/patient/quanlybenhnhan"; // tên file JSP (patient-list.jsp)
    }

    @PostMapping("/addPatient")
    public String addPatient(
            @ModelAttribute("newPatient") @Valid Patient patient,
            BindingResult result,
            Model model,
            HttpServletRequest request) {
        patientService.save(patient);

        return "redirect:/patients";
    }

    @PostMapping("/deletePatient/{id}")
    public String deletePatient(@PathVariable Long id) {
        patientService.deleteById(id);
        return "redirect:/patients";
    }

    @GetMapping("/editPatient/{id}")
    public String showEditForm(@PathVariable Long id, Model model) {
        Patient patient = patientService.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Invalid patient Id:" + id));
        model.addAttribute("patient", patient);
        return "admin/patient/updatepatient"; // file JSP hiển thị form sửa
    }

    @PostMapping("/updatePatient")
    public String updatePatient(@ModelAttribute("patient") Patient patient, Model model) {
        try {
            patientService.updatePatient(patient);
            return "redirect:/patients?success=update"; // chuyển về danh sách bệnh nhân

        } catch (Exception e) {
            model.addAttribute("errorMessage", "Cập nhật thất bại: " + e.getMessage());
            model.addAttribute("patient", patient);
            return "admin/patient/updatepatient"; // hiển thị lại form với thông báo lỗi
        }
    }

}