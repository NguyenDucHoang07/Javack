<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8" />
    <title>Quản lý Hóa đơn & Thanh toán</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
</head>
<body>
<div class="container mt-4">
    <h2 class="mb-4"><i class="fas fa-file-invoice-dollar"></i> Quản lý Hóa đơn & Thanh toán</h2>

    <!-- Nút tạo hóa đơn mới -->
    <button class="btn btn-primary mb-3" data-bs-toggle="modal" data-bs-target="#invoiceModal">
        Tạo Hóa đơn mới
    </button>

    <!-- Bảng danh sách hóa đơn -->
    <table class="table table-bordered table-hover align-middle">
        <thead class="table-dark">
            <tr>
                <th>Mã hóa đơn</th>
                <th>Khách hàng</th>
                <th>Ngày tạo</th>
                <th>Tổng tiền (VNĐ)</th>
                <th>Trạng thái</th>
                <th>Hành động</th>
            </tr>
        </thead>
        <tbody>
            <!-- Dữ liệu mẫu -->
            <tr>
                <td>HD001</td>
                <td>Nguyễn Văn A</td>
                <td>2025-05-10</td>
                <td>1,500,000</td>
                <td><span class="badge bg-success">Đã thanh toán</span></td>
                <td>
                    <button class="btn btn-sm btn-info" data-bs-toggle="modal" data-bs-target="#invoiceDetailModal">Xem</button>
                    <button class="btn btn-sm btn-warning" data-bs-toggle="modal" data-bs-target="#paymentModal">Thanh toán</button>
                </td>
            </tr>
            <tr>
                <td>HD002</td>
                <td>Trần Thị B</td>
                <td>2025-05-11</td>
                <td>2,300,000</td>
                <td><span class="badge bg-danger">Chưa thanh toán</span></td>
                <td>
                    <button class="btn btn-sm btn-info" data-bs-toggle="modal" data-bs-target="#invoiceDetailModal">Xem</button>
                    <button class="btn btn-sm btn-warning" data-bs-toggle="modal" data-bs-target="#paymentModal">Thanh toán</button>
                </td>
            </tr>
        </tbody>
    </table>
</div>

<!-- Modal xem chi tiết hóa đơn -->
<div class="modal fade" id="invoiceDetailModal" tabindex="-1" aria-labelledby="invoiceDetailModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="invoiceDetailModalLabel">Chi tiết Hóa đơn</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Đóng"></button>
      </div>
      <div class="modal-body">
        <!-- Nội dung chi tiết hóa đơn (ví dụ) -->
        <p><strong>Mã hóa đơn:</strong> HD001</p>
        <p><strong>Khách hàng:</strong> Nguyễn Văn A</p>
        <p><strong>Ngày tạo:</strong> 2025-05-10</p>
        <table class="table table-bordered">
          <thead>
            <tr>
              <th>Sản phẩm</th>
              <th>Số lượng</th>
              <th>Đơn giá (VNĐ)</th>
              <th>Thành tiền (VNĐ)</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>Áo sơ mi nam</td>
              <td>2</td>
              <td>250,000</td>
              <td>500,000</td>
            </tr>
            <tr>
              <td>Quần jean nữ</td>
              <td>1</td>
              <td>1,000,000</td>
              <td>1,000,000</td>
            </tr>
          </tbody>
        </table>
        <p><strong>Tổng tiền:</strong> 1,500,000 VNĐ</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
      </div>
    </div>
  </div>
</div>

<!-- Modal tạo hóa đơn mới -->
<div class="modal fade" id="invoiceModal" tabindex="-1" aria-labelledby="invoiceModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <form>
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="invoiceModalLabel">Tạo Hóa đơn mới</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Đóng"></button>
        </div>
        <div class="modal-body">
          <div class="mb-3">
            <label for="customerName" class="form-label">Khách hàng</label>
            <input type="text" class="form-control" id="customerName" placeholder="Nhập tên khách hàng" required />
          </div>
          <div class="mb-3">
            <label for="invoiceDate" class="form-label">Ngày tạo</label>
            <input type="date" class="form-control" id="invoiceDate" required />
          </div>
          <div class="mb-3">
            <label for="totalAmount" class="form-label">Tổng tiền (VNĐ)</label>
            <input type="number" class="form-control" id="totalAmount" min="0" placeholder="Nhập tổng tiền" required />
          </div>
          <div class="mb-3">
            <label for="status" class="form-label">Trạng thái</label>
            <select class="form-select" id="status" required>
              <option value="">-- Chọn trạng thái --</option>
              <option value="Chưa thanh toán">Chưa thanh toán</option>
              <option value="Đã thanh toán">Đã thanh toán</option>
            </select>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
          <button type="submit" class="btn btn-primary">Lưu</button>
        </div>
      </div>
    </form>
  </div>
</div>

<!-- Modal thanh toán -->
<div class="modal fade" id="paymentModal" tabindex="-1" aria-labelledby="paymentModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <form>
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="paymentModalLabel">Thanh toán hóa đơn</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Đóng"></button>
        </div>
        <div class="modal-body">
          <div class="mb-3">
            <label for="paymentMethod" class="form-label">Phương thức thanh toán</label>
            <select class="form-select" id="paymentMethod" required>
              <option value="">-- Chọn phương thức --</option>
              <option value="Tiền mặt">Tiền mặt</option>
              <option value="Chuyển khoản">Chuyển khoản</option>
              <option value="Thẻ tín dụng">Thẻ tín dụng</option>
            </select>
          </div>
          <div class="mb-3">
            <label for="paymentDate" class="form-label">Ngày thanh toán</label>
            <input type="date" class="form-control" id="paymentDate" required />
          </div>
          <div class="mb-3">
            <label for="paymentAmount" class="form-label">Số tiền thanh toán (VNĐ)</label>
            <input type="number" class="form-control" id="paymentAmount" min="0" required />
          </div>
          <div class="mb-3">
            <label for="notes" class="form-label">Ghi chú</label>
            <textarea class="form-control" id="notes" rows="3" placeholder="Nhập ghi chú nếu có"></textarea>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
          <button type="submit" class="btn btn-primary">Xác nhận thanh toán</button>
        </div>
      </div>
    </form>
  </div>
</div>

</body>
</html>
