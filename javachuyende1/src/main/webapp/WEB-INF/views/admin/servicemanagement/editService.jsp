<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
        <!DOCTYPE html>
        <html lang="vi">

        <head>
            <meta charset="UTF-8">
            <title>Sửa Dịch vụ Khám</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        </head>

        <body>
            <div class="container mt-5">
                <h2 class="mb-4">Sửa Dịch vụ Khám</h2>

                <form:form action="${pageContext.request.contextPath}/quanlydichvu/update" method="post"
                    modelAttribute="services">
                    <form:hidden path="id" />

                    <div class="mb-3">
                        <label class="form-label">Tên Dịch vụ</label>
                        <form:input path="name" class="form-control" />
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Mô tả</label>
                        <form:textarea path="description" class="form-control" rows="3" />
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Chi phí (VNĐ)</label>
                        <form:input path="cost" class="form-control" type="number" min="0" />
                    </div>

                    <button type="submit" class="btn btn-success">Lưu thay đổi</button>
                    <a href="${pageContext.request.contextPath}/quanlydichvu" class="btn btn-secondary">Quay lại</a>
                </form:form>
            </div>

            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        </body>

        </html>