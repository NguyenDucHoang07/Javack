<%@ page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <c:set var="currentPage" value="${pageContext.request.requestURI}" />

        <div class="col-md-2 sidebar p-0">
            <div class="d-flex flex-column p-3">
                <h4 class="text-center mb-4">Quản lý Y tế</h4>
                <ul class="nav nav-pills flex-column mb-auto">
                    <li class="nav-item">
                        <a href="index.jsp" class="nav-link">
                            <i class="bi bi-house-door me-2"></i>Trang chủ
                        </a>
                    </li>
                    <li>
                        <a href="/quanlythuoc" class="nav-link active">
                            <i class="bi bi-capsule me-2"></i>Quản lý Thuốc
                        </a>
                    </li>
                    <li>
                        <a href="/quanlyvattu" class="nav-link">
                            <i class="bi bi-bandaid me-2"></i>Quản lý Vật tư
                        </a>
                    </li>

                    <li>
                        <a href="/nhacungcap" class="nav-link">
                            <i class="bi bi-truck me-2"></i>Nhà sản xuất
                        </a>
                    </li>

                </ul>
            </div>
        </div>