<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

            <html>

            <head>
                <title>Đăng ký tài khoản</title>
                <!-- Bootstrap CSS CDN -->
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
                <style>
                    body {
                        background-color: #f8f9fa;
                    }

                    .registration-form {
                        max-width: 480px;
                        margin: 40px auto;
                        padding: 30px 40px;
                        background: white;
                        border-radius: 8px;
                        box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
                    }

                    .error {
                        color: #dc3545;
                        /* bootstrap danger color */
                        font-size: 0.875em;
                    }

                    .form-label {
                        font-weight: 600;
                    }
                </style>
            </head>

            <body>

                <div class="registration-form">
                    <h2 class="mb-4 text-center">Đăng ký tài khoản</h2>

                    <c:if test="${not empty errorMessage}">
                        <div class="alert alert-danger" role="alert">${errorMessage}</div>
                    </c:if>

                    <form:form method="post" modelAttribute="user" enctype="multipart/form-data"
                        class="needs-validation" novalidate="novalidate">

                        <div class="mb-3">
                            <form:label path="name" cssClass="form-label">Họ và tên:</form:label>
                            <form:input path="name" cssClass="form-control" required="required" />
                            <form:errors path="name" cssClass="error" />
                            <div class="invalid-feedback">
                                Vui lòng nhập họ và tên.
                            </div>
                        </div>

                        <div class="mb-3">
                            <form:label path="email" cssClass="form-label">Email:</form:label>
                            <form:input path="email" type="email" cssClass="form-control" required="required" />
                            <form:errors path="email" cssClass="error" />
                            <div class="invalid-feedback">
                                Vui lòng nhập email hợp lệ.
                            </div>
                        </div>

                        <div class="mb-3">
                            <form:label path="phone" cssClass="form-label">Số điện thoại:</form:label>
                            <form:input path="phone" type="tel" pattern="^\d{10,15}$" cssClass="form-control"
                                required="required" />
                            <form:errors path="phone" cssClass="error" />
                            <div class="invalid-feedback">
                                Vui lòng nhập số điện thoại từ 10 đến 15 chữ số.
                            </div>
                        </div>

                        <div class="mb-3">
                            <form:label path="password" cssClass="form-label">Mật khẩu:</form:label>
                            <form:password path="password" cssClass="form-control" required="required" minlength="6" />
                            <form:errors path="password" cssClass="error" />
                            <div class="invalid-feedback">
                                Mật khẩu phải ít nhất 6 ký tự.
                            </div>
                        </div>

                        <div class="mb-4">
                            <label for="avatarFile" class="form-label">Ảnh đại diện:</label>
                            <input type="file" id="avatarFile" name="avatarFile" accept="image/*"
                                class="form-control" />
                        </div>

                        <div class="d-grid">
                            <button type="submit" class="btn btn-primary">Đăng ký</button>
                        </div>
                        <div class="text-center mt-3">
                            <a href="/login" class="text-decoration-none fw-semibold text-primary">Đăng nhập</a>
                        </div>

                    </form:form>

                </div>

                <!-- Bootstrap JS (Optional) -->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
                <script>
                    // Example starter JavaScript for disabling form submissions if there are invalid fields
                    (function () {
                        'use strict'

                        // Fetch all the forms we want to apply custom Bootstrap validation styles to
                        var forms = document.querySelectorAll('.needs-validation')

                        // Loop over them and prevent submission
                        Array.prototype.slice.call(forms).forEach(function (form) {
                            form.addEventListener('submit', function (event) {
                                if (!form.checkValidity()) {
                                    event.preventDefault()
                                    event.stopPropagation()
                                }

                                form.classList.add('was-validated')
                            }, false)
                        })
                    })()
                </script>

            </body>

            </html>