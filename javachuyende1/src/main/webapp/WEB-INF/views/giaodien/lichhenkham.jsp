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
      <!-- <c:if test="${not empty successMessage}">
        <div class="alert alert-success alert-dismissible fade show m-3" role="alert">
          ${successMessage}
          <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Đóng"></button>
        </div>
      </c:if> -->

      <!-- NAVBAR CHÍNH -->
      <jsp:include page="./header.jsp" />


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
      <form action="/admin/clinicschedule/giaodien/confirm" method="post">
        <!-- các trường như cũ -->
        <div class="row mb-3">
          <div class="col-md-6">
            <label for="appointmentDate" class="form-label">Ngày khám <span class="text-danger">*</span></label>
            <input type="date" class="form-control" id="appointmentDate" name="appointmentDate" required />
          </div>
          <div class="col-md-6">
            <label for="timeSlot" class="form-label">Khung giờ khám <span class="text-danger">*</span></label>
            <select class="form-select" id="timeSlot" name="timeSlot" required>
              <!-- <option value="" selected disabled>Chọn khung giờ</option>
              <option value="08:00 - 09:00">08:00 - 09:00</option>
              <option value="09:00 - 10:00">09:00 - 10:00</option>
              <option value="10:00 - 11:00">10:00 - 11:00</option>
              <option value="13:00 - 14:00">13:00 - 14:00</option>
              <option value="14:00 - 15:00">14:00 - 15:00</option> -->
            </select>
          </div>
        </div>

        <h2 class="mb-4 text-center">Chọn dịch vụ khám</h2>
        <div class="mb-3">
          <div class="row">
            <c:forEach var="svc" items="${services}">
              <div class="col-md-6 col-lg-4 mb-3">
                <div class="form-check">
                  <input class="form-check-input" type="radio" name="serviceId" id="service_${svc.id}" value="${svc.id}"
                    required>
                  <label class="form-check-label" for="service_${svc.id}">
                    ${svc.name}
                  </label>
                </div>
              </div>
            </c:forEach>
          </div>
        </div>

        <div class="mb-3">
          <label for="reason" class="form-label">Lý do khám <span class="text-danger">*</span></label>
          <textarea class="form-control" id="reason" name="reason" rows="4" required></textarea>
        </div>

        <button type="submit" class="btn btn-primary">Tiếp tục</button>
      </form>


      <c:if test="${not empty successMessage}">
        <div class="alert alert-success">
          ${successMessage}
        </div>
      </c:if>


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

        const timeSlots = [
          "08:00",
          "09:00",
          "10:00",
          "11:00",
          "12:00",
          "13:00",
          "14:00",
          "15:00",
          "16:00",
        ];

        const select = document.getElementById('timeSlot');
        timeSlots.forEach(slot => {
          const option = document.createElement('option');
          option.value = slot;
          option.textContent = slot;
          select.appendChild(option);
        });
      </script>
    </body>

    </html>