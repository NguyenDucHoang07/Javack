package demo.quanliyte.test.controller;

import java.security.Principal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import demo.quanliyte.test.entity.Appointment;
import demo.quanliyte.test.entity.MedicalServic;
import demo.quanliyte.test.entity.Patient;
import demo.quanliyte.test.entity.User;
import demo.quanliyte.test.service.AppointmentService;
import demo.quanliyte.test.service.MedicalServiceService;
import demo.quanliyte.test.service.PatientService;
// import demo.quanliyte.test.service.PatientService;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin/clinicschedule/giaodien")
public class ClinicScheduleController {

    @Autowired
    private MedicalServiceService medicalServiceService;

    @Autowired
    private AppointmentService appointmentService;

    @Autowired
    private PatientService patientService;

    @GetMapping
    public String showBookingForm(Model model) {
        model.addAttribute("services", medicalServiceService.findAll());
        return "giaodien/lichhenkham"; // trả về trang đặt lịch
    }

    @GetMapping("/confirm")
    public String showConfirmPage() {
        // Nếu bạn muốn có trang confirm khi truy cập GET, ví dụ trả về trang lỗi hoặc
        // form
        return "giaodien/confirmBooking";
    }

    @PostMapping("/confirm")
    public String confirmBooking(
            @RequestParam("appointmentDate") String appointmentDate,
            @RequestParam("timeSlot") String timeSlot,
            @RequestParam("serviceId") Long serviceId,
            @RequestParam("reason") String reason,
            HttpSession session,
            Model model) {

        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser == null) {
            return "redirect:/admin/user/login";
        }

        Optional<MedicalServic> serviceOpt = medicalServiceService.findById(serviceId);
        if (serviceOpt.isEmpty()) {
            model.addAttribute("errorMessage", "Dịch vụ không tồn tại");
            return "giaodien/confirmBooking";
        }
        MedicalServic service = serviceOpt.get();

        model.addAttribute("loggedInUser", loggedInUser);
        model.addAttribute("appointmentDate", appointmentDate);
        model.addAttribute("timeSlot", timeSlot);
        model.addAttribute("service", service);
        model.addAttribute("reason", reason);

        return "giaodien/confirmBooking";
    }

    @PostMapping("/submit-lichhen")
    public String submitLichHen(
            @RequestParam("appointmentDate") String appointmentDateStr,
            @RequestParam("timeSlot") String timeSlot,
            @RequestParam("serviceId") Long serviceId,
            @RequestParam("reason") String reason,
            HttpSession session,
            RedirectAttributes redirectAttributes) {

        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser == null) {
            redirectAttributes.addFlashAttribute("errorMessage", "Bạn chưa đăng nhập.");
            return "redirect:/login";
        }

        Patient patient = patientService.findByUser(loggedInUser);
        if (patient == null) {
            redirectAttributes.addFlashAttribute("errorMessage", "Không tìm thấy thông tin bệnh nhân.");
            return "redirect:/admin/clinicschedule/giaodien";
        }

        Optional<MedicalServic> optionalService = medicalServiceService.findById(serviceId);
        if (!optionalService.isPresent()) {
            redirectAttributes.addFlashAttribute("errorMessage", "Dịch vụ không hợp lệ.");
            return "redirect:/admin/clinicschedule/giaodien";
        }

        MedicalServic service = optionalService.get();

        try {
            Appointment appointment = new Appointment();
            appointment.setPatient(patient);
            appointment.setMedicalService(service);
            appointment.setTimeSlot(timeSlot);
            appointment.setReason(reason);
            appointment.setStatus("Chờ xác nhận");
            appointment.setCreatedAt(LocalDateTime.now());

            LocalDate appointmentDate = LocalDate.parse(appointmentDateStr);
            appointment.setAppointmentDate(appointmentDate);
            appointment.setDepartment(service.getName());
            appointment.setDoctor(null); // nếu chưa có gán bác sĩ

            appointmentService.save(appointment);

            redirectAttributes.addFlashAttribute("successMessage", "Đặt lịch thành công!");
            return "redirect:/admin/clinicschedule/giaodien";
        } catch (Exception e) {
            // In lỗi chi tiết ra console
            e.printStackTrace();

            // Thông báo lỗi cho giao diện
            redirectAttributes.addFlashAttribute("errorMessage", "Lỗi khi lưu lịch hẹn: " + e.getMessage());
            return "redirect:/admin/clinicschedule/giaodien";
        }
    }

}
