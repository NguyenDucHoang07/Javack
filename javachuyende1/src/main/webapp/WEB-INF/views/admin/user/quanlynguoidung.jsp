<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


                <!DOCTYPE html>
                <html lang="vi">

                <head>
                    <meta charset="UTF-8" />
                    <title>Quản lý Người dùng</title>
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
                        rel="stylesheet" />
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css"
                        rel="stylesheet" />
                    <link href="https://cdn.datatables.net/1.13.6/css/dataTables.bootstrap5.min.css" rel="stylesheet" />
                    <style>
                        .avatar-sm {
                            width: 40px;
                            height: 40px;
                            object-fit: cover;
                            border-radius: 50%;
                        }

                        .status-badge {
                            font-size: 0.8rem;
                            padding: 0.35em 0.65em;
                        }
                    </style>
                </head>

                <body>

                    <div class="container-fluid px-4 mt-4">
                        <!-- Header -->


                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <div>
                                <a href="/" class="btn btn-outline-secondary me-2">
                                    <i class="bi bi-arrow-left"></i> Quay lại
                                </a>
                            </div>
                            <h1 class="mb-0"><i class="bi bi-people-fill me-2"></i>Quản lý Người dùng</h1>
                            <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addUserModal">
                                <i class="bi bi-plus-lg"></i> Thêm người dùng
                            </button>
                        </div>


                        <div class="row mb-4">
                            <div class="col-md-3">
                                <div class="card bg-primary text-white">
                                    <div class="card-body d-flex justify-content-between align-items-center">
                                        <div>
                                            <h6 class="card-title">Tổng người dùng</h6>
                                            <h2 class="mb-0">${totalUsers}</h2>
                                        </div>
                                        <i class="bi bi-people fs-1 opacity-50"></i>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="card bg-success text-white">
                                    <div class="card-body d-flex justify-content-between align-items-center">
                                        <div>
                                            <h6 class="card-title">Đang hoạt động</h6>
                                            <h2 class="mb-0">${activeUsers}</h2>
                                        </div>
                                        <i class="bi bi-check-circle fs-1 opacity-50"></i>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="card bg-warning text-white">
                                    <div class="card-body d-flex justify-content-between align-items-center">
                                        <div>
                                            <h6 class="card-title">Bác sĩ</h6>
                                            <h2 class="mb-0">${doctorUsers}</h2>
                                        </div>
                                        <i class="bi bi-heart-pulse fs-1 opacity-50"></i>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="card bg-danger text-white">
                                    <div class="card-body d-flex justify-content-between align-items-center">
                                        <div>
                                            <h6 class="card-title">Đã khóa</h6>
                                            <h2 class="mb-0">${lockedUsers}</h2>
                                        </div>
                                        <i class="bi bi-lock fs-1 opacity-50"></i>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Toolbar -->
                        <form method="GET" action="/users/loc">
                            <div class="card mb-4">
                                <div class="card-body d-flex justify-content-between align-items-center">
                                    <div class="d-flex">
                                        <select name="roleFilter" class="form-select form-select-sm me-2"
                                            style="width: 150px;">
                                            <option value="" <c:if test="${empty roleFilter}">selected</c:if>
                                                >Lọc theo vai trò</option>

                                            <option value="Admin" <c:if test="${roleFilter == 'Admin'}">selected
                                                </c:if>
                                                >Admin</option>

                                            <option value="Bác sĩ" <c:if test="${roleFilter == 'Bác sĩ'}">selected
                                                </c:if>
                                                >Bác sĩ</option>

                                            <option value="Nhân viên" <c:if test="${roleFilter == 'Nhân viên'}">
                                                selected
                                                </c:if>
                                                >Nhân viên</option>

                                        </select>

                                        <select name="statusFilter" class="form-select form-select-sm"
                                            style="width: 150px;">
                                            <option value="" <c:if test="${empty statusFilter}">selected</c:if>
                                                >Lọc trạng thái</option>

                                            <option value="Kích hoạt" <c:if test="${statusFilter == 'Kích hoạt'}">
                                                selected</c:if>
                                                >Hoạt động</option>

                                            <option value="Đã khóa" <c:if test="${statusFilter == 'Đã khóa'}">
                                                selected
                                                </c:if>
                                                >Đã khóa</option>

                                        </select>

                                    </div>
                                    <div>
                                        <button type="submit" class="btn btn-sm btn-outline-primary me-2">Lọc</button>
                                        <button class="btn btn-sm btn-outline-secondary me-2">
                                            <i class="bi bi-download"></i> Xuất Excel
                                        </button>
                                        <button class="btn btn-sm btn-outline-secondary">
                                            <i class="bi bi-upload"></i> Import
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </form>


                        <!-- Main Table -->
                        <div class="card">
                            <div class="card-body">
                                <table id="usersTable" class="table table-striped table-hover" style="width:100%">
                                    <thead>
                                        <tr>
                                            <th width="50px">STT</th>
                                            <th width="70px">Ảnh</th>
                                            <th>Họ tên</th>
                                            <th>Email</th>
                                            <th>Số điện thoại</th>
                                            <th>Vai trò</th>
                                            <th>Trạng thái</th>
                                            <th>Ngày tạo</th>
                                            <th width="120px">Thao tác</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="user" items="${users}" varStatus="loop">
                                            <tr>
                                                <td>${loop.index + 1}</td>
                                                <td><img src="${user.avatar != null ? user.avatar : 'https://via.placeholder.com/40?text=NA'}"
                                                        alt="Avatar" class="avatar-sm" width="40" height="40" />


                                                </td>

                                                <td>${user.name}</td>
                                                <td>${user.email}</td>
                                                <td>${user.phone}</td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${user.role.name == 'Admin'}">
                                                            <span class="badge bg-danger">Admin</span>
                                                            <!-- Đỏ nổi bật -->
                                                        </c:when>
                                                        <c:when test="${user.role.name == 'Bác sĩ'}">
                                                            <span class="badge bg-success">Bác sĩ</span>
                                                            <!-- Xanh lá -->
                                                        </c:when>
                                                        <c:when test="${user.role.name == 'Nhân viên'}">
                                                            <span class="badge bg-info text-dark">Nhân viên</span>
                                                            <!-- Xanh nhạt -->
                                                        </c:when>
                                                        <c:when test="${user.role.name == 'Bệnh nhân'}">
                                                            <span class="badge bg-secondary">Khách hàng</span>
                                                            <!-- Xám -->
                                                        </c:when>
                                                        <c:otherwise>
                                                            <span class="badge bg-dark">Không rõ</span>
                                                            <!-- Trường hợp không xác định -->
                                                        </c:otherwise>
                                                    </c:choose>

                                                </td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${user.status.name == 'Kích hoạt'}">
                                                            <span class="badge bg-success status-badge">Hoạt
                                                                động</span>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <span class="badge bg-danger status-badge">Đã
                                                                khóa</span>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td>${createdAtFormattedMap[user.id]}</td>
                                                <!-- Hiển thị ngày đã format -->

                                                <td>
                                                    <a href="/users/editUser?id=${user.id}"
                                                        class="btn btn-sm btn-outline-primary" title="Sửa">
                                                        <i class="bi bi-pencil"></i>
                                                    </a>

                                                    <!-- <a href="/users/deleteUser?id=${user.id}"
                                                        onclick="return confirm('Bạn có chắc chắn muốn xóa người dùng này?');"
                                                        class="btn btn-sm btn-outline-danger" title="Xóa">
                                                        <i class="bi bi-trash"></i>
                                                    </a> -->
                                                    <form action="${pageContext.request.contextPath}/users/deleteUser"
                                                        method="post" style="display:inline;"
                                                        onsubmit="return confirm('Bạn có chắc chắn muốn xóa người dùng này?');">
                                                        <input type="hidden" name="id" value="${user.id}" />
                                                        <button type="submit" class="btn btn-sm btn-outline-danger"
                                                            title="Xóa">
                                                            <i class="bi bi-trash"></i>
                                                        </button>
                                                    </form>

                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <!-- Modal Thêm Người dùng -->
                        <!-- Modal thêm người dùng -->
                        <div class="modal fade" id="addUserModal" tabindex="-1" aria-hidden="true">
                            <div class="modal-dialog modal-lg">
                                <div class="modal-content">
                                    <form:form method="POST" action="${pageContext.request.contextPath}/users/add"
                                        modelAttribute="newUser" enctype="multipart/form-data">
                                        <div class="modal-header">
                                            <h5 class="modal-title">Thêm người dùng mới</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                        </div>

                                        <div class="modal-body">
                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <label class="form-label">Họ và tên <span
                                                            class="text-danger">*</span></label>
                                                    <form:input path="name" cssClass="form-control"
                                                        placeholder="Nhập họ tên" required="required" />
                                                </div>
                                                <div class="col-md-6">
                                                    <label class="form-label">Email <span
                                                            class="text-danger">*</span></label>
                                                    <form:input path="email" type="email" cssClass="form-control"
                                                        placeholder="Nhập email" required="required" />
                                                </div>
                                            </div>

                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <label class="form-label">Số điện thoại</label>
                                                    <form:input path="phone" cssClass="form-control"
                                                        placeholder="Nhập số điện thoại" />
                                                </div>
                                                <div class="col-md-6">
                                                    <label class="form-label">Vai trò <span
                                                            class="text-danger">*</span></label>
                                                    <form:select path="role.id" cssClass="form-select"
                                                        required="required">
                                                        <form:option value="" label="Chọn vai trò" />
                                                        <form:options items="${roles}" itemValue="id"
                                                            itemLabel="name" />
                                                    </form:select>
                                                </div>
                                            </div>

                                            <div class="row mb-3">
                                                <div class="col-md-6">
                                                    <label class="form-label">Mật khẩu <span
                                                            class="text-danger">*</span></label>
                                                    <form:password path="password" cssClass="form-control"
                                                        required="required" />
                                                </div>
                                                <div class="col-md-6">
                                                    <label class="form-label">Xác nhận mật khẩu <span
                                                            class="text-danger">*</span></label>
                                                    <input type="password" name="confirmPassword" class="form-control"
                                                        required />
                                                </div>
                                            </div>

                                            <div class="mb-3">
                                                <label class="form-label">Ảnh đại diện</label>
                                                <input type="file" name="avatarFile" class="form-control" />
                                            </div>
                                        </div>

                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary"
                                                data-bs-dismiss="modal">Đóng</button>
                                            <button type="submit" class="btn btn-primary">Lưu thông tin</button>
                                        </div>
                                    </form:form>
                                </div>
                            </div>
                        </div>



                    </div>

                    <!-- Scripts -->
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
                    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
                    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
                    <script src="https://cdn.datatables.net/1.13.6/js/dataTables.bootstrap5.min.js"></script>

                    <script>
                        $(document).ready(function () {
                            $('#usersTable').DataTable({
                                language: {
                                    url: '//cdn.datatables.net/plug-ins/1.13.6/i18n/vi.json'
                                },
                                order: [[0, 'asc']]
                            });

                            // Bootstrap form validation
                            (function () {
                                'use strict'
                                var forms = document.querySelectorAll('.needs-validation')
                                Array.prototype.slice.call(forms)
                                    .forEach(function (form) {
                                        form.addEventListener('submit', function (event) {
                                            if (!form.checkValidity()) {
                                                event.preventDefault()
                                                event.stopPropagation()
                                            }
                                            form.classList.add('was-validated')
                                        }, false)
                                    })
                            })()
                        });
                    </script>
                </body>

                </html>