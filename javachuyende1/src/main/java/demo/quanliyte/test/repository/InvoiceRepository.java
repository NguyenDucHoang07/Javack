package demo.quanliyte.test.repository;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import demo.quanliyte.test.entity.Invoice;

public interface InvoiceRepository extends JpaRepository<Invoice, Long> {
    long countByStatus(String status);

    List<Invoice> findByInvoiceCodeContainingIgnoreCase(String keyword);

    List<Invoice> findByStatus(String status);

    @Query("SELECT SUM(i.totalAmount) FROM Invoice i WHERE i.status = 'Đã thanh toán'")
    BigDecimal getTotalPaidAmountSum();

    @Query("SELECT i FROM Invoice i WHERE "
            + "(:startDate IS NULL OR i.createdDate >= :startDate) "
            + "AND (:endDate IS NULL OR i.createdDate <= :endDate)")
    List<Invoice> findByCreatedDateBetween(
            @Param("startDate") LocalDate startDate,
            @Param("endDate") LocalDate endDate);

}
