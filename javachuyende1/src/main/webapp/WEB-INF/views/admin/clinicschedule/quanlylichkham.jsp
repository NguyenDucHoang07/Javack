<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
		<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

			<!DOCTYPE html>
			<html lang="vi">

			<head>
				<meta charset="UTF-8" />
				<meta name="viewport" content="width=device-width, initial-scale=1.0" />
				<title>Danh sách lịch hẹn</title>
				<!-- Bootstrap CSS -->
				<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
					integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
					crossorigin="anonymous" />
				<!-- Google Fonts: Roboto -->
				<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap"
					rel="stylesheet" />

				<style>
					body {
						font-family: 'Roboto', sans-serif;
						background: linear-gradient(135deg, #e3f2fd 0%, #bbdefb 100%);
						min-height: 100vh;
						display: flex;
						justify-content: center;

						margin: 0;
					}

					.container {
						max-width: 1200px;
						margin: 40px auto;
						padding: 30px;
						background: #ffffff;
						border-radius: 12px;
						box-shadow: 0 8px 24px rgba(0, 0, 0, 0.15);

					}

					h2 {
						font-size: 2rem;
						font-weight: 700;
						color: #1a3c6d;
						text-align: center;
						margin-bottom: 30px;
					}

					.table {
						border-radius: 8px;
						overflow: hidden;
						box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
					}

					.table thead {
						background-color: #1a73e8;
						color: #ffffff;
					}

					.table th,
					.table td {
						padding: 12px 15px;
						vertical-align: middle;
						border: none;
					}

					.table tbody td {
						border-bottom: 1px solid #dee2e6;
					}

					.table-responsive {
						border-radius: 8px;
					}

					@media (max-width: 768px) {
						.container {
							margin: 20px;
							padding: 20px;
						}

						h2 {
							font-size: 1.5rem;
						}

						.table th,
						.table td {
							padding: 10px;
							font-size: 0.9rem;
						}
					}
				</style>
			</head>

			<body>
				<div class="container">
					<h2>Danh sách lịch hẹn</h2>

					<!-- Search form -->
					<form method="get" action="appointments"
						class="mb-3 d-flex justify-content-between align-items-center">
						<input type="text" name="keyword" placeholder="Tìm theo tên bệnh nhân..." value="${keyword}"
							class="form-control me-2" style="max-width: 300px;" />
						<button type="submit" class="btn btn-primary">Tìm kiếm</button>
						<a href="appointments" class="btn btn-secondary ms-2">Xóa tìm kiếm</a>
						<button type="button" class="btn btn-success ms-auto" data-bs-toggle="modal"
							data-bs-target="#addAppointmentModal">
							+ Thêm lịch hẹn mới
						</button>
					</form>
					<!-- Modal Thêm lịch hẹn mới -->
					<div class="modal fade" id="addAppointmentModal" tabindex="-1"
						aria-labelledby="addAppointmentModalLabel" aria-hidden="true">
						<div class="modal-dialog modal-lg">
							<div class="modal-content">
								<form:form modelAttribute="appointment" method="post" action="/appointments/save">
									<div class="modal-header">
										<h5 class="modal-title" id="addAppointmentModalLabel">Thêm lịch hẹn mới</h5>
										<button type="button" class="btn-close" data-bs-dismiss="modal"
											aria-label="Đóng"></button>
									</div>
									<div class="modal-body">
										<div class="mb-3">
											<label for="patientName" class="form-label">Tên bệnh nhân</label>
											<input type="text" class="form-control" id="patientName" name="patientName"
												required>
										</div>
										<!-- <select id="doctorId" name="doctor.id" class="form-select" required>
										<option value="">Chọn bác sĩ</option>
										<c:forEach var="doctor" items="${doctors}">
											<option value="${doctor.id}">${doctor.name}</option>
										</c:forEach>
									</select> -->

										<div class="mb-3">
											<label for="doctorId" class="form-label">Bác sĩ</label>
											<form:select path="doctor.id" cssClass="form-select" id="doctorId"
												required="required">
												<form:option value="" label="Chọn bác sĩ" />
												<form:options items="${listDoctor}" itemValue="id" itemLabel="name" />
											</form:select>
										</div>


										<div class="mb-3">
											<label for="appointmentDate" class="form-label">Ngày khám</label>
											<input type="date" class="form-control" id="appointmentDate"
												name="appointmentDate" required>
										</div>
										<div class="form-group">
											<label for="timeSlot" class="form-label">Khung giờ <span
													class="text-danger">*</span></label>
											<input type="time" id="timeSlot" name="timeSlot" class="form-control"
												min="08:00" max="17:00" step="1800" required />
											<div class="invalid-feedback">Vui lòng chọn khung giờ trong khoảng 08:00 -
												17:00.</div>
										</div>

										<div class="form-group">
											<label for="department" class="form-label">Chuyên khoa <span
													class="text-danger">*</span></label>
											<select id="department" name="department" class="form-select" required>
												<option value="">Chọn chuyên khoa</option>
												<option value="Nội khoa">Nội khoa</option>
												<option value="Ngoại khoa">Ngoại khoa</option>
												<option value="Nhi khoa">Nhi khoa</option>
												<option value="Sản khoa">Sản khoa</option>
												<option value="Răng hàm mặt">Răng hàm mặt</option>
											</select>
											<div class="invalid-feedback">Vui lòng chọn chuyên khoa.</div>
										</div>
										<div class="mb-3">
											<label for="reason" class="form-label">Lý do</label>
											<textarea class="form-control" id="reason" name="reason" rows="3"
												required></textarea>
										</div>
										<div class="mb-3">
											<label for="status" class="form-label">Trạng thái</label>
											<select class="form-select" id="status" name="status" required>
												<option value="Chưa khám">Chưa khám</option>
												<option value="Đã khám">Đã khám</option>
											</select>
										</div>
										<!-- Nếu cần ngày tạo mặc định server xử lý, không cần nhập ở đây -->
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-bs-dismiss="modal">Đóng</button>
										<button type="submit" class="btn btn-primary">Lưu lịch hẹn</button>
									</div>
								</form:form>
							</div>
						</div>
					</div>


					<div class="table-responsive">
						<table class="table table-hover align-middle">
							<thead>
								<tr>
									<th scope="col">ID</th>
									<th scope="col">Bệnh nhân</th>
									<th scope="col">Bác sĩ</th>
									<th scope="col">Ngày khám</th>
									<th scope="col">Khung giờ</th>
									<th scope="col">Chuyên khoa</th>
									<th scope="col">Lý do</th>
									<th scope="col">Trạng thái</th>
									<th scope="col">Ngày tạo</th>
									<th scope="col" style="min-width: 120px;">Hành động</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="a" items="${appointments}">
									<tr>
										<td>${a.id}</td>
										<td>${a.patient.name}</td>
										<td>${a.doctor.name}</td>
										<td>${a.appointmentDate}</td>
										<td>${a.timeSlot}</td>
										<td>${a.department}</td>
										<td>${a.reason}</td>
										<td>${a.status}</td>
										<td>${a.createdAt}</td>
										<td>
											<a href="appointments/edit/${a.id}"
												class="btn btn-sm btn-warning me-1">Sửa</a>
											<a href="appointments/delete/${a.id}" class="btn btn-sm btn-danger"
												onclick="return confirm('Bạn có chắc muốn xóa lịch hẹn này?');">Xóa</a>
										</td>
									</tr>
								</c:forEach>
								<c:if test="${empty appointments}">
									<tr>
										<td colspan="10" class="text-center">Không có lịch hẹn nào</td>
									</tr>
								</c:if>
							</tbody>
						</table>
					</div>
				</div>

				<!-- Bootstrap JS bundle -->
				<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
					integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
					crossorigin="anonymous">
					</script>

			</body>


			</html>