<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

            <!DOCTYPE html>
            <html>

            <head>
                <title>Thông tin cá nhân</title>
                <meta charset="UTF-8">
                <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
                <link rel="stylesheet"
                    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
                <style>
                    body {
                        background-color: #f0f2f5;
                    }

                    .profile-card {
                        max-width: 900px;
                        margin: 40px auto;
                        background: #fff;
                        border-radius: 20px;
                        padding: 30px;
                        box-shadow: 0 8px 30px rgba(0, 0, 0, 0.15);
                    }

                    .avatar-img {
                        width: 150px;
                        height: 150px;
                        border-radius: 50%;
                        object-fit: cover;
                        border: 5px solid #fff;
                        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
                        margin-bottom: 10px;
                    }
                </style>
            </head>

            <body>
                <div class="container">
                    <div class="profile-card">
                        <div class="text-center">
                            <h2>Thông tin cá nhân</h2>
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
                        <form action="${pageContext.request.contextPath}/update-profile" method="post"
                            enctype="multipart/form-data">
                            <table class="table table-borderless">
                                <tr>
                                    <th>Họ tên:</th>
                                    <td><input type="text" name="name" class="form-control" value="${user.name}"
                                            required /></td>
                                </tr>
                                <tr>
                                    <th>Email:</th>
                                    <td><input type="email" name="email" class="form-control" value="${user.email}"
                                            required /></td>
                                </tr>
                                <tr>
                                    <th>Số điện thoại:</th>
                                    <td><input type="tel" name="phone" class="form-control" value="${user.phone}" />
                                    </td>
                                </tr>
                                <tr>
                                    <th>Ảnh đại diện:</th>
                                    <td>
                                        <input type="file" name="avatarFile" class="form-control" accept="image/*" />

                                    </td>
                                </tr>
                            </table>
                            <div class="text-center mt-3">
                                <button type="submit" class="btn btn-success">
                                    <i class="fas fa-save"></i> Lưu thông tin
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </body>

            </html>