<%@ page contentType="text/html" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

    <!DOCTYPE html>
    <html lang="vi">

    <head>
      <meta charset="UTF-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1.0" />
      <title>Quản lý bệnh nhân</title>
      <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet" />
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
      <style>
        /* CSS đầy đủ như bạn đã gửi */
        * {
          margin: 0;
          padding: 0;
          box-sizing: border-box;
        }

        body {
          font-family: 'Roboto', Arial, sans-serif;
          background-color: #f4f7fa;
          color: #333;
        }

        .navbar {
          display: flex;
          justify-content: space-between;
          align-items: center;
          background: linear-gradient(90deg, #2c3e50, #3498db);
          padding: 15px 30px;
          box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
          position: sticky;
          top: 0;
          z-index: 1000;
        }

        .logo {
          height: 50px;
          transition: transform 0.3s ease;
        }

        .logo:hover {
          transform: scale(1.1);
        }

        .navbar-center ul {
          list-style: none;
          display: flex;
          gap: 30px;
        }

        .navbar-center li {
          color: white;
          font-weight: 500;
          cursor: pointer;
          transition: color 0.3s ease;
        }

        .navbar-center li:hover {
          color: #f1c40f;
        }

        .navbar-right {
          display: flex;
          align-items: center;
          gap: 10px;
        }

        .search-input {
          padding: 8px 12px;
          border: none;
          border-radius: 20px;
          outline: none;
          transition: width 0.3s ease;
          width: 150px;
        }

        .search-input:focus {
          width: 200px;
          box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
        }

        .icon-btn {
          background: none;
          border: none;
          color: white;
          font-size: 20px;
          cursor: pointer;
          padding: 5px;
          transition: color 0.3s ease;
        }

        .icon-btn:hover {
          color: #f1c40f;
        }

        .dashboard {
          max-width: 1200px;
          margin: 30px auto;
          padding: 20px;
          background: white;
          border-radius: 10px;
          box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        .dashboard h2 {
          font-size: 24px;
          margin-bottom: 20px;
          color: #2c3e50;
        }

        .btn-add {
          display: inline-flex;
          align-items: center;
          padding: 10px 20px;
          background: #27ae60;
          color: white;
          text-decoration: none;
          border-radius: 25px;
          font-weight: 500;
          transition: background 0.3s ease, transform 0.2s ease;
        }

        .btn-add:hover {
          background: #219653;
          transform: translateY(-2px);
        }

        .btn-add::before {
          content: '➕';
          margin-right: 8px;
        }

        table {
          width: 100%;
          border-collapse: collapse;
          margin-top: 20px;
        }

        table th,
        table td {
          padding: 12px 15px;
          text-align: left;
          border-bottom: 1px solid #e0e0e0;
        }

        table th {
          background: #3498db;
          color: white;
          font-weight: 500;
        }

        table tr:hover {
          background: #f8f9fa;
        }

        .btn-update,
        .btn-delete {
          padding: 8px 15px;
          border: none;
          border-radius: 15px;
          cursor: pointer;
          font-weight: 500;
          transition: background 0.3s ease, transform 0.2s ease;
        }

        .btn-update {
          background: #f39c12;
          color: white;
        }

        .btn-update:hover {
          background: #e67e22;
          transform: translateY(-2px);
        }

        .btn-delete {
          background: #e74c3c;
          color: white;
        }

        .btn-delete:hover {
          background: #c0392b;
          transform: translateY(-2px);
        }

        .modal-content {
          border-radius: 10px;
        }

        .modal-header {
          background: #3498db;
          color: white;
          border-top-left-radius: 10px;
          border-top-right-radius: 10px;
        }

        .modal-title {
          font-weight: 500;
        }

        .modal-body {
          padding: 20px;
        }

        .form-label {
          font-weight: 500;
          color: #333;
        }

        .form-control,
        .form-select {
          border-radius: 5px;
          border: 1px solid #e0e0e0;
          transition: border-color 0.3s ease;
        }

        .form-control:focus,
        .form-select:focus {
          border-color: #3498db;
          box-shadow: none;
        }

        .modal-footer .btn-primary {
          background: #27ae60;
          border: none;
        }

        .modal-footer .btn-primary:hover {
          background: #219653;
          transform: translateY(-2px);
        }

        .modal-footer .btn-secondary {
          background: #e74c3c;
          border: none;
        }

        .modal-footer .btn-secondary:hover {
          background: #c0392b;
          transform: translateY(-2px);
        }

        @media (max-width: 768px) {
          .navbar {
            flex-direction: column;
            gap: 15px;
          }

          .navbar-center ul {
            flex-direction: column;
            text-align: center;
          }

          .search-input {
            width: 100%;
          }

          .dashboard {
            margin: 15px;
            padding: 15px;
          }

          table th,
          table td {
            font-size: 14px;
            padding: 10px;
          }
        }
      </style>
    </head>

    <body>
      <header class="navbar">
        <div class="navbar-left">
          <img src="logo.png" alt="3 con cừu" class="logo" />
        </div>
        <div class="navbar-center">
          <ul>
            <li>Quản lý bệnh nhân</li>
          </ul>
        </div>
        <div class="navbar-right">
          <input type="text" placeholder="Tìm kiếm..." class="search-input" />
          <button class="icon-btn">📅</button>
          <button class="icon-btn">🇻🇳</button>
          <button class="icon-btn">⬇️</button>
        </div>
      </header>

      <section class="dashboard">
        <h2>Quản lý bệnh nhân</h2>
        <a href="#" class="btn-add" data-bs-toggle="modal" data-bs-target="#addPatientModal">Thêm bệnh nhân mới</a>

        <!-- Modal thêm bệnh nhân -->
        <div class="modal fade" id="addPatientModal" tabindex="-1" aria-hidden="true">
          <div class="modal-dialog modal-lg">
            <div class="modal-content">
              <form method="POST" action="${pageContext.request.contextPath}/patients/addPatient"
                enctype="application/x-www-form-urlencoded">
                <div class="modal-header">
                  <h5 class="modal-title">Thêm bệnh nhân mới</h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Đóng"></button>
                </div>
                <div class="modal-body">
                  <div class="row mb-3">
                    <div class="col-md-6">
                      <label class="form-label">Họ tên <span class="text-danger">*</span></label>
                      <input type="text" name="fullName" class="form-control" placeholder="Nhập họ tên" required />
                    </div>
                    <div class="col-md-6">
                      <label class="form-label">Ngày sinh <span class="text-danger">*</span></label>
                      <input type="date" name="birthDate" class="form-control" required />
                    </div>
                  </div>
                  <div class="row mb-3">
                    <div class="col-md-6">
                      <label class="form-label">Giới tính <span class="text-danger">*</span></label>
                      <select name="gender" class="form-select" required>
                        <option value="">Chọn giới tính</option>
                        <option value="Nam">Nam</option>
                        <option value="Nữ">Nữ</option>
                      </select>
                    </div>
                    <div class="col-md-6">
                      <label class="form-label">Số điện thoại</label>
                      <input type="tel" name="phone" class="form-control" placeholder="Nhập số điện thoại" />
                    </div>
                  </div>
                  <div class="row mb-3">
                    <div class="col-md-12">
                      <label class="form-label">Địa chỉ</label>
                      <input type="text" name="address" class="form-control" placeholder="Nhập địa chỉ" />
                    </div>
                  </div>
                  <div class="row mb-3">
                    <div class="col-md-12">
                      <label class="form-label">Chẩn đoán bệnh</label>
                      <textarea name="diagnosis" class="form-control" rows="3" placeholder="Nhập chẩn đoán"></textarea>
                    </div>
                  </div>
                </div>
                <div class="modal-footer">
                  <button type="submit" class="btn btn-primary">Lưu</button>
                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                </div>
              </form>
            </div>
          </div>
        </div>

        <!-- Bảng danh sách bệnh nhân -->
        <table class="table table-hover">
          <thead>
            <tr>
              <th>STT</th>
              <th>Họ tên</th>
              <th>Ngày sinh</th>
              <th>Giới tính</th>
              <th>Số điện thoại</th>
              <th>Địa chỉ</th>
              <th>Chẩn đoán bệnh</th>
              <th>Thao tác</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="patient" items="${patients}" varStatus="status">
              <tr>
                <td>${status.index + 1}</td>
                <td>${patient.fullName}</td>
                <td>${birthdate[patient.id]}</td>
                <td>${patient.gender}</td>
                <td>${patient.phone}</td>
                <td>${patient.address}</td>
                <td>${patient.diagnosis}</td>
                <td>
                  <a href="${pageContext.request.contextPath}/patients/editPatient/${patient.id}"
                    class="btn btn-update btn-sm me-1">Sửa</a>

                  <form action="${pageContext.request.contextPath}/patients/deletePatient/${patient.id}" method="post"
                    style="display:inline;" onsubmit="return confirm('Bạn có chắc muốn xoá bệnh nhân này?');">
                    <button type="submit" class="btn btn-delete btn-sm">Xoá</button>
                  </form>
                </td>
              </tr>
            </c:forEach>
            <c:if test="${empty patients}">
              <tr>
                <td colspan="8" class="text-center text-muted">Chưa có bệnh nhân nào</td>
              </tr>
            </c:if>
          </tbody>
        </table>
      </section>

      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>

    </html>