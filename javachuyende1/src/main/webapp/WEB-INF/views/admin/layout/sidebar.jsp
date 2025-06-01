<%@ page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <div id="layoutSidenav_nav">
            <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                <div class="sb-sidenav-menu">
                    <div class="nav">
                        <div class="sb-sidenav-menu-heading">QUẢN LÝ CHÍNH</div>

                        <a class="nav-link" href="/users">
                            <div class="sb-nav-link-icon"><i class="fas fa-users"></i></div>
                            Quản lý Người dùng
                        </a>

                        <a class="nav-link" href="/patients">
                            <div class="sb-nav-link-icon"><i class="fas fa-procedures"></i></div>
                            Quản lý Bệnh nhân
                        </a>

                        <a class="nav-link" href="/appointments">
                            <div class="sb-nav-link-icon"><i class="fas fa-calendar-check"></i></div>
                            Quản lý Lịch khám
                        </a>

                        <!-- Menu có xổ xuống -->
                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                            data-bs-target="#collapseMedicine" aria-expanded="false" aria-controls="collapseMedicine">
                            <div class="sb-nav-link-icon"><i class="fas fa-pills"></i></div>
                            Quản lý Thuốc & Vật tư
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="collapseMedicine" aria-labelledby="headingOne"
                            data-bs-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link" href="/quanlythuoc">Quản lý Thuốc</a>
                                <a class="nav-link" href="/quanlyvattu">Quản lý Vật tư</a>
                                <a class="nav-link" href="/quanlynhasanxuat">Quản lý Nhà sản xuất</a>
                                <a class="nav-link" href="/baocaothuoc">Báo cáo</a>
                            </nav>
                        </div>

                        <a class="nav-link" href="/quanlydichvu">
                            <div class="sb-nav-link-icon"><i class="fas fa-file-invoice-dollar"></i></div>
                            Quản lý dịch vụ
                        </a>

                        <a class="nav-link" href="/invoices">
                            <div class="sb-nav-link-icon"><i class="fas fa-file-invoice-dollar"></i></div>
                            Quản lý Hóa đơn & Thanh toán
                        </a>

                        <a class="nav-link" href="/quanlythongke">
                            <div class="sb-nav-link-icon"><i class="fas fa-chart-bar"></i></div>
                            Báo cáo & Thống kê
                        </a>
                    </div>
                </div>
            </nav>
        </div>