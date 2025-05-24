<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8" />
  <title>Quản lý bác sĩ và nhân viên</title>
  <link rel="stylesheet" href="/css/manage.css" />
  <style>
    /* Ví dụ nhỏ nếu bạn chưa có file CSS */
    body { font-family: Arial, sans-serif; margin: 0; padding: 0; }
    .navbar { display: flex; justify-content: space-between; align-items: center; background-color: #005f73; color: white; padding: 10px 20px; }
    .navbar-left .logo { height: 40px; }
    .navbar-center ul { list-style: none; display: flex; gap: 20px; margin: 0; padding: 0; }
    .navbar-center ul li { cursor: pointer; }
    .navbar-right { display: flex; gap: 10px; align-items: center; }
    .search-input { padding: 5px; border-radius: 4px; border: none; }
    .icon-btn { background: none; border: none; color: white; font-size: 18px; cursor: pointer; }
    .dashboard { padding: 20px; }
    table { width: 100%; border-collapse: collapse; }
    th, td { border: 1px solid #ddd; padding: 10px; text-align: left; }
    th { background-color: #0a9396; color: white; }
    .btn-update, .btn-delete { padding: 5px 10px; border: none; border-radius: 4px; cursor: pointer; }
    .btn-update { background-color: #94d2bd; color: #000; }
    .btn-delete { background-color: #ee6c4d; color: #fff; }
  </style>
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
        <li>Thêm bác sĩ / nhân viên</li>
        <li>Quản lý bác sĩ / nhân viên</li>
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
    <h2>Quản lý bác sĩ và nhân viên</h2>
    <table>
      <thead>
        <tr>
          <th>Họ tên</th>
          <th>Chức vụ</th>
          <th>Phòng ban</th>
          <th>Số điện thoại</th>
          <th>Thao tác</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>Nguyễn Văn A</td>
          <td>Bác sĩ</td>
          <td>Nội khoa</td>
          <td>0912345678</td>
          <td>
            <button class="btn-update">Cập nhật</button>
            <button class="btn-delete">Xoá</button>
          </td>
        </tr>
        <tr>
          <td>Trần Thị B</td>
          <td>Y tá</td>
          <td>Ngoại khoa</td>
          <td>0908765432</td>
          <td>
            <button class="btn-update">Cập nhật</button>
            <button class="btn-delete">Xoá</button>
          </td>
        </tr>
        <tr>
          <td>Lê Văn C</td>
          <td>Nhân viên hành chính</td>
          <td>Hành chính</td>
          <td>0987654321</td>
          <td>
            <button class="btn-update">Cập nhật</button>
            <button class="btn-delete">Xoá</button>
          </td>
        </tr>
      </tbody>
    </table>
  </section>

  <script src="app.js"></script>
</body>
</html>
