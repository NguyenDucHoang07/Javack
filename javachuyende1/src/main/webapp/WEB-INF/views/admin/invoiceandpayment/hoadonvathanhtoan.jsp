<%@ page contentType="text/html;charset=UTF-8" language="java" %>
  <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


        <!DOCTYPE html>
        <html lang="vi">

        <head>
          <meta charset="UTF-8">
          <meta name="viewport" content="width=device-width, initial-scale=1.0">
          <title>Quản lý Hóa đơn & Thanh toán</title>
          <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
          <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
          <style>
            body {
              background-color: #f8f9fa;
              font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            }

            .main-header {
              background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
              color: white;
              padding: 2rem 0;
              margin-bottom: 2rem;
              border-radius: 0 0 15px 15px;
            }

            .stats-card {
              background: white;
              border-radius: 15px;
              padding: 1.5rem;
              box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
              border-left: 5px solid;
              margin-bottom: 1.5rem;
              transition: transform 0.3s ease, box-shadow 0.3s ease;
            }

            .stats-card:hover {
              transform: translateY(-5px);
              box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
            }

            .stats-card.total {
              border-left-color: #3498db;
            }

            .stats-card.paid {
              border-left-color: #27ae60;
            }

            .stats-card.pending {
              border-left-color: #f39c12;
            }

            .stats-card.overdue {
              border-left-color: #e74c3c;
            }

            .stats-icon {
              font-size: 2.5rem;
              opacity: 0.8;
            }

            .table-container {
              background: white;
              border-radius: 15px;
              padding: 1.5rem;
              box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
              margin-bottom: 2rem;
            }

            .table th {
              background-color: #f8f9fa;
              border: none;
              font-weight: 600;
              color: #495057;
              padding: 1rem 0.75rem;
            }

            .table td {
              padding: 1rem 0.75rem;
              vertical-align: middle;
              border-color: #e9ecef;
            }

            .status-badge {
              padding: 0.5rem 1rem;
              border-radius: 20px;
              font-size: 0.85rem;
              font-weight: 600;
              text-transform: uppercase;
              letter-spacing: 0.5px;
            }

            .status-paid {
              background-color: #d4edda;
              color: #155724;
            }

            .status-pending {
              background-color: #fff3cd;
              color: #856404;
            }

            .status-overdue {
              background-color: #f8d7da;
              color: #721c24;
            }

            .btn-action {
              padding: 0.4rem 0.8rem;
              border-radius: 8px;
              font-size: 0.875rem;
              margin: 0 0.2rem;
              transition: all 0.3s ease;
            }

            .btn-action:hover {
              transform: translateY(-2px);
            }

            .search-box {
              background: white;
              border-radius: 15px;
              padding: 1.5rem;
              box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
              margin-bottom: 2rem;
            }

            .form-control {
              border-radius: 10px;
              border: 2px solid #e9ecef;
              padding: 0.75rem 1rem;
              transition: border-color 0.3s ease;
            }

            .form-control:focus {
              border-color: #667eea;
              box-shadow: 0 0 0 0.2rem rgba(102, 126, 234, 0.25);
            }

            .modal-content {
              border-radius: 15px;
              border: none;
            }

            .modal-header {
              background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
              color: white;
              border-radius: 15px 15px 0 0;
            }

            .invoice-detail {
              background: #f8f9fa;
              border-radius: 10px;
              padding: 1rem;
              margin: 0.5rem 0;
            }

            .payment-method-card {
              border: 2px solid #e9ecef;
              border-radius: 10px;
              padding: 1rem;
              margin: 0.5rem 0;
              cursor: pointer;
              transition: all 0.3s ease;
            }

            .payment-method-card:hover,
            .payment-method-card.selected {
              border-color: #667eea;
              background-color: #f8f9ff;
            }

            .pagination {
              justify-content: center;
            }

            .page-link {
              border-radius: 8px;
              margin: 0 0.2rem;
              border: none;
              color: #667eea;
            }

            .page-link:hover {
              background-color: #667eea;
              color: white;
            }

            .page-item.active .page-link {
              background-color: #667eea;
              border-color: #667eea;
            }
          </style>
        </head>

        <body>
          <!-- Header -->
          <div class="main-header">
            <div>
              <a href="/" class="btn btn-outline-secondary me-2">
                <i class="bi bi-arrow-left"></i> Quay lại
              </a>
            </div>
            <div class="container">
              <div class="row align-items-center">
                <div class="col-md-8">
                  <h1 class="mb-0"><i class="fas fa-file-invoice-dollar me-3"></i>Quản lý Hóa đơn & Thanh toán</h1>
                  <p class="mb-0 mt-2 opacity-75">Quản lý tất cả hóa đơn và thanh toán của phòng khám</p>
                </div>
                <div class="col-md-4 text-end">
                  <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#invoiceModal">
                    Tạo hóa đơn
                  </button>
                </div>
              </div>
            </div>
          </div>

          <div class="container">
            <!-- Thống kê -->
            <div class="row">
              <div class="col-md-3">
                <div class="stats-card total">
                  <div class="d-flex justify-content-between align-items-center">
                    <div>
                      <h3 class="mb-0">${totalInvoices}</h3>
                      <p class="mb-0 text-muted">Tổng hóa đơn</p>
                    </div>
                    <i class="fas fa-file-invoice stats-icon text-primary"></i>
                  </div>
                </div>
              </div>
              <div class="col-md-3">
                <div class="stats-card paid">
                  <div class="d-flex justify-content-between align-items-center">
                    <div>
                      <h3 class="mb-0">${paidInvoices}</h3>
                      <p class="mb-0 text-muted">Đã thanh toán</p>
                    </div>
                    <i class="fas fa-check-circle stats-icon text-success"></i>
                  </div>
                </div>
              </div>
              <div class="col-md-3">
                <div class="stats-card pending">
                  <div class="d-flex justify-content-between align-items-center">
                    <div>
                      <h3 class="mb-0">${unpaidInvoices}</h3>
                      <p class="mb-0 text-muted">Chưa thanh toán</p>
                    </div>
                    <i class="fas fa-clock stats-icon text-warning"></i>
                  </div>
                </div>
              </div>
              <div class="col-md-3">
                <div class="stats-card total-paid-amount">
                  <div class="d-flex justify-content-between align-items-center">
                    <div>
                      <h3 class="mb-0">
                        <fmt:formatNumber value="${totalPaidAmount}" type="currency" currencySymbol="₫"
                          maxFractionDigits="0" />
                      </h3>
                      <p class="mb-0 text-muted">Tổng tiền đã thanh toán</p>
                    </div>
                    <i class="fas fa-dollar-sign stats-icon text-success"></i>
                  </div>
                </div>
              </div>

            </div>


            <!-- Tìm kiếm và lọc -->
            <form method="get" action="/invoices">
              <div class="search-box">
                <div class="row align-items-end">
                  <div class="col-md-3">
                    <label class="form-label">Tìm kiếm</label>
                    <input type="text" name="keyword" class="form-control" placeholder="Mã hóa đơn, tên bệnh nhân..."
                      value="${param.keyword}">
                  </div>

                  <!-- Tạm thời bạn có thể ẩn 3 trường bên dưới nếu chưa xử lý -->
                  <div class="col-md-2">
                    <label class="form-label">Trạng thái</label>
                    <select class="form-control" name="status">
                      <option value="">Tất cả</option>
                      <option value="Đã thanh toán" ${param.status=='Đã thanh toán' ? 'selected' : '' }>Đã thanh toán
                      </option>
                      <option value="Chưa thanh toán" ${param.status=='Chưa thanh toán' ? 'selected' : '' }>Chưa thanh
                        toán</option>
                    </select>
                  </div>
                  <div class="col-md-2">
                    <label class="form-label">Từ ngày</label>
                    <input type="date" class="form-control" name="startDate" value="${param.startDate}">
                  </div>
                  <div class="col-md-2">
                    <label class="form-label">Đến ngày</label>
                    <input type="date" class="form-control" name="endDate" value="${param.endDate}">
                  </div>


                  <div class="col-md-3">
                    <button type="submit" class="btn btn-primary me-2">
                      <i class="fas fa-search me-1"></i>Tìm kiếm
                    </button>
                    <a href="/invoices" class="btn btn-outline-secondary">
                      <i class="fas fa-redo me-1"></i>Làm mới
                    </a>
                  </div>
                </div>
              </div>
            </form>

            <!-- Bảng hóa đơn -->
            <div class="table-container">
              <div class="d-flex justify-content-between align-items-center mb-3">
                <h5 class="mb-0">Danh sách hóa đơn</h5>
                <div class="dropdown">
                  <button class="btn btn-outline-primary dropdown-toggle" type="button" data-bs-toggle="dropdown">
                    <i class="fas fa-download me-1"></i>Xuất báo cáo
                  </button>
                  <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="#"><i class="fas fa-file-excel me-2"></i>Excel</a></li>
                    <li><a class="dropdown-item" href="#"><i class="fas fa-file-pdf me-2"></i>PDF</a></li>
                  </ul>
                </div>
              </div>

              <div class="table-responsive">
                <table class="table table-hover">
                  <thead>
                    <tr>
                      <th>Mã hóa đơn</th>
                      <th>Bệnh nhân</th>
                      <th>Ngày tạo</th>
                      <th>Tổng tiền</th>
                      <th>Trạng thái</th>
                      <th>Phương thức TT</th>
                      <th>Thao tác</th>
                    </tr>
                  </thead>

                  <tbody>
                    <c:forEach var="invoice" items="${invoices}">
                      <tr>
                        <td><strong>${invoice.invoiceCode}</strong></td>
                        <td>${invoice.patient.fullName}</td>

                        <td class="text-primary">${invoice.createdDate}</td>

                        <td class="text-primary">${invoice.totalAmount}</td>


                        <td>
                          <c:choose>
                            <c:when test="${invoice.status == 'Đã thanh toán'}">
                              <span class="status-badge status-paid">Đã thanh toán</span>
                            </c:when>
                            <c:when test="${invoice.status == 'Chưa thanh toán'}">
                              <span class="status-badge status-pending">Chưa thanh toán</span>
                            </c:when>


                          </c:choose>
                        </td>

                        <td>
                          <c:choose>
                            <c:when test="${not empty invoice.paymentMethod}">
                              ${invoice.paymentMethod}
                            </c:when>
                            <c:otherwise>-</c:otherwise>
                          </c:choose>
                        </td>

                        <td>
                          <button class="btn btn-primary btn-action btn-sm view-invoice-btn"
                            data-invoice-id="${invoice.id}" data-bs-toggle="modal" data-bs-target="#viewInvoiceModal">
                            <i class="fas fa-eye"></i>
                          </button>


                          <button class="btn btn-info btn-action btn-sm" data-bs-toggle="modal"
                            data-bs-target="#paymentModal">
                            <i class="fas fa-credit-card"></i>
                          </button>
                          <button class="btn btn-warning btn-action btn-sm">
                            <i class="fas fa-edit"></i>
                          </button>
                        </td>
                      </tr>
                    </c:forEach>
                  </tbody>

                </table>
              </div>

              <!-- Phân trang -->
              <nav>
                <ul class="pagination">
                  <li class="page-item disabled">
                    <a class="page-link" href="#"><i class="fas fa-chevron-left"></i></a>
                  </li>
                  <li class="page-item active"><a class="page-link" href="#">1</a></li>
                  <li class="page-item"><a class="page-link" href="#">2</a></li>
                  <li class="page-item"><a class="page-link" href="#">3</a></li>
                  <li class="page-item"><a class="page-link" href="#">...</a></li>
                  <li class="page-item"><a class="page-link" href="#">10</a></li>
                  <li class="page-item">
                    <a class="page-link" href="#"><i class="fas fa-chevron-right"></i></a>
                  </li>
                </ul>
              </nav>
            </div>
          </div>



          <!-- Modal xem chi tiết hóa đơn -->
          <div class="modal fade" id="viewInvoiceModal" tabindex="-1">
            <div class="modal-dialog modal-lg">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title">
                    <i class="fas fa-file-invoice me-2"></i>Chi tiết hóa đơn <span id="modalInvoiceCode"></span>
                  </h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                  <div class="row">
                    <div class="col-md-6">
                      <div class="invoice-detail">
                        <h6>Thông tin bệnh nhân</h6>
                        <p class="mb-1"><strong>Họ tên:</strong> <span id="modalPatientName"></span></p>
                        <p class="mb-1"><strong>SĐT:</strong> <span id="modalPatientPhone"></span></p>
                        <p class="mb-0"><strong>Địa chỉ:</strong> <span id="modalPatientAddress"></span></p>
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="invoice-detail">
                        <h6>Thông tin hóa đơn</h6>
                        <p class="mb-1"><strong>Mã hóa đơn:</strong> <span id="modalInvoiceCode2"></span></p>
                        <p class="mb-1"><strong>Ngày tạo:</strong> <span id="modalCreatedDate"></span></p>
                        <p class="mb-0"><strong>Bác sĩ:</strong> <span id="modalDoctorName"></span></p>
                      </div>
                    </div>
                  </div>

                  <h6 class="mt-3 mb-3">Chi tiết dịch vụ</h6>
                  <div class="table-responsive">
                    <table class="table table-bordered" id="modalInvoiceItemsTable">
                      <thead>
                        <tr>
                          <th>Dịch vụ</th>
                          <th>Số lượng</th>
                          <th>Đơn giá</th>
                          <th>Thành tiền</th>
                        </tr>
                      </thead>
                      <tbody>
                        <!-- JS sẽ đổ dữ liệu vào đây -->
                      </tbody>
                      <tfoot>
                        <tr class="table-primary">
                          <th colspan="3">Tổng cộng</th>
                          <th><span id="modalTotalAmount"></span></th>
                        </tr>
                      </tfoot>
                    </table>
                  </div>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-success">
                    <i class="fas fa-print me-1"></i>In hóa đơn
                  </button>
                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                </div>
              </div>
            </div>
          </div>



          <!-- Modal thanh toán -->
          <div class="modal fade" id="paymentModal" tabindex="-1">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title"><i class="fas fa-credit-card me-2"></i>Thanh toán hóa đơn</h5>
                  <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                  <div class="invoice-detail mb-3">
                    <h6>Thông tin hóa đơn</h6>
                    <p class="mb-1"><strong>Mã:</strong> HD002</p>
                    <p class="mb-1"><strong>Bệnh nhân:</strong> Trần Thị Bình</p>
                    <p class="mb-0"><strong>Tổng tiền:</strong> <span class="text-danger">1,200,000 đ</span></p>
                  </div>

                  <h6>Chọn phương thức thanh toán</h6>
                  <div class="payment-method-card" onclick="selectPaymentMethod(this)">
                    <div class="d-flex align-items-center">
                      <i class="fas fa-money-bill-wave text-success me-3"></i>
                      <div>
                        <strong>Tiền mặt</strong>
                        <p class="mb-0 text-muted">Thanh toán bằng tiền mặt</p>
                      </div>
                    </div>
                  </div>

                  <div class="payment-method-card" onclick="selectPaymentMethod(this)">
                    <div class="d-flex align-items-center">
                      <i class="fas fa-university text-primary me-3"></i>
                      <div>
                        <strong>Chuyển khoản</strong>
                        <p class="mb-0 text-muted">Chuyển khoản ngân hàng</p>
                      </div>
                    </div>
                  </div>

                  <div class="payment-method-card" onclick="selectPaymentMethod(this)">
                    <div class="d-flex align-items-center">
                      <i class="fas fa-credit-card text-warning me-3"></i>
                      <div>
                        <strong>Thẻ tín dụng</strong>
                        <p class="mb-0 text-muted">Thanh toán qua thẻ</p>
                      </div>
                    </div>
                  </div>

                  <div class="mt-3">
                    <label class="form-label">Ghi chú</label>
                    <textarea class="form-control" rows="3" placeholder="Ghi chú về thanh toán..."></textarea>
                  </div>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-success">
                    <i class="fas fa-check me-1"></i>Xác nhận thanh toán
                  </button>
                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                </div>
              </div>
            </div>
          </div>



          <!-- Modal -->
          <div class="modal fade" id="invoiceModal" tabindex="-1" aria-labelledby="invoiceModalLabel"
            aria-hidden="true">
            <div class="modal-dialog modal-xl">
              <div class="modal-content">
                <form:form method="post" modelAttribute="invoice" action="/invoices/create">
                  <div class="modal-header">
                    <h5 class="modal-title" id="invoiceModalLabel">Tạo Hóa Đơn</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Đóng"></button>
                  </div>
                  <div class="modal-body">
                    <div class="row mb-3">
                      <div class="col-md-6">
                        <form:label path="invoiceCode">Mã hóa đơn</form:label>
                        <form:input path="invoiceCode" cssClass="form-control" />
                      </div>
                      <div class="col-md-6">
                        <form:label path="createdDate">Ngày tạo</form:label>
                        <form:input path="createdDate" type="date" cssClass="form-control" />
                      </div>
                    </div>

                    <div class="row mb-3">
                      <div class="col-md-6">
                        <form:label path="patient.id">Bệnh nhân</form:label>
                        <form:select path="patient.id" cssClass="form-select">
                          <form:options items="${patients}" itemValue="id" itemLabel="fullName" />
                        </form:select>
                      </div>
                      <div class="col-md-6">
                        <form:label path="doctor.id">Bác sĩ</form:label>
                        <form:select path="doctor.id" cssClass="form-select">
                          <form:options items="${doctors}" itemValue="id" itemLabel="name" />
                        </form:select>
                      </div>
                    </div>

                    <div class="row mb-3">
                      <div class="col-md-6">
                        <form:label path="status">Trạng thái</form:label>
                        <form:select path="status" cssClass="form-select">
                          <form:option value="Chưa thanh toán" label="Chưa thanh toán" />
                          <form:option value="Đã thanh toán" label="Đã thanh toán" />
                        </form:select>
                      </div>
                      <div class="col-md-6">
                        <form:label path="paymentMethod">Phương thức thanh toán</form:label>
                        <form:select path="paymentMethod" cssClass="form-select">
                          <form:option value="Tiền mặt" label="Tiền mặt" />
                          <form:option value="Chuyển khoản" label="Chuyển khoản" />
                        </form:select>
                      </div>
                    </div>

                    <div class="mb-3">
                      <form:label path="note">Ghi chú</form:label>
                      <form:textarea path="note" cssClass="form-control" rows="3" />
                    </div>

                    <!-- Danh sách dịch vụ có thể chọn -->
                    <div class="mb-3">
                      <h3>Danh sách dịch vụ</h3>
                      <table class="table table-bordered">
                        <thead>
                          <tr>
                            <th width="50">Chọn</th>
                            <th>Tên dịch vụ</th>
                            <th>Mô tả</th>
                            <th>Giá tiền (VNĐ)</th>
                            <th width="100">Số lượng</th>
                            <th>Thành tiền</th>
                          </tr>
                        </thead>
                        <tbody>
                          <c:forEach var="service" items="${services}" varStatus="status">
                            <tr class="service-row">
                              <td>
                                <input type="checkbox" class="form-check-input service-checkbox" name="selectedServices"
                                  value="${service.id}" data-price="${service.cost}" onchange="updateTotal()">
                              </td>
                              <td>${service.name}</td>
                              <td>${service.description}</td>
                              <td class="service-price">${service.cost}</td>
                              <td>
                                <input type="number" name="quantities" class="form-control quantity-input" min="1"
                                  value="1" disabled onchange="updateTotal()">

                              </td>
                              <td class="subtotal">0</td>
                            </tr>
                          </c:forEach>
                        </tbody>
                        <tfoot>
                          <tr class="table-primary">
                            <td colspan="5"><strong>Tổng cộng:</strong></td>
                            <td><strong><span id="totalAmount">0</span> VNĐ</strong></td>
                          </tr>
                        </tfoot>
                      </table>
                    </div>

                    <!-- Hidden field để lưu tổng tiền -->
                    <input type="hidden" name="totalAmount" id="totalAmountInput" value="0">
                  </div>

                  <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">Lưu hóa đơn</button>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                  </div>
                </form:form>
              </div>
            </div>
          </div>


          <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

          <script>

            function updateTotal() {
              let total = 0;
              const checkboxes = document.querySelectorAll('.service-checkbox');

              checkboxes.forEach(function (checkbox) {
                const row = checkbox.closest('tr');
                const quantityInput = row.querySelector('.quantity-input');
                const subtotalCell = row.querySelector('.subtotal');
                const price = parseFloat(checkbox.dataset.price);

                if (checkbox.checked) {
                  // Kích hoạt input số lượng
                  quantityInput.disabled = false;
                  quantityInput.style.backgroundColor = 'white';

                  // Tính thành tiền cho dịch vụ này
                  const quantity = parseInt(quantityInput.value) || 1;
                  const subtotal = price * quantity;
                  subtotalCell.textContent = subtotal.toLocaleString() + ' VNĐ';

                  // Cộng vào tổng
                  total += subtotal;

                  // Đổi màu nền dòng được chọn
                  row.style.backgroundColor = '#e3f2fd';
                } else {
                  // Vô hiệu hóa input số lượng
                  quantityInput.disabled = true;
                  quantityInput.style.backgroundColor = '#e9ecef';
                  quantityInput.value = 1;
                  subtotalCell.textContent = '0 VNĐ';

                  // Trả về màu nền bình thường
                  row.style.backgroundColor = '';
                }
              });

              // Cập nhật tổng tiền
              document.getElementById('totalAmount').textContent = total.toLocaleString();
              document.getElementById('totalAmountInput').value = total;
            }

            $(document).ready(function () {
              $('.view-invoice-btn').click(function () {
                var invoiceId = $(this).data('invoice-id');
                $.ajax({
                  url: '/invoices/detail/' + invoiceId,
                  type: 'GET',
                  success: function (invoice) {
                    // Đổ dữ liệu vào modal
                    $('#modalInvoiceCode').text(invoice.invoiceCode);
                    $('#modalInvoiceCode2').text(invoice.invoiceCode);
                    $('#modalPatientName').text(invoice.patientName);
                    $('#modalPatientPhone').text(invoice.patientPhone);
                    $('#modalPatientAddress').text(invoice.patientAddress);
                    $('#modalCreatedDate').text(invoice.createdDate);

                    // Sửa tại đây: lấy trực tiếp doctorName từ JSON
                    $('#modalDoctorName').text(invoice.doctorName || '');

                    // Xử lý chi tiết dịch vụ
                    var tbody = $('#modalInvoiceItemsTable tbody');
                    tbody.empty();
                    var totalAmount = 0;
                    invoice.items.forEach(function (item) {
                      var row = '<tr>' +
                        '<td>' + item.serviceName + '</td>' + // Sửa nếu dùng DTO: dùng serviceName
                        '<td>' + item.quantity + '</td>' +
                        '<td>' + item.unitPrice + '</td>' +
                        '<td>' + item.totalPrice + '</td>' +
                        '</tr>';
                      tbody.append(row);
                      totalAmount += item.totalPrice;
                    });
                    $('#modalTotalAmount').text(totalAmount);
                  },
                  error: function () {
                    alert('Không thể tải chi tiết hóa đơn!');
                  }
                });
              });
            });



            // Khởi tạo khi trang load
            document.addEventListener('DOMContentLoaded', function () {
              updateTotal();
            });
          </script>
          <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>

        </body>

        </html>