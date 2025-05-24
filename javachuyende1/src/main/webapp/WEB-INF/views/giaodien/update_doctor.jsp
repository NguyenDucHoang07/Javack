<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title>Cập nhật thông tin bác sĩ</title>
  <link rel="stylesheet" href="/css/update.css">
</head>
<body>
  <header class="navbar">
    <div class="navbar-left">
      <img src="logo.png" alt="3 con cừu" class="logo" />
    </div>
    <nav class="navbar-center">
      <ul>
        <li>Thêm bệnh nhân</li>
        <li>Quản lý bệnh nhân</li>
        <li>Thêm bác sĩ</li>
        <li class="active">Cập nhật bác sĩ</li>
      </ul>
    </nav>
    <div class="navbar-right">
      <input type="text" placeholder="Tìm kiếm..." class="search-input" />
      <button class="icon-btn">📅</button>
      <button class="icon-btn">🇻🇳</button>
      <button class="icon-btn">⬇️</button>
    </div>
  </header>

  <section class="dashboard">
    <h2>Cập nhật thông tin bác sĩ</h2>

    <!-- FORM gửi về backend Java -->
    <form class="update-form" method="POST" action="/update-doctor">
      <label for="name">Họ tên:</label>
      <input type="text" id="name" name="name" value="Nguyễn Văn A" required>

      <label for="specialty">Chuyên khoa:</label>
      <input type="text" id="specialty" name="specialty" value="Tim" required>

      <label for="address">Địa chỉ:</label>
      <input type="text" id="address" name="address" value="123 Đường Trần Hưng Đạo, Hà Nội" required>

      <label for="phone">Số điện thoại:</label>
      <input type="tel" id="phone" name="phone" value="0912345678" required>

      <button type="submit" class="btn-save">Lưu thay đổi</button>
    </form>
  </section>

  <script src="app.js"></script>
</body>
</html>
