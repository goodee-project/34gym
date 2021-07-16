<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<body>	
	<!-- Header Section Begin -->
    <header class="header-section">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-3">
                    <div class="logo">
                        <a href="${pageContext.request.contextPath}">
                            <img src="${pageContext.request.contextPath}/img/logo.png" alt="">
                        </a>
                    </div>
                </div>
				<div class="col-lg-6">
					<nav class="nav-menu">
						<ul>
							<li><a href="${pageContext.request.contextPath}">HOME</a></li>
							<li><a href="${pageContext.request.contextPath}/admin/getAdminList">ADMIN</a></li>
							<li><a href="#">BRANCH</a>
								<ul class="dropdown">
									<li><a href="${pageContext.request.contextPath}/admin/getContractList">지점 계약조건 관리</a></li>
									<li><a href="#">지점 신청 관리</a></li>
									<li><a href="${pageContext.request.contextPath}/admin/getLectureCategoryList">강좌 카테고리 관리</a>
									<li><a href="${pageContext.request.contextPath}/admin/getTimetableList">강좌 시간표 관리</a></li>
									<li></li>
									<li></li>
								</ul>
							</li>
							<li><a href="#">PRICE</a>
								<ul class="dropdown">
									<li><a href="${pageContext.request.contextPath}/admin/getMembershipPriceList">운동이용권</a></li>
									<li><a href="${pageContext.request.contextPath}/admin/getUniformRentalPriceList">운동복</a></li>
									<li><a href="${pageContext.request.contextPath}/admin/getLockerRentalPriceList">라커</a></li>
									<li></li>
									<li></li>
								</ul>
							</li>
							<li><a href="#">BOARD</a>
								<ul class="dropdown">
									<li><a href="${pageContext.request.contextPath}/getNoticeList">공지사항 게시판</a></li>
									<li><a href="${pageContext.request.contextPath}/getReviewList">후기 게시판</a></li>
									<li><a href="#">Q&A 게시판</a></li>
									<li><a href="#">이벤트 게시판</a></li>
								</ul>
							</li>
						</ul>
					</nav>
			</div>
			<div class="col-lg-3">
                    <div class="top-option">
                        <div class="to-search search-switch">
                            <i class="fa fa-search"></i>
                        </div>
                        <div class="to-social">
                            <a href="#"><i class="fa fa-facebook"></i></a>
                            <a href="#"><i class="fa fa-twitter"></i></a>
                            <a href="#"><i class="fa fa-youtube-play"></i></a>
                            <a href="#"><i class="fa fa-instagram"></i></a>
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