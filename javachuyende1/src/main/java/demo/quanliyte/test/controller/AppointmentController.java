package demo.quanliyte.test.controller;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

import demo.quanliyte.test.entity.Appointment;
import demo.quanliyte.test.entity.Patient;
import demo.quanliyte.test.entity.Role;
import demo.quanliyte.test.entity.User;
import demo.quanliyte.test.service.AppointmentService;
import demo.quanliyte.test.service.PatientService;
import demo.quanliyte.test.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AppointmentController {

    @Autowired
    private AppointmentService appointmentService;

    @Autowired
    private UserService userService;

    @Autowired
    private PatientService patientService;

    @GetMapping("/appointments")
    public String showAppointmentForm(
            Model model,
            @RequestParam(value = "keyword", required = false) String keyword) {
        List<User> doctors = userService.getDoctors(); // lấy danh sách bác sĩ
        List<Patient> patients = patientService.getAllPatient();
        model.addAttribute("listDoctor", doctors);
        model.addAttribute("listPatient", patients);
        model.addAttribute("appointment", new Appointment()); // để binding form

        List<Appointment> appointments;
        if (keyword != null && !keyword.trim().isEmpty()) {
            appointments = appointmentService.searchByPatientName(keyword.trim());
        } else {
            appointments = appointmentService.findAll();
        }
        model.addAttribute("appointments", appointments);
        model.addAttribute("keyword", keyword);

        return "admin/clinicschedule/quanlylichkham"; // tên view jsp
    }

    @PostMapping("/appointments/save")
    public String saveAppointment(@ModelAttribute("appointment") Appointment appointment) {
        appointment.setCreatedAt(LocalDateTime.now());
        appointmentService.save(appointment);
        return "redirect:/appointments";
    }

    @PostMapping("appointments/deleteAppointment/{id}")
    public String deleteAppointment(@PathVariable Long id) {
        appointmentService.deleteById(id);
        return "redirect:/appointments";
    }

}
