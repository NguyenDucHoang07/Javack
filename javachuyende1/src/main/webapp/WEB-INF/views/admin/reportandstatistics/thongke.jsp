<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8" />
    <title>Báo cáo & Thống kê</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
<div class="container mt-4">
    <h2 class="mb-4"><i class="fas fa-chart-bar"></i> Báo cáo & Thống kê</h2>

    <!-- Bộ lọc khoảng thời gian -->
    <form class="row g-3 mb-4">
        <div class="col-md-4">
            <label for="fromDate" class="form-label">Từ ngày</label>
            <input type="date" class="form-control" id="fromDate" name="fromDate" />
        </div>
        <div class="col-md-4">
            <label for="toDate" class="form-label">Đến ngày</label>
            <input type="date" class="form-control" id="toDate" name="toDate" />
        </div>
        <div class="col-md-4 align-self-end">
            <button type="submit" class="btn btn-primary w-100">Xem báo cáo</button>
        </div>
    </form>

    <!-- Tổng quan số liệu -->
    <div class="row mb-4">
        <div class="col-md-4">
            <div class="card text-white bg-primary mb-3">
                <div class="card-header">Tổng doanh thu</div>
                <div class="card-body">
                    <h4 class="card-title">5,000,000 VNĐ</h4>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card text-white bg-success mb-3">
                <div class="card-header">Số đơn hàng</div>
                <div class="card-body">
                    <h4 class="card-title">120 đơn</h4>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card text-white bg-warning mb-3">
                <div class="card-header">Khách hàng mới</div>
                <div class="card-body">
                    <h4 class="card-title">35 người</h4>
                </div>
            </div>
        </div>
    </div>

    <!-- Biểu đồ doanh thu theo tháng -->
    <div class="card">
        <div class="card-header">
            Doanh thu theo tháng (VNĐ)
        </div>
        <div class="card-body">
            <canvas id="revenueChart" height="100"></canvas>
        </div>
    </div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/js/all.min.js"></script>
<script>
    const ctx = document.getElementById('revenueChart').getContext('2d');
    const revenueChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: ['Tháng 1', 'Tháng 2', 'Tháng 3', 'Tháng 4', 'Tháng 5', 'Tháng 6'],
            datasets: [{
                label: 'Doanh thu',
                data: [1200000, 1500000, 1000000, 1800000, 1300000, 1600000],
                backgroundColor: 'rgba(54, 162, 235, 0.7)',
                borderColor: 'rgba(54, 162, 235, 1)',
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true,
                    ticks: {
                        callback: function(value) {
                            return value.toLocaleString() + ' VNĐ';
                        }
                    }
                }
            }
        }
    });
</script>
</body>
</html>
