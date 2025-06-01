<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8">
                <title>Cập nhật lịch khám</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
            </head>

            <body class="bg-light">

                <div class="container mt-5">
                    <div class="card shadow-lg">
                        <div class="card-header bg-primary text-white">
                            <h4 class="mb-0">Cập nhật bác sĩ và trạng thái lịch khám</h4>
                        </div>
                        <div class="card-body">

                            <form:form modelAttribute="appointment" method="post"
                                action="${pageContext.request.contextPath}/appointments/updateStatusDoctor">

                                <form:hidden path="id" />

                                <div class="row g-3 mb-3">
                                    <div class="col-md-4">
                                        <label class="form-label">ID:</label>
                                        <input type="text" class="form-control" value="${appointment.id}" readonly />
                                    </div>
                                    <div class="col-md-8">
                                        <label class="form-label">Bệnh nhân:</label>
                                        <input type="text" class="form-control" value="${appointment.patient.fullName}"
                                            readonly />
                                    </div>
                                </div>

                                <div class="row g-3 mb-3">
                                    <div class="col-md-4">
                                        <label class="form-label">Ngày khám:</label>
                                        <input type="text" class="form-control" value="${appointment.appointmentDate}"
                                            readonly />
                                    </div>
                                    <div class="col-md-4">
                                        <label class="form-label">Khung giờ:</label>
                                        <input type="text" class="form-control" value="${appointment.timeSlot}"
                                            readonly />
                                    </div>
                                    <div class="col-md-4">
                                        <label class="form-label">Chuyên khoa:</label>
                                        <input type="text" class="form-control" value="${appointment.department}"
                                            readonly />
                                    </div>
                                </div>

                                <div class="mb-3">
                                    <label class="form-label">Lý do khám:</label>
                                    <input type="text" class="form-control" value="${appointment.reason}" readonly />
                                </div>

                                <div class="row g-3 mb-3">
                                    <div class="col-md-6">
                                        <label class="form-label">Bác sĩ phụ trách:</label>
                                        <form:select path="doctor.id" cssClass="form-select">
                                            <form:options items="${doctors}" itemValue="id" itemLabel="name" />
                                        </form:select>
                                    </div>

                                    <div class="col-md-6">
                                        <label class="form-label">Trạng thái:</label>
                                        <form:select path="status" cssClass="form-select">
                                            <form:option value="Chưa khám" label="Chưa khám" />
                                            <form:option value="Đã khám" label="Đã khám" />
                                            <form:option value="Xác nhận" label="Xác nhận lịch khám" />
                                        </form:select>
                                    </div>
                                </div>

                                <div class="d-flex justify-content-end mt-4">
                                    <button type="submit" class="btn btn-success me-2">
                                        <i class="bi bi-check-circle"></i> Cập nhật
                                    </button>
                                    <a href="${pageContext.request.contextPath}/appointments" class="btn btn-secondary">
                                        <i class="bi bi-x-circle"></i> Huỷ
                                    </a>
                                </div>

                            </form:form>
                        </div>
                    </div>
                </div>

                <!-- Optional: Bootstrap Icons -->
                <link rel="stylesheet"
                    href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

            </body>

            </html>