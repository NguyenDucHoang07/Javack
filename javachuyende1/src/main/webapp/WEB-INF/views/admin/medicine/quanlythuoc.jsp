<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!DOCTYPE html>
        <html lang="vi">

        <head>
            <meta charset="UTF-8">
            <title>Quản lý Thuốc</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
            <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
        </head>

        <body class="bg-light">
            <div class="container py-4">
                <!-- Tiêu đề và nút thêm -->
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <h3><i class="fas fa-pills"></i> Danh sách thuốc</h3>
                    <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addMedicineModal">
                        <i class="fas fa-plus"></i> Thêm thuốc
                    </button>
                </div>

                <!-- Bảng danh sách thuốc -->
                <div class="table-responsive">
                    <table class="table table-bordered table-striped">
                        <thead class="table-dark">
                            <tr>
                                <th>Tên thuốc</th>
                                <th>Hoạt chất</th>
                                <th>Hàm lượng</th>
                                <th>Đơn vị</th>
                                <th>Số lượng</th>
                                <th>Hạn dùng</th>
                                <th>Giá bán</th>
                                <th>Nhà sản xuất</th>
                                <th>Thao tác</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="med" items="${medicines}">
                                <tr>
                                    <td>${med.name}</td>
                                    <td>${med.activeIngredient}</td>
                                    <td>${med.dosage}</td>
                                    <td>${med.unit}</td>
                                    <td>${med.quantity}</td>
                                    <td>${med.expiryDate}</td>
                                    <td>${med.salePrice} VNĐ</td>
                                    <td>${med.manufacturer.name}</td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/quanlythuoc/editthuoc/${med.id}"
                                            class="btn btn-info btn-sm me-1">Sửa</a>
                                        <form
                                            action="${pageContext.request.contextPath}/quanlythuoc/deletethuoc/${med.id}"
                                            method="post" style="display:inline;"
                                            onsubmit="return confirm('Bạn có chắc muốn xoá bệnh nhân này?');">
                                            <button type="submit" class="btn btn-danger btn-sm">Xoá</button>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- Modal thêm thuốc -->
            <div class="modal fade" id="addMedicineModal" tabindex="-1" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <form action="${pageContext.request.contextPath}/quanlythuoc/add" method="post">
                            <div class="modal-header">
                                <h5 class="modal-title"><i class="fas fa-plus"></i> Thêm thuốc mới</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                            </div>
                            <div class="modal-body row">
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label class="form-label">Tên thuốc *</label>
                                        <input type="text" class="form-control" name="name" required>
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">Hoạt chất *</label>
                                        <input type="text" class="form-control" name="activeIngredient" required>
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">Hàm lượng *</label>
                                        <input type="text" class="form-control" name="dosage" required>
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">Đơn vị *</label>
                                        <select class="form-select" name="unit" required>
                                            <option value="">Chọn đơn vị</option>
                                            <option>Viên</option>
                                            <option>Ống</option>
                                            <option>Chai</option>
                                            <option>Hộp</option>
                                        </select>
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">Số lượng *</label>
                                        <input type="number" class="form-control" name="quantity" required>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label class="form-label">Hạn sử dụng *</label>
                                        <input type="date" class="form-control" name="expiryDate" required>
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">Nhà sản xuất *</label>
                                        <select class="form-select" name="manufacturer.id" required>
                                            <option value="">Chọn nhà sản xuất</option>
                                            <c:forEach var="m" items="${manufacturers}">
                                                <option value="${m.id}">${m.name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">Giá nhập *</label>
                                        <input type="number" step="0.01" class="form-control" name="purchasePrice"
                                            required>
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">Giá bán *</label>
                                        <input type="number" step="0.01" class="form-control" name="salePrice" required>
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">Ghi chú</label>
                                        <textarea class="form-control" name="note" rows="2"></textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                                <button type="submit" class="btn btn-primary">Lưu</button>x
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <!-- JS Bootstrap -->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

        </body>

        </html>