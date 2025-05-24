<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Hệ thống quản lý y tế cho nhân viên</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
  <style>
    * {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
    }

    body {
      font-family: 'Inter', sans-serif;
      background-color: #f8fbfd;
      color: #333;
    }

    header {
      background: #007b8a;
      color: white;
      padding: 20px 40px;
      display: flex;
      justify-content: space-between;
      align-items: center;
      box-shadow: 0 2px 8px rgba(0,0,0,0.1);
    }

    .logo {
      font-size: 1.8rem;
      font-weight: 700;
    }

    nav ul {
      list-style: none;
      display: flex;
      gap: 30px;
    }

    nav ul li a {
      color: white;
      text-decoration: none;
      font-weight: 500;
      transition: 0.3s;
    }

    nav ul li a:hover {
      text-decoration: underline;
      color: #cdeef2;
    }

    .hero {
      display: flex;
      flex-wrap: wrap;
      justify-content: space-between;
      align-items: center;
      padding: 60px 40px;
      background-color: white;
      gap: 40px;
    }

    .hero-text {
      flex: 1;
      min-width: 300px;
    }

    .hero-text h1 {
      font-size: 42px;
      margin-bottom: 20px;
      font-weight: 700;
      color: #007b8a;
    }

    .hero-text p {
      font-size: 18px;
      color: #555;
      line-height: 1.6;
    }

    .hero-text a button {
      margin-top: 30px;
      padding: 14px 28px;
      font-size: 16px;
      background-color: #007b8a;
      color: white;
      border: none;
      border-radius: 8px;
      cursor: pointer;
      transition: 0.3s;
      box-shadow: 0 4px 12px rgba(0,0,0,0.15);
    }

    .hero-text a button:hover {
      background-color: #005f6b;
    }

    .hero-banner {
      flex: 1;
      text-align: center;
      min-width: 300px;
    }

    .hero-banner img {
      max-width: 100%;
      height: auto;
      border-radius: 12px;
      box-shadow: 0 6px 16px rgba(0, 0, 0, 0.1);
    }

    footer {
      background-color: #003f45;
      color: white;
      text-align: center;
      padding: 20px;
      font-size: 15px;
      margin-top: 60px;
    }

    @media (max-width: 768px) {
      .hero {
        flex-direction: column;
        padding: 40px 20px;
      }

      .hero-text h1 {
        font-size: 32px;
      }

      .hero-text p {
        font-size: 16px;
      }
    }
  </style>
</head>
<body>

  <header>
    <div class="logo">Hệ thống Y tế</div>
    <nav>
      <ul>
        <li><a href="#">Trang chủ</a></li>
        <li><a href="#">Giới thiệu</a></li>
        <li><a href="#">Liên hệ</a></li>
      </ul>
    </nav>
  </header>

  <section class="hero">
    <div class="hero-text">
      <h1>Hệ thống Quản lý Bệnh nhân</h1>
      <p>Trang thông tin dành cho cán bộ y tế, hỗ trợ quản lý hồ sơ bệnh nhân, bác sĩ, lịch hẹn và các dữ liệu y tế một cách hiệu quả, an toàn và hiện đại.</p>
      <a href="${pageContext.request.contextPath}/admin/login"><button>Vào hệ thống quản trị</button></a>
    </div>
    <div class="hero-banner">
      <img src="https://www.vinmec.com/static/uploads/wepik_export_20230610051550k_Azj_1_1_de0e3052ea.png" alt="Hình bác sĩ">
    </div>
  </section>

  <footer>
    © 2025 - Hệ thống Quản lý Y tế | Phát triển bởi 3 Con Cừu Team
  </footer>

</body>
</html>
