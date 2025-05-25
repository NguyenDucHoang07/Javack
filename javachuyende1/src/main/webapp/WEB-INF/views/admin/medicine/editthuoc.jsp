<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!DOCTYPE html>
        <html lang="vi">

        <head>
            <meta charset="UTF-8">
            <title>Sửa thuốc</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
            <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet" />
        </head>

        <body class="bg-light">
            <div class="container py-4">
                <h3><i class="fas fa-edit"></i> Sửa thông tin thuốc</h3>
                <form action="${pageContext.request.contextPath}/quanlythuoc/updatethuoc" method="post" class="mt-4">
                    <input type="hidden" name="id" value="${medicine.id}" />
                    <div class="row">
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label">Tên thuốc *</label>
                                <input type="text" class="form-control" name="name" required value="${medicine.name}" />
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Hoạt chất *</label>
                                <input type="text" class="form-control" name="activeIngredient" required
                                    value="${medicine.activeIngredient}" />
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Hàm lượng *</label>
                                <input type="text" class="form-control" name="dosage" required
                                    value="${medicine.dosage}" />
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Đơn vị *</label>
                                <select class="form-select" name="unit" required>
                                    <option value="">Chọn đơn vị</option>
                                    <option value="Viên" ${medicine.unit=='Viên' ? 'selected' : '' }>Viên</option>
                                    <option value="Ống" ${medicine.unit=='Ống' ? 'selected' : '' }>Ống</option>
                                    <option value="Chai" ${medicine.unit=='Chai' ? 'selected' : '' }>Chai</option>
                                    <option value="Hộp" ${medicine.unit=='Hộp' ? 'selected' : '' }>Hộp</option>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Số lượng *</label>
                                <input type="number" class="form-control" name="quantity" required
                                    value="${medicine.quantity}" />
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label class="form-label">Hạn sử dụng *</label>
                                <input type="date" class="form-control" name="expiryDate" required
                                    value="${medicine.expiryDate}" />
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Nhà sản xuất *</label>
                                <select class="form-select" name="manufacturer.id" required>
                                    <option value="">Chọn nhà sản xuất</option>
                                    <c:forEach var="m" items="${manufacturers}">
                                        <option value="${m.id}" ${m.id==medicine.manufacturer.id ? 'selected' : '' }>
                                            ${m.name}</option>
                                    </c:forEach>

                                </select>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Giá nhập *</label>
                                <input type="number" step="0.01" class="form-control" name="purchasePrice" required
                                    value="${medicine.purchasePrice}" />
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Giá bán *</label>
                                <input type="number" step="0.01" class="form-control" name="salePrice" required
                                    value="${medicine.salePrice}" />
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Ghi chú</label>
                                <textarea class="form-control" name="note" rows="3">${medicine.note}</textarea>
                            </div>
                        </div>
                    </div>

                    <div class="mt-3">
                        <button type="submit" class="btn btn-primary"><i class="fas fa-save"></i> Cập nhật</button>
                        <a href="${pageContext.request.contextPath}/quanlythuoc" class="btn btn-secondary">Hủy</a>
                    </div>
                </form>
            </div>

            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        </body>

        </html>