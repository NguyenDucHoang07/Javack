<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

        <html>

        <head>
            <title>Sửa Nhà sản xuất</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        </head>

        <body>
            <div class="container mt-5">
                <h4><i class="fas fa-edit"></i> Sửa Nhà sản xuất</h4>
                <form:form action="${pageContext.request.contextPath}/quanlynhasanxuat/updatenhasanxuat"
                    modelAttribute="manufacturer" method="post">
                    <form:hidden path="id" />

                    <div class="mb-3">
                        <label class="form-label">Mã nhà sản xuất</label>
                        <form:input path="code" cssClass="form-control" />
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Tên nhà sản xuất *</label>
                        <form:input path="name" cssClass="form-control" required="true" />
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Địa chỉ</label>
                        <form:input path="address" cssClass="form-control" />
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Số điện thoại</label>
                        <form:input path="phone" cssClass="form-control" />
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Email</label>
                        <form:input path="email" cssClass="form-control" />
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Ghi chú</label>
                        <form:textarea path="note" cssClass="form-control" rows="3" />
                    </div>

                    <button type="submit" class="btn btn-success">Lưu thay đổi</button>
                    <a href="${pageContext.request.contextPath}/quanlynhasanxuat" class="btn btn-secondary">Quay lại</a>
                </form:form>
            </div>
        </body>

        </html>