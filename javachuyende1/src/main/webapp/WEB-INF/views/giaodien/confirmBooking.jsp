<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page contentType="text/html; charset=UTF-8" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

            <!DOCTYPE html>
            <html lang="vi">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Xác nhận lịch hẹn</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
                <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
                <style>
                    body {
                        background-color: #f4f7fa;
                        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                    }

                    .section-light {
                        min-height: 100vh;
                        display: flex;
                        align-items: center;
                        justify-content: center;
                        padding: 2rem 0;
                    }

                    .card {
                        border: none;
                        border-radius: 15px;
                        overflow: hidden;
                        transition: transform 0.3s ease, box-shadow 0.3s ease;
                    }

                    .card:hover {
                        transform: translateY(-5px);
                        box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
                    }

                    .card-header {
                        background: linear-gradient(135deg, #007bff, #00c4b4);
                        padding: 1.5rem;
                        border-bottom: none;
                    }

                    .card-header h2 {
                        font-size: 1.75rem;
                        font-weight: 600;
                    }

                    .list-group-item {
                        border: none;
                        padding: 1rem 1.5rem;
                        background-color: #fff;
                        transition: background-color 0.2s ease;
                    }

                    .list-group-item:hover {
                        background-color: #f8f9fa;
                    }

                    .list-group-item i {
                        color: #007bff;
                        font-size: 1.2rem;
                    }

                    .list-group-item strong,
                    .list-group-item p {
                        color: #333;
                    }

                    .btn-success {
                        background-color: #28a745;
                        border: none;
                        border-radius: 8px;
                        padding: 0.75rem 1.5rem;
                        font-weight: 500;
                        transition: background-color 0.3s ease, transform 0.2s ease;
                    }

                    .btn-success:hover {
                        background-color: #218838;
                        transform: scale(1.05);
                    }

                    .btn-outline-secondary {
                        border-radius: 8px;
                        padding: 0.75rem 1.5rem;
                        font-weight: 500;
                        transition: background-color 0.3s ease, transform 0.2s ease;
                    }

                    .btn-outline-secondary:hover {
                        background-color: #e9ecef;
                        transform: scale(1.05);
                    }

                    .form-container {
                        display: flex;
                        gap: 1rem;
                        justify-content: space-between;
                        padding: 1rem 1.5rem;
                    }

                    @media (max-width: 576px) {
                        .card {
                            margin: 0 1rem;
                        }

                        .form-container {
                            flex-direction: column;
                            gap: 0.75rem;
                        }

                        .btn-success,
                        .btn-outline-secondary {
                            width: 100%;
                        }
                    }
                </style>
            </head>

            <body>
                <section class="section section-light py-5">
                    <div class="container">
                        <div class="card shadow-sm mx-auto" style="max-width: 600px;">
                            <div class="card-header bg-primary text-white text-center">
                                <h2 class="mb-0">Xác nhận lịch hẹn</h2>
                            </div>
                            <div class="card-body">
                                <ul class="list-group list-group-flush mb-4">
                                    <li class="list-group-item d-flex justify-content-between align-items-center">
                                        <span><i class="bi bi-person-fill me-2"></i>Người đặt:</span>
                                        <strong>${loggedInUser.name}</strong>
                                    </li>
                                    <li class="list-group-item d-flex justify-content-between align-items-center">
                                        <span><i class="bi bi-telephone-fill me-2"></i>Số điện thoại:</span>
                                        <strong>${loggedInUser.phone}</strong>
                                    </li>
                                    <li class="list-group-item d-flex justify-content-between align-items-center">
                                        <span><i class="bi bi-calendar-event-fill me-2"></i>Ngày khám:</span>
                                        <strong>${appointmentDate}</strong>
                                    </li>
                                    <li class="list-group-item d-flex justify-content-between align-items-center">
                                        <span><i class="bi bi-clock-fill me-2"></i>Khung giờ:</span>
                                        <strong>${timeSlot}</strong>
                                    </li>
                                    <li class="list-group-item d-flex justify-content-between align-items-center">
                                        <span><i class="bi bi-heart-pulse-fill me-2"></i>Dịch vụ:</span>
                                        <strong>${service.name}</strong>
                                    </li>
                                    <li class="list-group-item d-flex justify-content-between align-items-center">
                                        <span><i class="bi bi-currency-dollar me-2"></i>Giá tiền:</span>
                                        <strong>
                                            <fmt:formatNumber value="${service.cost}" groupingUsed="true"
                                                maxFractionDigits="0" />
                                            đ
                                        </strong>
                                    </li>

                                    <li class="list-group-item">
                                        <span><i class="bi bi-chat-text-fill me-2"></i>Lý do:</span>
                                        <span class="mb-0 fst-italic">${reason}</span>
                                    </li>
                                </ul>

                                <form action="/admin/clinicschedule/giaodien/submit-lichhen" method="post">
                                    <input type="hidden" name="appointmentDate" value="${appointmentDate}" />
                                    <input type="hidden" name="timeSlot" value="${timeSlot}" />
                                    <input type="hidden" name="serviceId" value="${service.id}" />
                                    <!-- phải là serviceId -->
                                    <input type="hidden" name="reason" value="${reason}" />
                                    <button type="submit">Xác nhận đặt lịch</button>
                                </form>

                            </div>
                        </div>
                    </div>
                    <c:if test="${not empty errorMessage}">
                        <div class="alert alert-danger">
                            ${errorMessage}
                        </div>
                    </c:if>

                    <c:if test="${not empty successMessage}">
                        <div class="alert alert-success">
                            ${successMessage}
                        </div>
                    </c:if>


                </section>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
            </body>

            </html>