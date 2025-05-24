<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title>Quản lý bác sĩ</title>
  <link rel="stylesheet" href="/css/ma.css">
</head>
<body>
  <header class="navbar">
    <div class="navbar-left">
      <img src="${pageContext.request.contextPath}/resources/img/logo.png" alt="3 con cừu" class="logo" />
    </div>
    <nav class="navbar-center">
      <ul>
        <li>Thêm bệnh nhân</li>
        <li>Quản lý bệnh nhân</li>
        <li>Thêm bác sĩ</li>
        <li>Quản lý thông tin bác sĩ</li>
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
    <h2>Quản lý bác sĩ</h2>
    <table>
      <thead>
        <tr>
          <th>Họ tên</th>
          <th>Chuyên khoa</th>
          <th>Địa chỉ</th>
          <th>Số điện thoại</th>
          <th>Thao tác</th>
        </tr>
      </thead>
      <tbody id="doctorBody">
        <tr>
          <td>Nguyễn Văn A</td>
          <td>Tim mạch</td>
          <td>123 Đường Trần Hưng Đạo, Hà Nội</td>
          <td>0912345678</td>
          <td>
            <button class="btn-update">Cập nhật</button>
            <button class="btn-delete">Xoá</button>
          </td>
        </tr>
        <tr>
          <td>Trần Thị B</td>
          <td>Nội tiết</td>
          <td>456 Đường Lê Lợi, TP.HCM</td>
          <td>0908765432</td>
          <td>
            <button class="btn-update">Cập nhật</button>
            <button class="btn-delete">Xoá</button>
          </td>
        </tr>
        <tr>
          <td>Lê Văn C</td>
          <td>Nhi khoa</td>
          <td>789 Đường Nguyễn Huệ, Đà Nẵng</td>
          <td>0987654321</td>
          <td>
            <button class="btn-update">Cập nhật</button>
            <button class="btn-delete">Xoá</button>
          </td>
        </tr>
      </tbody>
    </table>
  </section>
</body>
</html>
