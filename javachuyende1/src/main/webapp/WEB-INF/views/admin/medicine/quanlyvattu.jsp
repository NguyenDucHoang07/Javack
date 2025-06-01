<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!DOCTYPE html>
        <html lang="vi">

        <head>
            <meta charset="UTF-8">
            <title>Quản lý Vật tư Y tế</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
            <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
        </head>

        <body>
            <div class="container mt-4">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <h4><i class="fas fa-boxes"></i> Quản lý Vật tư Y tế</h4>
                    <button class="btn btn-success" data-bs-toggle="modal" data-bs-target="#addSupplyModal">
                        <i class="fas fa-plus"></i> Thêm mới
                    </button>
                </div>

                <div class="table-responsive">
                    <table class="table table-bordered table-hover">
                        <thead class="table-success">
                            <tr>
                                <th>Mã VT</th>
                                <th>Tên</th>
                                <th>Loại</th>
                                <th>Số lượng</th>
                                <th>Đơn vị</th>
                                <th>Hạn dùng</th>
                                <th>Nhà cung cấp</th>
                                <th>Giá nhập</th>
                                <th>Giá bán</th>
                                <th>Ngày nhập</th>
                                <th>Ghi chú</th>
                                <th>Hành động</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="supply" items="${supplies}">
                                <tr>
                                    <td>${supply.code}</td>
                                    <td>${supply.name}</td>
                                    <td>${supply.type}</td>
                                    <td>${supply.quantity}</td>
                                    <td>${supply.unit}</td>
                                    <td>${supply.expiryDate}</td>
                                    <td>${supply.manufacturer.name}</td>
                                    <td>${supply.purchasePrice}</td>
                                    <td>${supply.sellingPrice}</td>
                                    <td>${supply.entryDate}</td>
                                    <td>${supply.note}</td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/quanlyvattu/editvattu/${supply.id}"
                                            class="btn btn-info btn-sm me-1">Sửa</a>
                                        <form
                                            action="${pageContext.request.contextPath}/quanlyvattu/deletevattu/${supply.id}"
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

            <!-- Modal Thêm Vật Tư -->
            <div class="modal fade" id="addSupplyModal" tabindex="-1" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <form action="${pageContext.request.contextPath}/quanlyvattu/save" method="post">
                            <div class="modal-header">
                                <h5 class="modal-title">Thêm Vật tư mới</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                            </div>
                            <div class="modal-body row">
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label class="form-label">Mã vật tư *</label>
                                        <input type="text" class="form-control" name="code" required>
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">Tên vật tư *</label>
                                        <input type="text" class="form-control" name="name" required>
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">Loại vật tư *</label>
                                        <select class="form-control" name="type" required>
                                            <option value="" disabled selected>-- Chọn loại vật tư --</option>
                                            <option value="Dụng cụ">Dụng cụ</option>
                                            <option value="Trang thiết bị">Trang thiết bị</option>
                                            <option value="Vật liệu tiêu hao">Vật liệu tiêu hao</option>
                                            <option value="Khác">Khác</option>
                                        </select>
                                    </div>

                                    <div class="mb-3">
                                        <label class="form-label">Số lượng *</label>
                                        <input type="number" class="form-control" name="quantity" required>
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">Đơn vị *</label>
                                        <select class="form-control" name="unit" required>
                                            <option value="" disabled selected>-- Chọn đơn vị --</option>
                                            <option value="Cái">Cái</option>
                                            <option value="Hộp">Hộp</option>
                                            <option value="Bộ">Bộ</option>
                                            <option value="Tuýp">Tuýp</option>
                                            <option value="Chai">Chai</option>
                                            <option value="Lọ">Lọ</option>
                                            <option value="Viên">Viên</option>
                                            <option value="Khác">Khác</option>
                                        </select>
                                    </div>

                                    <div class="mb-3">
                                        <label class="form-label">Hạn sử dụng</label>
                                        <input type="date" class="form-control" name="expiryDate">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label class="form-label">Nhà cung cấp *</label>
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
                                        <input type="number" step="0.01" class="form-control" name="sellingPrice"
                                            required>
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">Ngày nhập *</label>
                                        <input type="date" class="form-control" name="entryDate" required>
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">Ghi chú</label>
                                        <textarea class="form-control" name="note" rows="2"></textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                                <button type="submit" class="btn btn-success">Lưu</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <!-- Bootstrap JS -->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        </body>

        </html>