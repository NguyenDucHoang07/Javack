package demo.quanliyte.test.service;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import demo.quanliyte.test.entity.Appointment;
import demo.quanliyte.test.entity.Invoice;
import demo.quanliyte.test.entity.InvoiceItem;
import demo.quanliyte.test.entity.MedicalServic;
import demo.quanliyte.test.repository.InvoiceRepository;
import demo.quanliyte.test.repository.MedicalServiceRepository;
import jakarta.transaction.Transactional;

@Service
public class InvoiceService {

    @Autowired
    private InvoiceRepository invoiceRepository;

    @Autowired
    private MedicalServiceRepository medicalServiceRepository;

    @Transactional
    public void saveInvoiceWithItems(Invoice invoice, List<Long> serviceIds, List<Integer> quantities,
            Double totalAmount) {
        // Gán mã hóa đơn nếu cần
        if (invoice.getInvoiceCode() == null || invoice.getInvoiceCode().isEmpty()) {
            invoice.setInvoiceCode(generateRandomInvoiceCode());
        }

        // Ngày tạo
        if (invoice.getCreatedDate() == null) {
            invoice.setCreatedDate(LocalDate.now());
        }

        // Gán tổng tiền
        invoice.setTotalAmount(totalAmount);

        // Khởi tạo danh sách items
        List<InvoiceItem> items = new ArrayList<>();
        for (int i = 0; i < serviceIds.size(); i++) {
            Long serviceId = serviceIds.get(i);
            int quantity = quantities.get(i);

            MedicalServic service = medicalServiceRepository.findById(serviceId).orElse(null);
            if (service != null) {
                InvoiceItem item = new InvoiceItem();
                item.setInvoice(invoice);
                item.setService(service);
                item.setQuantity(quantity);
                item.setUnitPrice(service.getCost());
                item.setTotalPrice(quantity * service.getCost());
                items.add(item);
            }
        }

        // Gắn items vào invoice
        invoice.setItems(items);

        // Lưu invoice kèm item (cascade = ALL)
        invoiceRepository.save(invoice);
    }

    public List<Invoice> findAll() {
        return invoiceRepository.findAll();
    }

    private String generateRandomInvoiceCode() {
        String prefix = "HD";
        int randomNumber = (int) (Math.random() * 90000) + 10000; // số ngẫu nhiên từ 10000-99999
        return prefix + randomNumber;
    }

    public void deleteById(Long id) {
        invoiceRepository.deleteById(id);
    }

    public Invoice findById(Long id) {
        return invoiceRepository.findById(id).orElse(null);
    }

    public long getTotalInvoices() {
        return invoiceRepository.count();
    }

    public long getPaidInvoices() {
        return invoiceRepository.countByStatus("Đã thanh toán");
    }

    public long getUnpaidInvoices() {
        return invoiceRepository.countByStatus("Chưa thanh toán");
    }

    public BigDecimal getTotalPaidAmountSum() {
        BigDecimal sum = invoiceRepository.getTotalPaidAmountSum();
        return sum != null ? sum : BigDecimal.ZERO;
    }

    public List<Invoice> searchByKeyword(String keyword) {
        return invoiceRepository.findByInvoiceCodeContainingIgnoreCase(keyword);
    }

    public List<Invoice> searchByStatus(String status) {
        return invoiceRepository.findByStatus(status);
    }

    public List<Invoice> findByDateRange(LocalDate startDate, LocalDate endDate) {
        return invoiceRepository.findByCreatedDateBetween(startDate, endDate);
    }

}
