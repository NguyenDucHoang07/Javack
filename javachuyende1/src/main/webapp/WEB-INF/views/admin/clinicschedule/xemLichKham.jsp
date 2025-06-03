<%@ page contentType="text/html; charset=UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!DOCTYPE html>
        <html lang="vi">

        <head>
            <meta charset="UTF-8" />
            <title>Xem lịch khám</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
        </head>

        <body>


            <div class="container mt-4">
                <h2>Danh sách lịch khám của bạn</h2>

                <div class="table-responsive mt-3">
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

                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="a" items="${appointments}">
                                <tr>
                                    <td class="font-monospace text-muted">${a.id}</td>
                                    <td class="fw-bold">${a.patient.fullName}</td>
                                    <td class="fw-bold">${a.doctor.name}</td>
                                    <td class="text-primary">${a.appointmentDate}</td>
                                    <td class="text-info">${a.timeSlot}</td>
                                    <td class="text-success">${a.department}</td>
                                    <td>${a.reason}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${a.status == 'Đã khám'}">
                                                <span class="badge bg-success">${a.status}</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="badge bg-warning text-dark">${a.status}</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td class="text-primary">${a.formattedCreatedAt}</td>

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

            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        </body>

        </html>