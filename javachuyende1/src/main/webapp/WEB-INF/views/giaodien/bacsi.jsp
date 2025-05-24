<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Đội ngũ Bác sĩ - Y tế Thông minh</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
  <link href="/css/home.css" rel="stylesheet" />
</head>
<body>

  <!-- NAVBAR CHÍNH -->
  <nav class="navbar navbar-expand-lg">
    <div class="container">
      <a class="navbar-brand" href="#">Y tế Thông minh</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mainNav">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="mainNav">
        <ul class="navbar-nav ms-auto">
          <li class="nav-item"><a class="nav-link" href="/giaodien/home">Trang chủ</a></li>
          <li class="nav-item"><a class="nav-link" href="#">Giới thiệu</a></li>
          <li class="nav-item"><a class="nav-link" href="#">Liên hệ</a></li>
        </ul>
        <form class="d-flex ms-3" role="search">
          <input class="form-control me-2" type="search" placeholder="Tìm kiếm bác sĩ" />
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
      <a class="nav-link mx-3 active" href="#">Bác sĩ</a>
      <a class="nav-link mx-3" href="/giaodien/lichhenkham">Lịch hẹn khám</a>
    </div>
  </nav>

  <!-- GIỚI THIỆU ĐỘI NGŨ BÁC SĨ -->
  <section class="section section-light">
    <div class="container">
      <div class="row align-items-center">
        <div class="col-md-6">
          <h2>Đội ngũ Bác sĩ chuyên nghiệp</h2>
          <p>
            Chúng tôi tự hào sở hữu đội ngũ bác sĩ giàu kinh nghiệm, tận tâm và có chuyên môn cao, sẵn sàng phục vụ và chăm sóc sức khỏe cho cộng đồng.
          </p>
          <p>
            Mỗi bác sĩ được đào tạo bài bản và không ngừng cập nhật kiến thức y khoa hiện đại để mang lại dịch vụ y tế tốt nhất.
          </p>
        </div>
        <div class="col-md-6 text-center">
          <img src="/images/aoxanh.jpg" alt="Đội ngũ bác sĩ" class="img-fluid rounded-img" />
        </div>
      </div>
    </div>
  </section>

  <!-- DANH SÁCH BÁC SĨ -->
  <section class="section section-alt">
    <div class="container">
      <h2 class="text-center mb-5">Danh sách Bác sĩ</h2>
      <div class="row">

        <!-- Bác sĩ 1 -->
        <div class="col-md-4 mb-4">
          <div class="card h-100 shadow-sm">
            <img src="/images/nguyen.jpg" class="card-img-top" alt="Bác sĩ Nguyễn Văn A">
            <div class="card-body d-flex flex-column">
              <h5 class="card-title">Nguyễn Văn A</h5>
              <p class="card-text"><strong>Chuyên khoa:</strong> Nội khoa</p>
              <button type="button" class="btn btn-warning mt-auto" data-bs-toggle="modal" data-bs-target="#modalBacsi1">Xem thông tin</button>
            </div>
          </div>
        </div>

        <!-- Bác sĩ 2 -->
        <div class="col-md-4 mb-4">
          <div class="card h-100 shadow-sm">
            <img src="/images/nuchinh.jpg" class="card-img-top" alt="Bác sĩ Trần Thị B">
            <div class="card-body d-flex flex-column">
              <h5 class="card-title">Trần Thị B</h5>
              <p class="card-text"><strong>Chuyên khoa:</strong> Sản phụ khoa</p>
              <button type="button" class="btn btn-warning mt-auto" data-bs-toggle="modal" data-bs-target="#modalBacsi2">Xem thông tin</button>
            </div>
          </div>
        </div>

        <!-- Bác sĩ 3 -->
        <div class="col-md-4 mb-4">
          <div class="card h-100 shadow-sm">
            <img src="/images/thao.jpg" class="card-img-top" alt="Bác sĩ Lê Văn C">
            <div class="card-body d-flex flex-column">
              <h5 class="card-title">Lê Văn C</h5>
              <p class="card-text"><strong>Chuyên khoa:</strong> Ngoại khoa</p>
              <button type="button" class="btn btn-warning mt-auto" data-bs-toggle="modal" data-bs-target="#modalBacsi3">Xem thông tin</button>
            </div>
          </div>
        </div>

      </div>
    </div>
  </section>

  <!-- Modal Bác sĩ 1 -->
  <div class="modal fade" id="modalBacsi1" tabindex="-1" aria-labelledby="modalBacsi1Label" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg">
      <div class="modal-content">
        <div class="modal-header bg-warning text-dark">
          <h5 class="modal-title" id="modalBacsi1Label">Thông tin Bác sĩ Nguyễn Văn A</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Đóng"></button>
        </div>
        <div class="modal-body">
          <p>Bác sĩ Nguyễn Văn A có hơn 15 năm kinh nghiệm trong lĩnh vực Nội khoa, chuyên điều trị các bệnh về tim mạch, hô hấp và tiêu hóa.</p>
          <ul>
            <li>Chứng chỉ chuyên môn cao cấp.</li>
            <li>Tận tâm, thân thiện với bệnh nhân.</li>
            <li>Luôn cập nhật các phương pháp điều trị hiện đại.</li>
          </ul>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
        </div>
      </div>
    </div>
  </div>

  <!-- Modal Bác sĩ 2 -->
  <div class="modal fade" id="modalBacsi2" tabindex="-1" aria-labelledby="modalBacsi2Label" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg">
      <div class="modal-content">
        <div class="modal-header bg-warning text-dark">
          <h5 class="modal-title" id="modalBacsi2Label">Thông tin Bác sĩ Trần Thị B</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Đóng"></button>
        </div>
        <div class="modal-body">
          <p>Bác sĩ Trần Thị B là chuyên gia Sản phụ khoa với hơn 10 năm kinh nghiệm trong chăm sóc sức khỏe mẹ và bé.</p>
          <ul>
            <li>Chuyên môn vững vàng trong chăm sóc thai kỳ.</li>
            <li>Thấu hiểu và tận tâm với bệnh nhân.</li>
            <li>Áp dụng các phương pháp tiên tiến nhất trong điều trị.</li>
          </ul>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
        </div>
      </div>
    </div>
  </div>

  <!-- Modal Bác sĩ 3 -->
  <div class="modal fade" id="modalBacsi3" tabindex="-1" aria-labelledby="modalBacsi3Label" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg">
      <div class="modal-content">
        <div class="modal-header bg-warning text-dark">
          <h5 class="modal-title" id="modalBacsi3Label">Thông tin Bác sĩ Lê Văn C</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Đóng"></button>
        </div>
        <div class="modal-body">
          <p>Bác sĩ Lê Văn C có kinh nghiệm lâu năm trong lĩnh vực Ngoại khoa, đặc biệt chuyên về phẫu thuật chấn thương chỉnh hình.</p>
          <ul>
            <li>Kỹ thuật phẫu thuật hiện đại, an toàn.</li>
            <li>Tư vấn tận tình cho bệnh nhân.</li>
            <li>Luôn cập nhật kiến thức chuyên sâu mới nhất.</li>
          </ul>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
        </div>
      </div>
    </div>
  </div>

  <footer>
    <div class="container text-center py-3">
      <p>&copy; 2025 Hệ thống Y tế Thông minh. Mọi quyền được bảo lưu.</p>
    </div>
  </footer>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
