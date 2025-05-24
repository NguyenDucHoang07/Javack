<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Thuốc & Vật tư - Y tế Thông minh</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<link href="/css/home.css" rel="stylesheet" />
</head>
<body>

	<!-- NAVBAR CHÍNH -->
	<nav class="navbar navbar-expand-lg">
		<div class="container">
			<a class="navbar-brand" href="#">Y tế Thông minh</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#mainNav">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="mainNav">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item"><a class="nav-link" href="/giaodien/home">Trang
							chủ</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Giới
							thiệu</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Liên hệ</a></li>
				</ul>
				<form class="d-flex ms-3" role="search">
					<input class="form-control me-2" type="search"
						placeholder="Tìm kiếm thuốc hoặc vật tư" />
					<button class="btn btn-outline-light" type="submit">Tìm</button>
				</form>
			</div>
		</div>
	</nav>

	<!-- SUB-NAVBAR -->
	<nav class="sub-navbar">
		<div class="container d-flex justify-content-center flex-wrap">
			<a class="nav-link mx-3" href="/giaodien/home">Trang chủ</a> <a
				class="nav-link mx-3 actice" href="/giaodien/thuocvatu">Thuốc &
				Vật tư</a> <a class="nav-link mx-3" href="/giaodien/bacsi">Bác sĩ</a> <a
				class="nav-link mx-3" href="/giaodien/lichhenkham">Lịch hẹn khám</a>
		</div>
	</nav>

	<!-- GIỚi THIỆU CHUNG -->
	<section class="section section-light">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-md-6">
					<h2>Giới thiệu Thuốc & Vật tư</h2>
					<p>Trang này giúp bạn tra cứu nhanh chóng thông tin về các loại
						thuốc và vật tư y tế đang được sử dụng trong hệ thống bệnh viện.
						Chỉ với vài thao tác, bạn có thể biết rõ chức năng, liều dùng, và
						hướng dẫn an toàn.</p>
				</div>
				<div class="col-md-6 text-center">
					<img src="/images/thuocvattu.png" alt="Giới thiệu"
						class="img-fluid rounded-img">
				</div>
			</div>
		</div>
	</section>

	<!-- DANH MỤC THUỐC -->
	<section class="section section-alt">
		<div class="container">
			<h2 class="text-center mb-5">Danh sách Thuốc</h2>
			<div class="row">

				<!-- Paracetamol -->
				<div class="col-md-4 mb-4">
					<div class="card h-100 shadow-sm">
						<img src="/images/pracetamol-removebg-preview.png"
							class="card-img-top" alt="Paracetamol">
						<div class="card-body d-flex flex-column">
							<h5 class="card-title">Paracetamol</h5>
							<p class="card-text">Giảm đau, hạ sốt, sử dụng rộng rãi trong
								y tế.</p>
							<button type="button" class="btn btn-warning mt-auto"
								data-bs-toggle="modal" data-bs-target="#modalParacetamol">
								Xem thông tin</button>
						</div>
					</div>
				</div>

				<!-- Amoxicillin -->
				<div class="col-md-4 mb-4">
					<div class="card h-100 shadow-sm">
						<img src="/images/khangsinh-removebg-preview.png"
							class="card-img-top" alt="Amoxicillin">
						<div class="card-body d-flex flex-column">
							<h5 class="card-title">Thuốc kháng sinh</h5>
							<p class="card-text">Kháng sinh phổ rộng, dùng trong nhiều
								bệnh nhiễm trùng.</p>
							<button type="button" class="btn btn-warning mt-auto"
								data-bs-toggle="modal" data-bs-target="#modalAmoxicillin">
								Xem thông tin</button>
						</div>
					</div>
				</div>

				<!-- Ibuprofen -->
				<div class="col-md-4 mb-4">
					<div class="card h-100 shadow-sm">
						<img src="/images/Ibuprofen-removebg-preview.png"
							class="card-img-top" alt="Ibuprofen">
						<div class="card-body d-flex flex-column">
							<h5 class="card-title">Ibuprofen</h5>
							<p class="card-text">Chống viêm, giảm đau nhẹ, hạ sốt hiệu
								quả cao.</p>
							<button type="button" class="btn btn-warning mt-auto"
								data-bs-toggle="modal" data-bs-target="#modalIbuprofen">
								Xem thông tin</button>
						</div>
					</div>
				</div>

			</div>
		</div>
	</section>

	<!-- Modal Paracetamol -->
	<div class="modal fade" id="modalParacetamol" tabindex="-1"
		aria-labelledby="modalParacetamolLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-lg">
			<div class="modal-content">
				<div class="modal-header bg-warning text-dark">
					<h5 class="modal-title" id="modalParacetamolLabel">Thông tin
						Paracetamol</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Đóng"></button>
				</div>
				<div class="modal-body">
					<p>Paracetamol là thuốc giảm đau, hạ sốt, được sử dụng rộng rãi
						trong y tế với độ an toàn cao.</p>
					<ul>
						<li><strong>Liều dùng:</strong> 500mg mỗi 6 giờ.</li>
						<li><strong>Tác dụng phụ:</strong> Có thể gây dị ứng ở một số
							trường hợp.</li>
						<li><strong>Chú ý:</strong> Không dùng quá liều quy định.</li>
					</ul>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Đóng</button>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal Amoxicillin -->
	<div class="modal fade" id="modalAmoxicillin" tabindex="-1"
		aria-labelledby="modalAmoxicillinLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-lg">
			<div class="modal-content">
				<div class="modal-header bg-warning text-dark">
					<h5 class="modal-title" id="modalAmoxicillinLabel">Thông tin
						Thuốc kháng sinh</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Đóng"></button>
				</div>
				<div class="modal-body">
					<p>Thuốc kháng sinh Amoxicillin được dùng để điều trị nhiều
						bệnh nhiễm trùng do vi khuẩn gây ra.</p>
					<ul>
						<li><strong>Liều dùng:</strong> 250-500mg mỗi 8 giờ, tùy theo
							chỉ định.</li>
						<li><strong>Tác dụng phụ:</strong> Buồn nôn, tiêu chảy, dị
							ứng.</li>
						<li><strong>Chú ý:</strong> Không sử dụng nếu dị ứng
							penicillin.</li>
					</ul>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Đóng</button>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal Ibuprofen -->
	<div class="modal fade" id="modalIbuprofen" tabindex="-1"
		aria-labelledby="modalIbuprofenLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-lg">
			<div class="modal-content">
				<div class="modal-header bg-warning text-dark">
					<h5 class="modal-title" id="modalIbuprofenLabel">Thông tin
						Ibuprofen</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Đóng"></button>
				</div>
				<div class="modal-body">
					<p>Ibuprofen là thuốc chống viêm không steroid, giúp giảm đau
						nhẹ và hạ sốt hiệu quả.</p>
					<ul>
						<li><strong>Liều dùng:</strong> 200-400mg mỗi 6-8 giờ.</li>
						<li><strong>Tác dụng phụ:</strong> Buồn nôn, đau dạ dày, dị
							ứng da.</li>
						<li><strong>Chú ý:</strong> Tránh dùng với bệnh nhân có vấn
							đề về thận hoặc loét dạ dày.</li>
					</ul>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Đóng</button>
				</div>
			</div>
		</div>
	</div>



	<!-- DANH MỤC VẬT TƯ Y TẾ -->
	<section class="section section-light">
		<div class="container">
			<h2 class="text-center mb-5">Danh sách Vật tư Y tế</h2>
			<div class="row">

				<!-- Bưng găc tiệt trùng -->
				<div class="col-md-4 mb-4">
					<div class="card h-100 shadow-sm">
						<img src="/images/gac-removebg-preview.png" class="card-img-top"
							alt="Bưng găc tiệt trùng">
						<div class="card-body d-flex flex-column">
							<h5 class="card-title">Bưng găc tiệt trùng</h5>
							<p class="card-text">Dùng trong phẫu thuật, vô trùng tuyệt
								đối, an toàn khi sử dụng.</p>
							<button type="button" class="btn btn-warning mt-auto"
								data-bs-toggle="modal" data-bs-target="#modalGac">Xem
								thông tin</button>
						</div>
					</div>
				</div>

				<!-- Dây truyền -->
				<div class="col-md-4 mb-4">
					<div class="card h-100 shadow-sm">
						<img src="/images/day1-removebg-preview.png" class="card-img-top"
							alt="Dây truyền">
						<div class="card-body d-flex flex-column">
							<h5 class="card-title">Dây truyền</h5>
							<p class="card-text">Hỗ trợ truyền dịch, truyền máu trong các
								quy trình y tế chuẩn.</p>
							<button type="button" class="btn btn-warning mt-auto"
								data-bs-toggle="modal" data-bs-target="#modalDayTruyen">
								Xem thông tin</button>
						</div>
					</div>
				</div>

				<!-- Khẩu trang Y tế -->
				<div class="col-md-4 mb-4">
					<div class="card h-100 shadow-sm">
						<img src="/images/khautrang-removebg-preview.png"
							class="card-img-top" alt="Khẩu trang Y tế">
						<div class="card-body d-flex flex-column">
							<h5 class="card-title">Khẩu trang Y tế</h5>
							<p class="card-text">Ngăn giọt vi khuẩn, bảo vệ người dùng
								trong môi trường y tế nguy cơ.</p>
							<button type="button" class="btn btn-warning mt-auto"
								data-bs-toggle="modal" data-bs-target="#modalKhauTrang">
								Xem thông tin</button>
						</div>
					</div>
				</div>

			</div>
		</div>
	</section>

	<!-- Modal Bưng găc tiệt trùng -->
	<div class="modal fade" id="modalGac" tabindex="-1"
		aria-labelledby="modalGacLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-lg">
			<div class="modal-content">
				<div class="modal-header bg-warning text-dark">
					<h5 class="modal-title" id="modalGacLabel">Thông tin Bưng găc
						tiệt trùng</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Đóng"></button>
				</div>
				<div class="modal-body">
					<p>Bưng găc tiệt trùng được sử dụng rộng rãi trong phẫu thuật
						để đảm bảo môi trường vô trùng tuyệt đối, giảm nguy cơ nhiễm
						khuẩn.</p>
					<ul>
						<li><strong>Chất liệu:</strong> Vải không dệt chất lượng cao.</li>
						<li><strong>Ưu điểm:</strong> Kháng khuẩn, thấm hút tốt, an
							toàn khi sử dụng.</li>
						<li><strong>Lưu ý:</strong> Không tái sử dụng sau khi đã
							dùng.</li>
					</ul>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Đóng</button>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal Dây truyền -->
	<div class="modal fade" id="modalDayTruyen" tabindex="-1"
		aria-labelledby="modalDayTruyenLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-lg">
			<div class="modal-content">
				<div class="modal-header bg-warning text-dark">
					<h5 class="modal-title" id="modalDayTruyenLabel">Thông tin Dây
						truyền</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Đóng"></button>
				</div>
				<div class="modal-body">
					<p>Dây truyền là thiết bị y tế hỗ trợ truyền dịch và truyền
						máu, đảm bảo an toàn trong các quy trình chuẩn y tế.</p>
					<ul>
						<li><strong>Chất liệu:</strong> Nhựa y tế cao cấp, không gây
							dị ứng.</li>
						<li><strong>Đặc điểm:</strong> Thiết kế chắc chắn, dễ dàng
							kết nối.</li>
						<li><strong>Hướng dẫn:</strong> Sử dụng theo hướng dẫn của
							nhân viên y tế.</li>
					</ul>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Đóng</button>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal Khẩu trang Y tế -->
	<div class="modal fade" id="modalKhauTrang" tabindex="-1"
		aria-labelledby="modalKhauTrangLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-lg">
			<div class="modal-content">
				<div class="modal-header bg-warning text-dark">
					<h5 class="modal-title" id="modalKhauTrangLabel">Thông tin
						Khẩu trang Y tế</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Đóng"></button>
				</div>
				<div class="modal-body">
					<p>Khẩu trang y tế giúp ngăn chặn giọt bắn, bảo vệ người dùng
						trong môi trường y tế và cộng đồng.</p>
					<ul>
						<li><strong>Chất liệu:</strong> Vải lọc đa lớp, thoáng khí.</li>
						<li><strong>Công dụng:</strong> Ngăn ngừa vi khuẩn và bụi
							mịn.</li>
						<li><strong>Lưu ý:</strong> Thay khẩu trang thường xuyên,
							không dùng lại.</li>
					</ul>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Đóng</button>
				</div>
			</div>
		</div>
	</div>


	<!-- FOOTER -->
	<footer>
		<div class="container">
			<p>&copy; 2025 Hệ thống quản lý Y tế Thông minh. Mọi quyền được
				bảo lưu.</p>
		</div>
	</footer>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
