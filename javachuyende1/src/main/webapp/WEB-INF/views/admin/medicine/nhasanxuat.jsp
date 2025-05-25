<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

            <!DOCTYPE html>
            <html lang="vi">

            <head>
                <meta charset="UTF-8">
                <title>Quản lý Nhà sản xuất</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
                <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
                <style>
                    .btn-custom {
                        background-color: #4CAF50;
                        color: white;
                    }

                    .table-container {
                        overflow-x: auto;
                    }
                </style>
            </head>

            <body>
                <div class="container mt-5">
                    <!-- Modal thêm/sửa nhà sản xuất -->
                    <div class="modal fade" id="addManufacturerModal" tabindex="-1" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <form:form id="addManufacturerForm"
                                    action="${pageContext.request.contextPath}/quanlynhasanxuat/save"
                                    modelAttribute="manufacturer" method="post">
                                    <div class="modal-header">
                                        <h5 class="modal-title"><i class="fas fa-plus"></i> Thêm nhà sản xuất</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                    </div>
                                    <div class="modal-body">
                                        <form:hidden path="id" />

                                        <div class="mb-3">
                                            <label class="form-label">Mã nhà sản xuất</label>
                                            <form:input path="code" cssClass="form-control"
                                                placeholder="Tự động nếu bỏ trống" />
                                        </div>

                                        <div class="mb-3">
                                            <label class="form-label">Tên nhà sản xuất *</label>
                                            <form:input path="name" cssClass="form-control" required="true" />
                                        </div>

                                        <div class="mb-3">
                                            <label class="form-label">Địa chỉ</label>
                                            <form:input path="address" cssClass="form-control" />
                                        </div>

                                        <div class="mb-3">
                                            <label class="form-label">Số điện thoại</label>
                                            <form:input path="phone" cssClass="form-control" />
                                        </div>

                                        <div class="mb-3">
                                            <label class="form-label">Email</label>
                                            <form:input path="email" cssClass="form-control" />
                                        </div>



                                        <div class="mb-3">
                                            <label class="form-label">Ghi chú</label>
                                            <form:textarea path="note" cssClass="form-control" rows="3" />
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary"
                                            data-bs-dismiss="modal">Hủy</button>
                                        <button type="submit" class="btn btn-custom">Lưu</button>
                                    </div>
                                </form:form>
                            </div>
                        </div>
                    </div>

                    <!-- Quản lý nhà sản xuất -->
                    <div class="card">
                        <div class="card-header d-flex justify-content-between align-items-center">
                            <h5 class="mb-0"><i class="fas fa-industry"></i> Quản lý Nhà sản xuất</h5>
                            <button class="btn btn-custom" data-bs-toggle="modal"
                                data-bs-target="#addManufacturerModal">
                                <i class="fas fa-plus"></i> Thêm mới
                            </button>
                        </div>
                        <div class="card-body">
                            <!-- Bảng danh sách -->
                            <div class="table-container">
                                <table class="table table-striped table-hover">
                                    <thead class="table-dark">
                                        <tr>
                                            <th>Mã NSX</th>
                                            <th>Tên</th>
                                            <th>Địa chỉ</th>
                                            <th>Điện thoại</th>
                                            <th>Email</th>
                                            <th>Ghi chú</th>
                                            <th>Thao tác</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="item" items="${manufacturers}">
                                            <tr>
                                                <td>${item.code}</td>
                                                <td>${item.name}</td>
                                                <td>${item.address}</td>
                                                <td>${item.phone}</td>
                                                <td>${item.email}</td>
                                                <td>${item.note}</td>
                                                <td>
                                                    <!-- Nút Sửa (mở modal - xử lý bằng JS nếu cần) -->
                                                    <a href="${pageContext.request.contextPath}/quanlynhasanxuat/editnhasanxuat/${item.id}"
                                                        class="btn btn-info btn-sm me-1">Sửa</a>
                                                    <!-- Nút Xóa -->
                                                    <form
                                                        action="${pageContext.request.contextPath}/quanlynhasanxuat/deletenhasanxuat/${item.id}"
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
                    </div>
                </div>

                <!-- JS -->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
            </body>

            </html>