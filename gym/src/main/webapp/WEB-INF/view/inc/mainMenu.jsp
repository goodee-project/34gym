<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>
    <!-- Header Section Begin -->
    <header class="header-section">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-3">
                    <div class="logo">
                        <a href="${pageContext.request.contextPath}/">
                            <img src="img/logo.png" alt="">
                        </a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <nav class="nav-menu">
                        <ul>
                            <li class="active"><a href="${pageContext.request.contextPath}/">Home</a></li>
                            <li><a href="${pageContext.request.contextPath}/">About Us</a></li>
                            <li><a href="${pageContext.request.contextPath}/">Classes</a></li>
                            <li><a href="${pageContext.request.contextPath}/">Services</a></li>
                            <li><a href="${pageContext.request.contextPath}/">Our Team</a></li>
                            <li><a href="#">Pages</a>
                                <ul class="dropdown">
                                    <li><a href="${pageContext.request.contextPath}/">About us</a></li>
                                    <li><a href="${pageContext.request.contextPath}/">Classes timetable</a></li>
                                    <li><a href="${pageContext.request.contextPath}/">Bmi calculate</a></li>
                                    <li><a href="${pageContext.request.contextPath}/">Our team</a></li>
                                    <li><a href="${pageContext.request.contextPath}/">Gallery</a></li>
                                    <li><a href="${pageContext.request.contextPath}/">Our blog</a></li>
                                    <li><a href="${pageContext.request.contextPath}/">404</a></li>
                                </ul>
                            </li>
                            <li><a href="${pageContext.request.contextPath}/">Contact</a></li>
                        </ul>
                    </nav>
                </div>
                <div class="col-lg-3">
                    <div class="top-option">
                        <div class="to-social">
							<a href="${pageContext.request.contextPath}/login">Login</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="canvas-open">
                <i class="fa fa-bars"></i>
            </div>
        </div>
    </header>
    <!-- Header End -->
</body>
</html>