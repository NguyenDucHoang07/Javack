<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

            <!DOCTYPE html>
            <html lang="vi">

            <head>
                <meta charset="UTF-8">
                <title>Chỉnh sửa người dùng</title>
                <!-- Bootstrap 5 -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
            </head>

            <body class="bg-light">

                <div class="container mt-5">
                    <div class="card shadow-sm">
                        <div class="card-header bg-primary text-white">
                            <h4 class="mb-0">Chỉnh sửa thông tin người dùng</h4>
                        </div>
                        <div class="card-body">
                            <form:form action="/users/updateUser" method="post" modelAttribute="user"
                                enctype="multipart/form-data">
                                <form:hidden path="id" />


                                <div class="mb-3">
                                    <label>Ảnh đại diện</label><br />
                                    <img src="${user.avatar != null ? user.avatar : 'https://via.placeholder.com/100?text=NA'}"
                                        alt="Avatar" width="100" height="100" class="mb-2" />
                                    <input type="file" name="avatarFile" class="form-control" />
                                </div>


                                <div class="mb-3">
                                    <label class="form-label">Họ tên</label>
                                    <form:input path="name" cssClass="form-control" />
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Email</label>
                                    <form:input path="email" cssClass="form-control" />
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Số điện thoại</label>
                                    <form:input path="phone" cssClass="form-control" />
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Vai trò</label>
                                    <form:select path="role.id" cssClass="form-select">
                                        <form:options items="${roles}" itemValue="id" itemLabel="name" />
                                    </form:select>
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Trạng thái</label>
                                    <form:select path="status.id" cssClass="form-select">
                                        <form:options items="${statuses}" itemValue="id" itemLabel="name" />
                                    </form:select>
                                </div>

                                <div class="d-flex justify-content-between">
                                    <button type="submit" class="btn btn-success">💾 Lưu thay đổi</button>
                                    <a href="/users" class="btn btn-secondary">↩ Hủy</a>
                                </div>
                            </form:form>
                        </div>
                    </div>
                </div>

                <!-- Bootstrap JS (optional, for dropdowns, modals...) -->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

            </body>

            </html>