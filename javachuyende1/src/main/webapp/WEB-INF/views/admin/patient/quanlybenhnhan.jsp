<%@ page contentType="text/html" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

    <!DOCTYPE html>
    <html lang="vi">

    <head>
      <meta charset="UTF-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1.0" />
      <title>Quản lý bệnh nhân</title>
      <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet" />
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
      <style>
        * {
          margin: 0;
          padding: 0;
          box-sizing: border-box;
        }

        body {
          font-family: 'Inter', sans-serif;
          background-color: #f8fafc;
          color: #1e293b;
          line-height: 1.6;
        }

        .navbar {
          display: flex;
          justify-content: space-between;
          align-items: center;
          background: linear-gradient(90deg, #1e3a8a, #3b82f6);
          padding: 12px 24px;
          box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
          position: sticky;
          top: 0;
          z-index: 1000;
        }

        .logo {
          height: 40px;
          transition: transform 0.3s ease;
        }

        .logo:hover {
          transform: scale(1.05);
        }

        .navbar-center ul {
          list-style: none;
          display: flex;
          gap: 24px;
          margin: 0;
        }

        .navbar-center li {
          color: #ffffff;
          font-weight: 500;
          font-size: 16px;
          cursor: pointer;
          transition: color 0.3s ease;
        }

        .navbar-center li:hover {
          color: #facc15;
        }

        .navbar-right {
          display: flex;
          align-items: center;
          gap: 12px;
        }

        .search-input {
          padding: 8px 16px;
          border: 1px solid #e2e8f0;
          border-radius: 12px;
          outline: none;
          transition: all 0.3s ease;
          width: 180px;
          background: #ffffff;
        }

        .search-input:focus {
          width: 220px;
          border-color: #3b82f6;
          box-shadow: 0 0 8px rgba(59, 130, 246, 0.2);
        }

        .icon-btn {
          background: none;
          border: none;
          color: #ffffff;
          font-size: 18px;
          cursor: pointer;
          padding: 8px;
          transition: all 0.3s ease;
          border-radius: 8px;
        }

        .icon-btn:hover {
          color: #facc15;
          background: rgba(255, 255, 255, 0.1);
        }

        .dashboard {
          max-width: 1280px;
          margin: 24px auto;
          padding: 24px;
          background: #ffffff;
          border-radius: 16px;
          box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
        }

        .dashboard h2 {
          font-size: 28px;
          font-weight: 600;
          margin-bottom: 16px;
          color: #1e293b;
        }

        .btn-add {
          display: inline-flex;
          align-items: center;
          padding: 10px 20px;
          background: #10b981;
          color: #ffffff;
          text-decoration: none;
          border-radius: 12px;
          font-weight: 500;
          font-size: 14px;
          transition: all 0.3s ease;
        }

        .btn-add:hover {
          background: #059669;
          transform: translateY(-1px);
          box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }

        .btn-add::before {
          content: '➕';
          margin-right: 8px;
          font-size: 16px;
        }

        table {
          width: 100%;
          border-collapse: separate;
          border-spacing: 0;
          margin-top: 16px;
          border-radius: 12px;
          overflow: hidden;
        }

        table th,
        table td {
          padding: 14px 16px;
          text-align: left;
          border-bottom: 1px solid #e5e7eb;
        }

        table th {
          background: #3b82f6;
          color: #ffffff;
          font-weight: 600;
          font-size: 14px;
        }

        table td {
          font-size: 14px;
          color: #1e293b;
        }

        table tr:hover {
          background: #f1f5f9;
        }

        .btn-update,
        .btn-delete {
          padding: 8px 16px;
          border: none;
          border-radius: 8px;
          cursor: pointer;
          font-weight: 500;
          font-size: 13px;
          transition: all 0.3s ease;
        }

        .btn-update {
          background: #f59e0b;
          color: #ffffff;
        }

        .btn-update:hover {
          background: #d97706;
          transform: translateY(-1px);
        }

        .btn-delete {
          background: #ef4444;
          color: #ffffff;
        }

        .btn-delete:hover {
          background: #dc2626;
          transform: translateY(-1px);
        }

        .modal-content {
          border-radius: 16px;
          border: none;
          box-shadow: 0 4px 24px rgba(0, 0, 0, 0.1);
        }

        .modal-header {
          background: #3b82f6;
          color: #ffffff;
          border-top-left-radius: 16px;
          border-top-right-radius: 16px;
          padding: 16px 24px;
        }

        .modal-title {
          font-weight: 600;
          font-size: 18px;
        }

        .modal-body {
          padding: 24px;
        }

        .form-label {
          font-weight: 500;
          color: #1e293b;
          font-size: 14px;
        }

        .form-control,
        .form-select {
          border-radius: 8px;
          border: 1px solid #d1d5db;
          padding: 10px;
          font-size: 14px;
          transition: all 0.3s ease;
        }

        .form-control:focus,
        .form-select:focus {
          border-color: #3b82f6;
          box-shadow: 0 0 8px rgba(59, 130, 246, 0.2);
        }

        .modal-footer {
          padding: 16px 24px;
          border-top: 1px solid #e5e7eb;
        }

        .modal-footer .btn-primary {
          background: #10b981;
          border: none;
          border-radius: 8px;
          padding: 10px 20px;
          font-size: 14px;
        }

        .modal-footer .btn-primary:hover {
          background: #059669;
          transform: translateY(-1px);
        }

        .modal-footer .btn-secondary {
          background: #ef4444;
          border: none;
          border-radius: 8px;
          padding: 10px 20px;
          font-size: 14px;
        }

        .modal-footer .btn-secondary:hover {
          background: #dc2626;
          transform: translateY(-1px);
        }

        @media (max-width: 768px) {
          .navbar {
            flex-direction: column;
            gap: 12px;
            padding: 12px 16px;
          }

          .navbar-center ul {
            flex-direction: column;
            text-align: center;
            gap: 12px;
          }

          .search-input {
            width: 100%;
          }

          .dashboard {
            margin: 16px;
            padding: 16px;
          }

          table th,
          table td {
            font-size: 13px;
            padding: 10px;
          }

          .modal-body {
            padding: 16px;
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
          <input type="text" placeholder="Tìm kiếm bệnh nhân..." class="search-input" />
          <button class="icon-btn" title="Lịch hẹn">📅</button>
          <button class="icon-btn" title="Ngôn ngữ">🇻🇳</button>
          <button class="icon-btn" title="Tải xuống">⬇️</button>
        </div>
      </header>

      <section class="dashboard">
        <div class="d-flex justify-content-between align-items-center mb-3">
          <h2>Quản lý bệnh nhân</h2>
          <a href="#" class="btn-add" data-bs-toggle="modal" data-bs-target="#addPatientModal">Thêm bệnh nhân mới</a>
        </div>

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
                      <textarea name="diagnosis" class="form-control" rows="4" placeholder="Nhập chẩn đoán"></textarea>
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