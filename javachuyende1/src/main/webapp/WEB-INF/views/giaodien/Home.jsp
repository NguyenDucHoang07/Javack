<%@ page contentType="text/html; charset=UTF-8" %>
	<!DOCTYPE html>
	<html lang="vi">

	<head>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<title>Hệ thống Y tế Thông minh</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
		<link href="/css/home.css" rel="stylesheet" />
		<!-- Link đến file CSS -->
	</head>

	<body>

		<!-- NAVBAR CHÍNH -->

		<jsp:include page="./header.jsp" />



		<!-- SUB-NAVBAR -->
		<nav class="sub-navbar">
			<div class="container d-flex justify-content-center flex-wrap">
				<a class="nav-link mx-3 active " href="#">Trang chủ</a>
				<a class="nav-link mx-3" href="/giaodien/thuocvattu">Thuốc & Vật tư</a>
				<a class="nav-link mx-3" href="/giaodien/bacsi">Bác sĩ</a>
				<a class="nav-link mx-3" href="/giaodien/lichhenkham">Lịch hẹn khám</a>
			</div>
		</nav>

		<!-- CAROUSEL -->
		<div id="demo" class="carousel slide mx-auto" data-bs-ride="carousel" style="width: 90%;">
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="/images/anhbia4.jpg" class="d-block w-100" alt="Slide 1">
				</div>
				<div class="carousel-item">
					<img src="/images/anhbia3.jpg" class="d-block w-100" alt="Slide 2">
				</div>
				<div class="carousel-item">
					<img src="/images/anhbia2.jpg" class="d-block w-100" alt="Slide 3">
				</div>
			</div>
			<button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
				<span class="carousel-control-prev-icon"></span>
			</button>
			<button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
				<span class="carousel-control-next-icon"></span>
			</button>
		</div>

		<!-- HERO -->
		<section class="hero">
			<div class="container">
				<div class="row align-items-center">
					<div class="col-md-6">
						<h1>Hệ thống Quản lý Y tế Thông minh</h1>
						<p>Hỗ trợ cán bộ và bệnh nhân trong việc truy cập thông tin y
							tế, đặt lịch khám, và theo dõi sức khỏe dễ dàng, mọi lúc mọi nơi.</p>
						<a href="#" class="btn btn-primary btn-lg">Truy cập hệ thống</a>
					</div>
					<div class="col-md-6 text-center">
						<img src="/images/nuchinh.jpg" class="img-fluid rounded-img" alt="Nữ y tá">
					</div>
				</div>
			</div>
		</section>
		<section class="section section-light">
			<div class="container">
				<div class="row align-items-center">
					<!-- Bên trái: Nội dung -->
					<div class="col-md-6">
						<h2>Ý nghĩa của ứng dụng</h2>
						<p>Ứng dụng Hệ thống Y tế Thông minh không chỉ đơn thuần là
							công cụ số hóa thông tin bệnh nhân, mà còn là cầu nối giữa người
							dân và đội ngũ y tế. Giúp rút ngắn thời gian chờ khám, nâng cao
							trải nghiệm người bệnh, đảm bảo sự minh bạch và chính xác trong
							lưu trữ hồ sơ sức khỏe.</p>
						<p>Với công nghệ hiện đại, mọi thao tác đều trở nên dễ dàng, an
							toàn và bảo mật cao, mở ra hướng đi mới trong chuyển đổi số ngành
							y tế.</p>
					</div>

					<!-- Bên phải: Hình ảnh -->
					<div class="col-md-6 text-center">
						<img src="/images/yte.jpg" alt="Ý nghĩa ứng dụng" class="img-fluid rounded-img" />
					</div>
				</div>
			</div>
		</section>

		<!-- TÍNH NĂNG -->
		<section class="section-light">
			<div class="container">
				<h2 class="text-center mb-4">Tính năng hệ thống</h2>
				<div class="row text-center">
					<div class="col-md-4">
						<h5>✔️ Quản lý hồ sơ bệnh nhân</h5>
						<p>Truy xuất nhanh chóng, bảo mật tuyệt đối và dễ dàng cập
							nhật.</p>
					</div>
					<div class="col-md-4">
						<h5>🔐 Bảo mật chuẩn quốc tế</h5>
						<p>Tuân thủ các tiêu chuẩn bảo mật hiện đại nhất trong ngành y
							tế.</p>
					</div>
					<div class="col-md-4">
						<h5>📶 Truy cập mọi lúc, mọi nơi</h5>
						<p>Tương thích với mọi thiết bị, giúp người dùng dễ dàng theo
							dõi và quản lý.</p>
					</div>
				</div>
			</div>
		</section>

		<!-- ĐỘI NGŨ -->
		<section class="section-alt">
			<div class="container">
				<h2 class="text-center mb-4">Đội ngũ phát triển</h2>
				<div class="row text-center">
					<div class="col-md-4">
						<img src="/images/thao.jpg" class="rounded-circle mb-3" width="120" height="120" />
						<h6>Nguyễn Thuận Thảo</h6>
						<p>Thiết kế giao diện & trải nghiệm người dùng</p>
					</div>
					<div class="col-md-4">
						<img src="/images/nguyen.jpg" class="rounded-circle mb-3" width="120" height="120" />
						<h6>Nguyễn Khánh Nguyên</h6>
						<p>Front-end & Backend Developer</p>
					</div>
					<div class="col-md-4">
						<img src="/images/hoang.jpg" class="rounded-circle mb-3" width="120" height="120" />
						<h6>Nguyễn Đức Hoàng</h6>
						<p>Quản lý dữ liệu & hệ thống máy chủ</p>
					</div>
				</div>
			</div>
		</section>

		<!-- FOOTER -->
		<footer>
			<div class="container">
				<p>&copy; 2025 Hệ thống Y tế Thông minh. Mọi quyền được bảo lưu.</p>
			</div>
		</footer>

		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	</body>

	</html>