<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Đăng nhập quản trị</title>
  <link rel="stylesheet" href="/css/login.css">

  
</head>
<body>

  <div class="login-container">
    <div class="logo">🩺 3 Con Cừu Hospital</div>
    <h2>Đăng nhập Admin</h2>

    <!-- Hiển thị lỗi nếu có -->
    <c:if test="${not empty error}">
      <div class="error-message">${error}</div>
    </c:if>

    <form action="${pageContext.request.contextPath}/login" method="POST">
      <div class="form-group">
        <label for="username">Tên đăng nhập</label>
        <input type="text" id="username" name="username" placeholder="Nhập tên đăng nhập" required />
      </div>
      <div class="form-group">
        <label for="password">Mật khẩu</label>
        <input type="password" id="password" name="password" placeholder="Nhập mật khẩu" required />
      </div>
      <button type="submit" class="login-btn">Đăng nhập</button>
    </form>
    <div class="login-footer">
      Dành riêng cho cán bộ quản trị bệnh viện
    </div>
  </div>

</body>
</html>
