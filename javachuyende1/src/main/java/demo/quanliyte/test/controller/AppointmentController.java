package demo.quanliyte.test.controller;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

import demo.quanliyte.test.entity.Appointment;
import demo.quanliyte.test.entity.Patient;
import demo.quanliyte.test.entity.Role;
import demo.quanliyte.test.entity.User;
import demo.quanliyte.test.service.AppointmentService;
import demo.quanliyte.test.service.MedicalService;
import demo.quanliyte.test.service.MedicalServiceService;
import demo.quanliyte.test.service.PatientService;
import demo.quanliyte.test.service.UserService;
import jakarta.servlet.http.HttpSession;

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

    @Autowired
    private MedicalServiceService medicalServiceService;

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

    @GetMapping("/appointments/editStatus/{id}")
    public String showUpdateStatusDoctorForm(@PathVariable("id") Long id, Model model) {
        Appointment appointment = appointmentService.findById(id)
                .orElseThrow(() -> new RuntimeException("Không tìm thấy lịch khám với ID: " + id));

        List<User> doctors = userService.getDoctors(); // Giả sử bác sĩ là User có role 'DOCTOR'

        model.addAttribute("appointment", appointment);
        model.addAttribute("doctors", doctors);
        return "admin/clinicschedule/editLichKham";
    }

    @PostMapping("/appointments/updateStatusDoctor")
    public String updateStatusAndDoctor(@ModelAttribute("appointment") Appointment appointmentForm) {
        Appointment existing = appointmentService.findById(appointmentForm.getId())
                .orElseThrow(() -> new RuntimeException("Không tìm thấy lịch khám với ID: " + appointmentForm.getId()));

        User doctor = userService.getUserById(appointmentForm.getDoctor().getId());
        existing.setDoctor(doctor);
        existing.setStatus(appointmentForm.getStatus());

        appointmentService.save(existing);
        return "redirect:/appointments";
    }

    @GetMapping("/xemLichKham")
    public String xemLichKham(HttpSession session, Model model) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser == null) {
            return "redirect:/login";
        }

        Long userId = loggedInUser.getId();
        System.out.println("UserId đang đăng nhập: " + userId); // In log

        Patient patient = patientService.findByUserId(userId);
        if (patient == null) {
            model.addAttribute("error", "Không tìm thấy thông tin bệnh nhân tương ứng.");
            return "errorPage";
        }

        Long patientId = patient.getId();
        System.out.println("PatientId lấy được từ userId: " + patientId); // In log

        List<Appointment> appointments = appointmentService.findByPatientId(patientId);
        model.addAttribute("appointments", appointments);
        return "admin/clinicschedule/xemLichKham";
    }

}
