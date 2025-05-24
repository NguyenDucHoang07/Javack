<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

        <!DOCTYPE html>
        <html lang="vi">

        <head>
            <meta charset="UTF-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1.0" />
            <title>Sửa thông tin bệnh nhân</title>
            <!-- Bootstrap CSS -->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
                crossorigin="anonymous" />
            <!-- Google Fonts: Roboto -->
            <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap"
                rel="stylesheet" />
            <style>
                body {
                    font-family: 'Roboto', sans-serif;
                    background: linear-gradient(135deg, #e3f2fd 0%, #bbdefb 100%);
                    min-height: 100vh;
                    display: flex;
                    justify-content: center;
                    align-items: center;
                    margin: 0;
                }

                .container {
                    max-width: 750px;
                    margin: 40px auto;
                    padding: 30px;
                    background: #ffffff;
                    border-radius: 12px;
                    box-shadow: 0 8px 24px rgba(0, 0, 0, 0.15);
                    transition: transform 0.2s;
                }



                h3 {
                    font-size: 1.75rem;
                    font-weight: 700;
                    color: #1a3c6d;
                    margin-bottom: 30px;
                    text-align: center;
                }

                .form-label {
                    font-weight: 500;
                    color: #2c3e50;
                }

                .form-control,
                .form-select {
                    border-radius: 8px;
                    border: 1px solid #ced4da;
                    padding: 10px;
                    font-size: 1rem;
                    transition: border-color 0.3s, box-shadow 0.3s;
                }

                .form-control:focus,
                .form-select:focus {
                    border-color: #1a73e8;
                    box-shadow: 0 0 8px rgba(26, 115, 232, 0.2);
                    outline: none;
                }

                .btn-primary {
                    background-color: #1a73e8;
                    border: none;
                    padding: 12px 24px;
                    font-size: 1rem;
                    font-weight: 500;
                    border-radius: 8px;
                    transition: background-color 0.3s, transform 0.2s;
                }



                .btn-secondary {
                    background-color: #6c757d;
                    border: none;
                    padding: 12px 24px;
                    font-size: 1rem;
                    font-weight: 500;
                    border-radius: 8px;
                    transition: background-color 0.3s, transform 0.2s;
                }



                .form-group {
                    margin-bottom: 20px;
                }

                .text-danger {
                    font-size: 0.9rem;
                    font-weight: 500;
                }

                .invalid-feedback {
                    display: none;
                    font-size: 0.85rem;
                }

                .form-control:invalid+.invalid-feedback,
                .form-select:invalid+.invalid-feedback {
                    display: block;
                }

                @media (max-width: 576px) {
                    .container {
                        margin: 20px;
                        padding: 20px;
                    }

                    h3 {
                        font-size: 1.5rem;
                    }
                }
            </style>
        </head>

        <body>
            <div class="container">
                <h3>Sửa thông tin bệnh nhân</h3>

                <form action="${pageContext.request.contextPath}/patients/updatePatient" method="post"
                    class="needs-validation" novalidate>
                    <input type="hidden" name="id" value="${patient.id}" />

                    <div class="form-group">
                        <label for="fullName" class="form-label">Họ tên <span class="text-danger">*</span></label>
                        <input type="text" id="fullName" name="fullName" class="form-control"
                            value="${patient.fullName}" required />
                        <div class="invalid-feedback">Vui lòng nhập họ tên.</div>
                    </div>

                    <div class="form-group">
                        <label for="birthDate" class="form-label">Ngày sinh <span class="text-danger">*</span></label>
                        <input type="date" id="birthDate" name="birthDate" class="form-control"
                            value="${patient.birthDate}" required />
                        <div class="invalid-feedback">Vui lòng chọn ngày sinh.</div>
                    </div>

                    <div class="form-group">
                        <label for="gender" class="form-label">Giới tính <span class="text-danger">*</span></label>
                        <select id="gender" name="gender" class="form-select" required>
                            <option value="">Chọn giới tính</option>
                            <option value="Nam" <c:if test="${patient.gender == 'Nam'}">selected</c:if>>Nam</option>
                            <option value="Nữ" <c:if test="${patient.gender == 'Nữ'}">selected</c:if>>Nữ</option>
                        </select>
                        <div class="invalid-feedback">Vui lòng chọn giới tính.</div>
                    </div>

                    <div class="form-group">
                        <label for="phone" class="form-label">Số điện thoại</label>
                        <input type="tel" id="phone" name="phone" class="form-control" value="${patient.phone}"
                            pattern="[0-9]{10,11}" />
                        <div class="invalid-feedback">Số điện thoại phải có 10-11 chữ số.</div>
                    </div>

                    <div class="form-group">
                        <label for="address" class="form-label">Địa chỉ</label>
                        <input type="text" id="address" name="address" class="form-control"
                            value="${patient.address}" />
                    </div>

                    <div class="form-group">
                        <label for="diagnosis" class="form-label">Chẩn đoán bệnh</label>
                        <textarea id="diagnosis" name="diagnosis" class="form-control"
                            rows="4">${patient.diagnosis}</textarea>
                    </div>

                    <div class="d-flex justify-content-end gap-2">
                        <button type="submit" class="btn btn-primary">Lưu thay đổi</button>
                        <a href="${pageContext.request.contextPath}/patients" class="btn btn-secondary">Hủy</a>
                    </div>
                </form>
            </div>

            <!-- Bootstrap JS bundle -->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
                crossorigin="anonymous"></script>
            <!-- Form validation script -->

        </body>

        </html>