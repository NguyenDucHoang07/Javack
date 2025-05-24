package demo.quanliyte.test.controller;

import java.util.List;
import java.util.Optional;

import demo.quanliyte.test.entity.Appointment;
import demo.quanliyte.test.entity.Role;
import demo.quanliyte.test.entity.User;
import demo.quanliyte.test.service.AppointmentService;
import demo.quanliyte.test.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class AppointmentController {

    @Autowired
    private AppointmentService appointmentService;

    @Autowired
    private UserService userService;

    @GetMapping("/appointments")
    public String showAppointmentForm(Model model) {
        List<User> doctors = userService.getDoctors(); // lấy danh sách bác sĩ

        model.addAttribute("listDoctor", doctors);
        model.addAttribute("appointment", new Appointment()); // để binding form

        return "admin/clinicschedule/quanlylichkham"; // tên view jsp
    }

}
