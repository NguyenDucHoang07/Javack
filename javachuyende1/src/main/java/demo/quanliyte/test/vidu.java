package demo.quanliyte.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Controller
public class vidu {
    @GetMapping("giaodien/home")
    public String homePage() {
        return "giaodien/Home"; // tương ứng home.jsp trong /WEB-INF/views
    }

    @GetMapping("giaodien/bacsi")
    public String bacsiPage() {
        return "giaodien/bacsi"; // tương ứng home.jsp trong /WEB-INF/views
    }

    @GetMapping("giaodien/thuocvattu")
    public String showThuocVattuPage() {
        return "giaodien/thuoc_vattu"; // trả về thuoc-vattu.jsp
    }

    @GetMapping("giaodien/lichhenkham")
    public String lichhenkhamPage() {
        return "giaodien/lichhenkham";
    }

    @GetMapping("giaodien/chaomung")
    public String chaomung() {
        return "giaodien/chaomung"; // tương ứng home.jsp trong /WEB-INF/views
    }

    @GetMapping("giaodien/madoctor")
    public String doctorPage() {
        return "giaodien/manage_doctor"; // tương ứng home.jsp trong /WEB-INF/views
    }

    @GetMapping("giaodien/mapatient")
    public String patientPage() {
        return "giaodien/manage_patient"; // tương ứng home.jsp trong /WEB-INF/views
    }

    @GetMapping("giaodien/updoctor")
    public String updoctorPage() {
        return "giaodien/update_doctor"; // tương ứng home.jsp trong /WEB-INF/views
    }

    @GetMapping("giaodien/uppatient")
    public String uppatientPage() {
        return "giaodien/update_patient"; // tương ứng home.jsp trong /WEB-INF/views
    }

    @GetMapping("/login")
    public String login() {
        return "login"; // trả về login.jsp
    }

    @GetMapping("/")
    public String loginForm() {
        return "admin/dashboard/show"; // trả về login.jsp
    }

    // @GetMapping("/quanlynguoidung")
    // public String userManage() {
    // return "admin/user/quanlynguoidung"; // trả về login.jsp
    // }

    // @GetMapping("/quanlybenhnhan")
    // public String patienManage() {
    // return "admin/patient/quanlybenhnhan"; // trả về login.jsp
    // }

    @GetMapping("/quanlybacsi")
    public String doctorManage() {
        return "admin/doctor/quanlybacsivanhanvien"; // trả về login.jsp
    }

    @GetMapping("/quanlylichkham")
    public String scheduleManage() {
        return "admin/clinicschedule/quanlylichkham"; // trả về login.jsp
    }

    @GetMapping("/quanlythuoc")
    public String medicineManage() {
        return "admin/medicine/quanlythuoc"; // trả về login.jsp
    }

    @GetMapping("/quanlyhoadon")
    public String hoadonManage() {
        return "admin/invoiceandpayment/hoadonvathanhtoan"; // trả về login.jsp
    }

    @GetMapping("/quanlythongke")
    public String thongkeManage() {
        return "admin/reportandstatistics/thongke"; // trả về login.jsp
    }
}