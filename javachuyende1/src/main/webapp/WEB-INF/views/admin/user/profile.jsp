<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

            <!DOCTYPE html>
            <html>

            <head>
                <title>Thông tin cá nhân</title>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
                <link rel="stylesheet"
                    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
                <style>
                    body {
                        background-color: #f0f2f5;
                        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                    }

                    .profile-card {
                        max-width: 900px;
                        margin: 40px auto;
                        background: linear-gradient(135deg, #ffffff, #f8f9fa);
                        border-radius: 20px;
                        box-shadow: 0 8px 30px rgba(0, 0, 0, 0.15);
                        overflow: hidden;
                    }

                    .profile-header {
                        background-color: #007bff;
                        color: white;
                        padding: 20px;
                        text-align: center;
                        border-radius: 20px 20px 0 0;
                    }

                    .avatar-img {
                        width: 150px;
                        height: 150px;
                        object-fit: cover;
                        border-radius: 50%;
                        border: 5px solid #fff;
                        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
                        margin-top: 20px;
                        background-color: #fff;
                    }

                    .table th {
                        width: 200px;
                        color: #495057;
                        font-weight: 600;
                    }

                    .table td {
                        color: #212529;
                    }

                    .edit-btn {
                        background-color: #28a745;
                        border: none;
                        padding: 10px 20px;
                        border-radius: 25px;
                        transition: background-color 0.3s ease;
                    }

                    .edit-btn:hover {
                        background-color: #218838;
                    }

                    .info-row {
                        padding: 10px 0;
                        border-bottom: 1px solid #e9ecef;
                    }

                    .info-row:last-child {
                        border-bottom: none;
                    }

                    @media (max-width: 768px) {
                        .profile-card {
                            margin: 20px;
                        }

                        .avatar-img {
                            width: 120px;
                            height: 120px;
                            margin-top: -60px;
                        }

                        .table th,
                        .table td {
                            font-size: 14px;
                        }
                    }
                </style>
            </head>

            <body>
                <div class="container">
                    <div class="profile-card">
                        <div class="profile-header">
                            <h2 class="mb-0">Thông tin cá nhân</h2>
                        </div>
                        <div class="p-5">
                            <div class="text-center mb-4">
                                <c:choose>
                                    <c:when test="${not empty user.avatar}">
                                        <img src="${pageContext.request.contextPath}${user.avatar}" alt="Avatar"
                                            class="avatar-img" />
                                    </c:when>
                                    <c:otherwise>
                                        <img src="https://via.placeholder.com/150" alt="Avatar" class="avatar-img" />
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <div class="row justify-content-center">
                                <div class="col-md-10">
                                    <form action="${pageContext.request.contextPath}/update-profile" method="post">
                                        <table class="table table-borderless">
                                            <tr class="info-row">
                                                <th><i class="fas fa-user me-2"></i>Họ tên:</th>
                                                <td>
                                                    <input type="text" name="name" class="form-control"
                                                        value="${user.name}" required />
                                                </td>
                                            </tr>
                                            <tr class="info-row">
                                                <th><i class="fas fa-envelope me-2"></i>Email:</th>
                                                <td>
                                                    <input type="email" name="email" class="form-control"
                                                        value="${user.email}" required />
                                                </td>
                                            </tr>
                                            <tr class="info-row">
                                                <th><i class="fas fa-phone me-2"></i>Số điện thoại:</th>
                                                <td>
                                                    <input type="tel" name="phone" class="form-control"
                                                        value="${user.phone}" />
                                                </td>
                                            </tr>

                                            <tr class="info-row">
                                                <th><i class="fas fa-info-circle me-2"></i>Trạng thái:</th>
                                                <td>${user.status.name}</td>
                                            </tr>
                                            <tr class="info-row">
                                                <th><i class="fas fa-calendar-alt me-2"></i>Ngày tạo:</th>
                                                <td>${createdAtFormatted}</td>
                                            </tr>
                                        </table>

                                        <div class="text-center mt-4">
                                            <button type="submit" class="btn edit-btn text-white">
                                                <i class="fas fa-save me-2"></i>Lưu thông tin
                                            </button>
                                        </div>
                                    </form>


                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
            </body>

            </html>