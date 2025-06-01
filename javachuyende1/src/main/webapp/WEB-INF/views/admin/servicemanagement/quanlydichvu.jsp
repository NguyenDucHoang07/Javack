<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
            <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
                <!DOCTYPE html>
                <html lang="vi">

                <head>
                    <meta charset="UTF-8">
                    <title>Quản lý Dịch vụ Khám</title>
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
                        rel="stylesheet">
                    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
                </head>

                <body>
                    <div class="container mt-5">
                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <h2><i class="fas fa-stethoscope me-2"></i>Quản lý Dịch vụ Khám</h2>
                            <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addServiceModal">
                                <i class="fas fa-plus me-1"></i>Thêm Dịch vụ
                            </button>
                        </div>

                        <!-- Bảng danh sách dịch vụ -->
                        <table class="table table-bordered table-hover shadow-sm">
                            <thead class="table-dark text-center">
                                <tr>
                                    <th>#</th>
                                    <th>Tên Dịch vụ</th>
                                    <th>Mô tả</th>
                                    <th>Chi phí</th>
                                    <th>Hành động</th>
                                </tr>
                            </thead>
                            <tbody class="align-middle">
                                <c:forEach var="s" items="${services}">
                                    <tr>
                                        <td class="text-center">${s.id}</td>
                                        <td>${s.name}</td>
                                        <td>${s.description}</td>
                                        <td>
                                            <fmt:formatNumber value="${s.cost}" />
                                        </td>


                                        <td>
                                            <a href="${pageContext.request.contextPath}/quanlydichvu/edit/${s.id}"
                                                class="btn btn-info btn-sm me-1">Sửa</a>
                                            <form
                                                action="${pageContext.request.contextPath}/quanlydichvu/delete/${s.id}"
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

                    <!-- Modal Thêm Dịch vụ -->
                    <div class="modal fade" id="addServiceModal" tabindex="-1" aria-labelledby="addServiceModalLabel"
                        aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <form:form action="/quanlydichvu/save" method="post" modelAttribute="newService">
                                    <div class="modal-header bg-primary text-white">
                                        <h5 class="modal-title" id="addServiceModalLabel"><i
                                                class="fas fa-plus-circle me-2"></i>Thêm Dịch vụ Khám</h5>
                                        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"
                                            aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <form:hidden path="id" />
                                        <div class="mb-3">
                                            <label class="form-label">Tên Dịch vụ</label>
                                            <form:input path="name" class="form-control" />
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">Mô tả</label>
                                            <form:textarea path="description" class="form-control" rows="3" />
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">Chi phí</label>
                                            <form:input path="cost" class="form-control" type="number" min="0" />
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary"
                                            data-bs-dismiss="modal">Hủy</button>
                                        <button type="submit" class="btn btn-success">Lưu</button>
                                    </div>
                                </form:form>
                            </div>
                        </div>
                    </div>

                    <!-- Bootstrap JS -->
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
                </body>

                </html>