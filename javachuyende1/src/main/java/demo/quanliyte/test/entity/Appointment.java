package demo.quanliyte.test.entity;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;

@Entity
public class Appointment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id; // Mã lịch hẹn

    @ManyToOne
    private Patient patient; // Bệnh nhân đặt lịch hẹn

    @ManyToOne
    private User doctor; // Bác sĩ phụ trách lịch hẹn (là user có vai trò DOCTOR)

    private LocalDate appointmentDate; // Ngày khám (yyyy-MM-dd)

    private String timeSlot; // Khung giờ khám (ví dụ: "08:00 - 09:00")

    private String department; // Chuyên khoa khám (ví dụ: "Nội tổng quát", "Tai mũi họng")

    private String reason; // Lý do đặt lịch (triệu chứng hoặc yêu cầu của bệnh nhân)

    private String status; // Trạng thái lịch hẹn

    private LocalDateTime createdAt; // Thời gian tạo lịch hẹn

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Patient getPatient() {
        return patient;
    }

    public void setPatient(Patient patient) {
        this.patient = patient;
    }

    public User getDoctor() {
        return doctor;
    }

    public void setDoctor(User doctor) {
        this.doctor = doctor;
    }

    public LocalDate getAppointmentDate() {
        return appointmentDate;
    }

    public void setAppointmentDate(LocalDate appointmentDate) {
        this.appointmentDate = appointmentDate;
    }

    public String getTimeSlot() {
        return timeSlot;
    }

    public void setTimeSlot(String timeSlot) {
        this.timeSlot = timeSlot;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getFormattedCreatedAt() {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
        return createdAt != null ? createdAt.format(formatter) : "";
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

}
