package demo.quanliyte.test.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import demo.quanliyte.test.entity.Invoice;
import demo.quanliyte.test.entity.InvoiceItemDTO;
import demo.quanliyte.test.entity.invoiceDTO;
import demo.quanliyte.test.service.InvoiceService;
import demo.quanliyte.test.service.MedicalServiceService;
import demo.quanliyte.test.service.PatientService;
import demo.quanliyte.test.service.UserService;

@Controller
@RequestMapping("/invoices")
public class InvoiceController {

    @Autowired
    private InvoiceService invoiceService;

    @Autowired
    private PatientService patientService;

    @Autowired
    private UserService userService; // giả sử bác sĩ là User

    @Autowired
    private MedicalServiceService medicalServiceService; // giả sử bác sĩ là User

    private static final DateTimeFormatter DATE_FORMATTER = DateTimeFormatter.ofPattern("dd/MM/yyyy");

    @GetMapping
    public String searchInvoices(
            @RequestParam(value = "keyword", required = false) String keyword,
            @RequestParam(value = "status", required = false) String status,
            @RequestParam(value = "startDate", required = false) String startDate,
            @RequestParam(value = "endDate", required = false) String endDate,
            Model model) {
        LocalDate start = null;
        LocalDate end = null;
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

        try {
            if (startDate != null && !startDate.isEmpty()) {
                start = LocalDate.parse(startDate, formatter);
            }
            if (endDate != null && !endDate.isEmpty()) {
                end = LocalDate.parse(endDate, formatter);
            }
        } catch (DateTimeParseException e) {
            e.printStackTrace();
            // Bạn có thể xử lý lỗi format ngày ở đây nếu muốn
        }
        List<Invoice> invoices;

        if ((keyword != null && !keyword.trim().isEmpty()) && (status != null && !status.isEmpty())) {
            // Có keyword và status, gọi method tìm kiếm kết hợp (nếu bạn có)
            invoices = invoiceService.searchByKeyword(keyword.trim());
        } else if (keyword != null && !keyword.trim().isEmpty()) {
            invoices = invoiceService.searchByKeyword(keyword.trim());
        } else if (status != null && !status.isEmpty()) {
            invoices = invoiceService.searchByStatus(status);
        } else if (start != null && end != null) {
            // Lọc theo khoảng ngày nếu startDate và endDate hợp lệ
            invoices = invoiceService.findByDateRange(start, end);
        } else {
            invoices = invoiceService.findAll();
        }

        // Thêm các attribute cho form và dữ liệu
        model.addAttribute("invoice", new Invoice());
        model.addAttribute("patients", patientService.getAllPatient());
        model.addAttribute("doctors", userService.getDoctors());
        model.addAttribute("services", medicalServiceService.findAll());

        model.addAttribute("totalInvoices", invoiceService.getTotalInvoices());
        model.addAttribute("paidInvoices", invoiceService.getPaidInvoices());
        model.addAttribute("unpaidInvoices", invoiceService.getUnpaidInvoices());
        model.addAttribute("totalPaidAmount", invoiceService.getTotalPaidAmountSum());
        model.addAttribute("startDate", startDate);
        model.addAttribute("endDate", endDate);

        model.addAttribute("invoices", invoices);
        return "admin/invoiceandpayment/hoadonvathanhtoan";
    }

    @GetMapping("/detail/{id}")
    @ResponseBody
    public ResponseEntity<invoiceDTO> getInvoiceDetail(@PathVariable("id") Long id) {
        Invoice invoice = invoiceService.findById(id); // Hoặc dùng Optional xử lý lỗi

        invoiceDTO dto = new invoiceDTO();
        dto.setId(invoice.getId());
        dto.setInvoiceCode(invoice.getInvoiceCode());
        dto.setCreatedDate(invoice.getCreatedDate().toString());
        dto.setTotalAmount(invoice.getTotalAmount());
        dto.setStatus(invoice.getStatus());
        dto.setPaymentMethod(invoice.getPaymentMethod());
        dto.setNote(invoice.getNote());

        // Patient info
        dto.setPatientName(invoice.getPatient().getFullName());
        dto.setPatientPhone(invoice.getPatient().getPhone());
        dto.setPatientAddress(invoice.getPatient().getAddress());

        // Doctor info
        if (invoice.getDoctor() != null) {
            dto.setDoctorName(invoice.getDoctor().getName());
        }

        // Items
        List<InvoiceItemDTO> itemDTOs = invoice.getItems().stream().map(item -> {
            InvoiceItemDTO itemDto = new InvoiceItemDTO();
            itemDto.setServiceName(item.getService().getName());
            itemDto.setQuantity(item.getQuantity());
            itemDto.setUnitPrice(item.getUnitPrice());
            itemDto.setTotalPrice(item.getTotalPrice());
            return itemDto;
        }).collect(Collectors.toList());

        dto.setItems(itemDTOs);

        return ResponseEntity.ok(dto);
    }

    // @PostMapping("/create")
    // public String createInvoice(@ModelAttribute("invoice") Invoice invoice) {
    // invoiceService.save(invoice);
    // return "redirect:/invoices";
    // }

    @PostMapping("/create")
    public String createInvoice(@ModelAttribute("invoice") Invoice invoice,
            @RequestParam("selectedServices") List<Long> serviceIds,
            @RequestParam("quantities") List<Integer> quantities,
            @RequestParam("totalAmount") Double totalAmount) {

        invoiceService.saveInvoiceWithItems(invoice, serviceIds, quantities, totalAmount);
        return "redirect:/invoices";
    }

    @GetMapping("/edit/{id}")
    public String editInvoice(@PathVariable Long id, Model model) {
        Invoice invoice = invoiceService.findById(id);
        if (invoice == null)
            return "redirect:/invoices";

        model.addAttribute("invoice", invoice);
        model.addAttribute("patients", patientService.getAllPatient());
        model.addAttribute("doctors", userService.getAllUsers());
        return "invoice/form";
    }

    @GetMapping("/delete/{id}")
    public String deleteInvoice(@PathVariable Long id) {
        invoiceService.deleteById(id);
        return "redirect:/invoices";
    }

}
