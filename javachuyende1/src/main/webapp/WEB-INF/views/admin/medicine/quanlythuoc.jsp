<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8" />
    <title>Quản lý Thuốc & Vật tư y tế</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
</head>
<body>
<div class="container mt-4">
    <h2 class="mb-4"><i class="fas fa-pills"></i> Quản lý Thuốc & Vật tư y tế</h2>

    <!-- Nút thêm mới -->
    <button class="btn btn-primary mb-3" data-bs-toggle="modal" data-bs-target="#medicationModal">
        Thêm Thuốc / Vật tư mới
    </button>

    <!-- Bảng danh sách thuốc/vật tư -->
    <table class="table table-bordered table-hover align-middle">
        <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Tên Thuốc / Vật tư</th>
                <th>Loại</th>
                <th>Số lượng</th>
                <th>Đơn vị</th>
                <th>Ngày sản xuất</th>
                <th>Hạn sử dụng</th>
                <th>Hành động</th>
            </tr>
        </thead>
        <tbody>
            <!-- Dữ liệu mẫu -->
            <tr>
                <td>1</td>
                <td>Paracetamol 500mg</td>
                <td>Thuốc</td>
                <td>100</td>
                <td>Viên</td>
                <td>2024-01-15</td>
                <td>2026-12-31</td>
                <td>
                    <button class="btn btn-sm btn-warning" data-bs-toggle="modal" data-bs-target="#medicationModal">Sửa</button>
                    <button class="btn btn-sm btn-danger">Xoá</button>
                </td>
            </tr>
            <tr>
                <td>2</td>
                <td>Bông y tế</td>
                <td>Vật tư y tế</td>
                <td>50</td>
                <td>Gói</td>
                <td>2023-11-10</td>
                <td>2027-05-01</td>
                <td>
                    <button class="btn btn-sm btn-warning" data-bs-toggle="modal" data-bs-target="#medicationModal">Sửa</button>
                    <button class="btn btn-sm btn-danger">Xoá</button>
                </td>
            </tr>
        </tbody>
    </table>
</div>

<!-- Modal Thêm/Sửa thuốc/vật tư -->
<div class="modal fade" id="medicationModal" tabindex="-1" aria-labelledby="medicationModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <form>
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="medicationModalLabel">Thêm / Sửa Thuốc & Vật tư y tế</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Đóng"></button>
        </div>
        <div class="modal-body">
            <div class="mb-3">
                <label for="medName" class="form-label">Tên Thuốc / Vật tư</label>
                <input type="text" class="form-control" id="medName" placeholder="Nhập tên thuốc hoặc vật tư" required>
            </div>
            <div class="mb-3">
                <label for="medType" class="form-label">Loại</label>
                <select class="form-select" id="medType" required>
                    <option value="">-- Chọn loại --</option>
                    <option value="Thuốc">Thuốc</option>
                    <option value="Vật tư y tế">Vật tư y tế</option>
                </select>
            </div>
            <div class="mb-3">
                <label for="quantity" class="form-label">Số lượng</label>
                <input type="number" class="form-control" id="quantity" min="0" placeholder="Nhập số lượng" required>
            </div>
            <div class="mb-3">
                <label for="unit" class="form-label">Đơn vị</label>
                <input type="text" class="form-control" id="unit" placeholder="Ví dụ: Viên, Gói, Chai..." required>
            </div>
            <div class="mb-3">
                <label for="manufactureDate" class="form-label">Ngày sản xuất</label>
                <input type="date" class="form-control" id="manufactureDate" required>
            </div>
            <div class="mb-3">
                <label for="expiryDate" class="form-label">Hạn sử dụng</label>
                <input type="date" class="form-control" id="expiryDate" required>
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
</body>
</html>
