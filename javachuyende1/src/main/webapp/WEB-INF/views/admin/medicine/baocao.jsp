<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html lang="vi">

    <head>
        <meta charset="UTF-8" />
        <title>Báo cáo chi tiết - Quản lý Thuốc, Vật tư y tế & Nhà sản xuất</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet" />
        <style>
            .table thead th {
                vertical-align: middle;
                text-align: center;
            }

            .table tbody td {
                vertical-align: middle;
            }

            .badge-low {
                background-color: #ffc107;
                color: #212529;
            }

            .badge-expired {
                background-color: #dc3545;
            }
        </style>
    </head>

    <body>
        <div class="container mt-4">
            <h2 class="mb-4"><i class="fas fa-chart-bar"></i> Báo cáo chi tiết</h2>

            <!-- Thống kê tổng quan -->
            <div class="row mb-5">
                <div class="col-md-4">
                    <div class="card border-primary shadow-sm">
                        <div class="card-header bg-primary text-white">
                            <i class="fas fa-pills"></i> Thuốc tổng
                        </div>
                        <div class="card-body text-center">
                            <h3>120</h3>
                            <p>Tổng số loại thuốc</p>
                            <p><span class="badge bg-warning">15 sắp hết hàng</span></p>
                            <p><span class="badge badge-expired">6 gần hết hạn</span></p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card border-success shadow-sm">
                        <div class="card-header bg-success text-white">
                            <i class="fas fa-boxes"></i> Vật tư y tế tổng
                        </div>
                        <div class="card-body text-center">
                            <h3>85</h3>
                            <p>Tổng số loại vật tư</p>
                            <p><span class="badge bg-warning">8 sắp hết</span></p>
                            <p><span class="badge badge-expired">3 đã hết hạn</span></p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card border-secondary shadow-sm">
                        <div class="card-header bg-secondary text-white">
                            <i class="fas fa-industry"></i> Nhà sản xuất
                        </div>
                        <div class="card-body text-center">
                            <h3>20</h3>
                            <p>Tổng số nhà sản xuất</p>
                            <p><i class="fas fa-flag-usa"></i> Quốc tế: 8</p>
                            <p><i class="fas fa-flag"></i> Nội địa: 12</p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Thuốc gần hết hạn và hết hàng -->
            <div class="card mb-5">
                <div class="card-header bg-primary text-white">
                    <i class="fas fa-pills"></i> Thuốc gần hết hạn và hết hàng
                </div>
                <div class="card-body table-responsive">
                    <table class="table table-bordered table-striped align-middle text-center">
                        <thead class="table-light">
                            <tr>
                                <th>Mã thuốc</th>
                                <th>Tên thuốc</th>
                                <th>Hoạt chất</th>
                                <th>Tồn kho</th>
                                <th>Hạn sử dụng</th>
                                <th>Trạng thái</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>MED002</td>
                                <td>Amoxicillin</td>
                                <td>Amoxicillin</td>
                                <td>10</td>
                                <td>01/08/2025</td>
                                <td><span class="badge badge-low">Sắp hết</span></td>
                            </tr>
                            <tr>
                                <td>MED010</td>
                                <td>Ibuprofen</td>
                                <td>Ibuprofen</td>
                                <td>0</td>
                                <td>30/06/2025</td>
                                <td><span class="badge badge-expired">Hết hàng</span></td>
                            </tr>
                            <tr>
                                <td>MED015</td>
                                <td>Vitamin C</td>
                                <td>Ascorbic Acid</td>
                                <td>3</td>
                                <td>15/09/2025</td>
                                <td><span class="badge badge-low">Sắp hết</span></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- Vật tư gần hết và hết hạn -->
            <div class="card mb-5">
                <div class="card-header bg-success text-white">
                    <i class="fas fa-boxes"></i> Vật tư y tế gần hết và hết hạn
                </div>
                <div class="card-body table-responsive">
                    <table class="table table-bordered table-striped align-middle text-center">
                        <thead class="table-light">
                            <tr>
                                <th>Mã vật tư</th>
                                <th>Tên vật tư</th>
                                <th>Loại</th>
                                <th>Tồn kho</th>
                                <th>Hạn sử dụng</th>
                                <th>Trạng thái</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>MAT005</td>
                                <td>Bông băng</td>
                                <td>Tiêu hao</td>
                                <td>5</td>
                                <td>10/07/2025</td>
                                <td><span class="badge badge-low">Sắp hết</span></td>
                            </tr>
                            <tr>
                                <td>MAT010</td>
                                <td>Khẩu trang</td>
                                <td>Dụng cụ</td>
                                <td>0</td>
                                <td>05/05/2024</td>
                                <td><span class="badge badge-expired">Hết hạn</span></td>
                            </tr>
                            <tr>
                                <td>MAT015</td>
                                <td>Kim tiêm</td>
                                <td>Thiết bị</td>
                                <td>2</td>
                                <td>20/08/2025</td>
                                <td><span class="badge badge-low">Sắp hết</span></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- Nhà sản xuất chi tiết -->
            <div class="card mb-5">
                <div class="card-header bg-secondary text-white">
                    <i class="fas fa-industry"></i> Danh sách Nhà sản xuất
                </div>
                <div class="card-body table-responsive">
                    <table class="table table-bordered table-striped align-middle text-center">
                        <thead class="table-light">
                            <tr>
                                <th>Mã NSX</th>
                                <th>Tên nhà sản xuất</th>
                                <th>Quốc gia</th>
                                <th>Loại</th>
                                <th>Số sản phẩm cung cấp</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>NSX001</td>
                                <td>Công ty ABC</td>
                                <td>Việt Nam</td>
                                <td>Nội địa</td>
                                <td>25</td>
                            </tr>
                            <tr>
                                <td>NSX002</td>
                                <td>Pharma Corp</td>
                                <td>Mỹ</td>
                                <td>Quốc tế</td>
                                <td>15</td>
                            </tr>
                            <tr>
                                <td>NSX003</td>
                                <td>MedSupply Ltd.</td>
                                <td>Hàn Quốc</td>
                                <td>Quốc tế</td>
                                <td>10</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>

    </html>