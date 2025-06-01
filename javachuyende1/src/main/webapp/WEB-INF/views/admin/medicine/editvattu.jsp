<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!DOCTYPE html>
        <html lang="vi">

        <head>
            <meta charset="UTF-8">
            <title>Sửa vật tư</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        </head>

        <body>
            <div class="container mt-4">
                <h4 class="mb-3">Sửa vật tư y tế</h4>
                <form action="${pageContext.request.contextPath}/quanlyvattu/update" method="post">
                    <input type="hidden" name="id" value="${supply.id}">

                    <div class="row">
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label">Mã vật tư</label>
                                <input type="text" class="form-control" name="code" value="${supply.code}" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Tên vật tư</label>
                                <input type="text" class="form-control" name="name" value="${supply.name}" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Loại vật tư</label>
                                <select class="form-control" name="type" required>
                                    <option value="Dụng cụ" ${supply.type=='Dụng cụ' ? 'selected' : '' }>Dụng cụ
                                    </option>
                                    <option value="Trang thiết bị" ${supply.type=='Trang thiết bị' ? 'selected' : '' }>
                                        Trang thiết bị</option>
                                    <option value="Vật liệu tiêu hao" ${supply.type=='Vật liệu tiêu hao' ? 'selected'
                                        : '' }>Vật liệu tiêu hao</option>
                                    <option value="Khác" ${supply.type=='Khác' ? 'selected' : '' }>Khác</option>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Số lượng</label>
                                <input type="number" class="form-control" name="quantity" value="${supply.quantity}"
                                    required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Đơn vị</label>
                                <select class="form-control" name="unit" required>
                                    <option value="Cái" ${supply.unit=='Cái' ? 'selected' : '' }>Cái</option>
                                    <option value="Hộp" ${supply.unit=='Hộp' ? 'selected' : '' }>Hộp</option>
                                    <option value="Bộ" ${supply.unit=='Bộ' ? 'selected' : '' }>Bộ</option>
                                    <option value="Tuýp" ${supply.unit=='Tuýp' ? 'selected' : '' }>Tuýp</option>
                                    <option value="Chai" ${supply.unit=='Chai' ? 'selected' : '' }>Chai</option>
                                    <option value="Lọ" ${supply.unit=='Lọ' ? 'selected' : '' }>Lọ</option>
                                    <option value="Viên" ${supply.unit=='Viên' ? 'selected' : '' }>Viên</option>
                                    <option value="Khác" ${supply.unit=='Khác' ? 'selected' : '' }>Khác</option>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Hạn sử dụng</label>
                                <input type="date" class="form-control" name="expiryDate" value="${supply.expiryDate}">
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label">Nhà cung cấp</label>
                                <select class="form-select" name="manufacturer.id" required>
                                    <c:forEach var="m" items="${manufacturers}">
                                        <option value="${m.id}" ${supply.manufacturer.id==m.id ? 'selected' : '' }>
                                            ${m.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Giá nhập</label>
                                <input type="number" step="0.01" class="form-control" name="purchasePrice"
                                    value="${supply.purchasePrice}" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Giá bán</label>
                                <input type="number" step="0.01" class="form-control" name="sellingPrice"
                                    value="${supply.sellingPrice}" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Ngày nhập</label>
                                <input type="date" class="form-control" name="entryDate" value="${supply.entryDate}"
                                    required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Ghi chú</label>
                                <textarea class="form-control" name="note" rows="2">${supply.note}</textarea>
                            </div>
                        </div>
                    </div>

                    <button type="submit" class="btn btn-primary">Cập nhật</button>
                    <a href="${pageContext.request.contextPath}/quanlyvattu" class="btn btn-secondary">Quay lại</a>
                </form>
            </div>
        </body>

        </html>