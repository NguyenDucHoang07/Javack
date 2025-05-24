<%@ page contentType="text/html; charset=UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
    <html lang="vi">

    <head>
      <meta charset="UTF-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1" />
      <title>Đặt Lịch Hẹn Khám - Hệ thống Y tế Thông minh</title>
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
      <link href="/css/home.css" rel="stylesheet" />
    </head>

    <body>

      <!-- THÔNG BÁO THÀNH CÔNG -->
      <c:if test="${not empty successMessage}">
        <div class="alert alert-success alert-dismissible fade show m-3" role="alert">
          ${successMessage}
          <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Đóng"></button>
        </div>
      </c:if>

      <!-- NAVBAR CHÍNH -->
      <nav class="navbar navbar-expand-lg">
        <div class="container">
          <a class="navbar-brand" href="#">Y tế Thông minh</a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mainNav">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="mainNav">
            <ul class="navbar-nav ms-auto">
              <li class="nav-item"><a class="nav-link" href="#">Trang chủ</a></li>
              <li class="nav-item"><a class="nav-link" href="#">Giới thiệu</a></li>
              <li class="nav-item"><a class="nav-link" href="#">Liên hệ</a></li>
            </ul>
            <form class="d-flex ms-3" role="search">
              <input class="form-control me-2" type="search" placeholder="Tìm kiếm" />
              <button class="btn btn-outline-light" type="submit">Tìm</button>
            </form>
          </div>
        </div>
      </nav>

      <!-- SUB-NAVBAR -->
      <nav class="sub-navbar">
        <div class="container d-flex justify-content-center flex-wrap">
          <a class="nav-link mx-3" href="/giaodien/home">Trang chủ</a>
          <a class="nav-link mx-3" href="/giaodien/thuocvattu">Thuốc & Vật tư</a>
          <a class="nav-link mx-3" href="/giaodien/bacsi">Bác sĩ</a>
          <a class="nav-link mx-3 active" href="#">Lịch hẹn khám</a>
        </div>
      </nav>

      <!-- HERO -->
      <section class="hero py-5">
        <div class="container">
          <div class="row align-items-center">
            <div class="col-md-6">
              <h1>Đặt Lịch Hẹn Khám Nhanh Chóng</h1>
              <p>Hãy điền đầy đủ thông tin dưới đây để được đội ngũ y tế liên hệ và hỗ trợ đặt lịch khám phù hợp với
                bạn.</p>
            </div>
            <div class="col-md-6 text-center">
              <img src="/images/aotrang.jpg" alt="Đặt lịch hẹn khám" class="img-fluid rounded-img" />
            </div>
          </div>
        </div>
      </section>

      <!-- FORM ĐẶT LỊCH HẸN -->
      <section class="section section-light py-5">
        <div class="container">
          <form action="/admin/clinicschedule/giaodien/submit-lichhen" method="post">
            <div class="row mb-3">
              <div class="col-md-6">
                <label for="ten" class="form-label">Họ và Tên <span class="text-danger">*</span></label>
                <input type="text" class="form-control" id="ten" name="ten" required />
                <div class="invalid-feedback">Vui lòng nhập họ và tên.</div>
              </div>
              <div class="col-md-3">
                <label for="tuoi" class="form-label">Tuổi <span class="text-danger">*</span></label>
                <input type="number" class="form-control" id="tuoi" name="tuoi" min="0" max="150" required />
                <div class="invalid-feedback">Vui lòng nhập tuổi hợp lệ.</div>
              </div>
              <div class="col-md-3">
                <label for="ngaysinh" class="form-label">Ngày sinh <span class="text-danger">*</span></label>
                <input type="date" class="form-control" id="ngaysinh" name="ngaysinh" required />
                <div class="invalid-feedback">Vui lòng chọn ngày sinh.</div>
              </div>
            </div>

            <div class="mb-3">
              <label for="thongtinKham" class="form-label">Thông tin khám <span class="text-danger">*</span></label>
              <select class="form-select" id="thongtinKham" name="thongtinKham" required>
                <option value="" selected disabled>Chọn loại khám</option>
                <option value="Khám tổng quát">Khám tổng quát</option>
                <option value="Khám chuyên khoa">Khám chuyên khoa</option>
                <option value="Khám tai mũi họng">Khám tai mũi họng</option>
                <option value="Khám sản phụ khoa">Khám sản phụ khoa</option>
                <option value="Khám nhi khoa">Khám nhi khoa</option>
              </select>
              <div class="invalid-feedback">Vui lòng chọn loại khám.</div>
            </div>

            <div class="mb-3">
              <label for="chitietBenh" class="form-label">Chi tiết bệnh tình <span class="text-danger">*</span></label>
              <textarea class="form-control" id="chitietBenh" name="chitietBenh" rows="4"
                placeholder="Mô tả triệu chứng hoặc tình trạng bệnh" required></textarea>
              <div class="invalid-feedback">Vui lòng nhập chi tiết bệnh tình.</div>
            </div>

            <div class="mb-3">
              <label for="thoigianKham" class="form-label">Thời gian khám được <span
                  class="text-danger">*</span></label>
              <input type="datetime-local" class="form-control" id="thoigianKham" name="thoigianKham" required />
              <div class="invalid-feedback">Vui lòng chọn thời gian khám.</div>
            </div>

            <div class="mb-3">
              <label for="diachi" class="form-label">Địa chỉ <span class="text-danger">*</span></label>
              <input type="text" class="form-control" id="diachi" name="diachi" placeholder="Nhập địa chỉ liên hệ"
                required />
              <div class="invalid-feedback">Vui lòng nhập địa chỉ.</div>
            </div>

            <div class="mb-3">
              <label for="sodienthoai" class="form-label">Số điện thoại <span class="text-danger">*</span></label>
              <input type="tel" class="form-control" id="sodienthoai" name="sodienthoai"
                placeholder="Nhập số điện thoại liên hệ" pattern="[0-9]{9,15}" required />
              <div class="invalid-feedback">Vui lòng nhập số điện thoại hợp lệ (9-15 số).</div>
            </div>

            <button type="submit" class="btn btn-primary">Đặt lịch hẹn</button>
          </form>
        </div>
      </section>

      <!-- FOOTER -->
      <footer>
        <div class="container text-center py-3">
          <p>&copy; 2025 Hệ thống Y tế Thông minh. Mọi quyền được bảo lưu.</p>
        </div>
      </footer>

      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
      <script>
        (() => {
          'use strict'
          const forms = document.querySelectorAll('form');
          Array.from(forms).forEach(form => {
            form.addEventListener('submit', event => {
              if (!form.checkValidity()) {
                event.preventDefault();
                event.stopPropagation();
              }
              form.classList.add('was-validated');
            }, false);
          });
        })();
      </script>
    </body>

    </html>