<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<body>	
	<!-- Header Section Begin -->
    <header class="header-section">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-3">
                    <div class="logo">
                    	<img src="${pageContext.request.contextPath}/img/logo.png" alt="">
                    </div>
                </div>
				<div class="col-lg-6">
					<nav class="nav-menu">
						<ul>
							<li><a href="${pageContext.request.contextPath}/">HOME</a></li>
							<li><a href="#">ABOUT US</a>
								<ul class="dropdown">
									<li><a href="">소개</a></li>
									<li><a href="">지점</a></li>
									<li><a href="">contact us</a></li>
									<li><a href="">등등</a></li>
								</ul>
							</li>
							<c:if test="${loginAdmin != null}">
								<li><a href="#">ADMIN</a>
									<ul class="dropdown">
										<li><a href="${pageContext.request.contextPath}/admin/getAdminList">관리자 관리</a></li>
										<li><a href="${pageContext.request.contextPath}/admin/getContractList">지점 계약조건 관리</a></li>
										<li><a href="${pageContext.request.contextPath}/admin/getWaitingForPermissionList">지점 신청 관리</a></li>
										<li><a href="${pageContext.request.contextPath}/admin/getEmploymentTypeList">고용형태 관리</a></li>
										<li><a href="${pageContext.request.contextPath}/admin/getLectureCategoryList">강좌 카테고리 관리</a>
										<li><a href="${pageContext.request.contextPath}/admin/getTimetableList">강좌 시간표 관리</a></li>
									</ul>
								</li>
							</c:if>
							<c:if test="${loginBranch != null}">
								<li><a href="#">BRANCH</a>
									<ul class="dropdown">
										<li><a href="${pageContext.request.contextPath}/branch/getLectureList">강좌 관리</a></li>
										<li><a href="${pageContext.request.contextPath}/branch/getLectureRoomList">강의실 관리</a></li>
										<li><a href="${pageContext.request.contextPath}/branch/getLockerList">라커 관리</a></li>
										<li><a href="${pageContext.request.contextPath}/branch/getTrainerApplicationList">강사신청 관리</a></li>
										<li><a href="${pageContext.request.contextPath}/branch/getTrainerRecruitmentList">채용된 강사 관리</a></li>
										<li><a href="${pageContext.request.contextPath}/admin/getTimetableList">강좌 시간표 관리</a></li>
										<li><a href="#">회원 출입기록 관리</a></li>
									</ul>
								</li>
							</c:if>
							<c:if test="${loginAdmin != null}">
								<li><a href="#">PRICE관리</a>
									<ul class="dropdown">
										<li><a href="${pageContext.request.contextPath}/admin/getMembershipPriceList">운동이용권 비용</a></li>
										<li><a href="${pageContext.request.contextPath}/admin/getUniformRentalPriceList">운동복 비용</a></li>
										<li><a href="${pageContext.request.contextPath}/admin/getLockerRentalPriceList">라커 비용</a></li>
										<li></li>
										<li></li>
									</ul>
								</li>
							</c:if>
							<li><a href="#">PRICE</a>
								<ul class="dropdown">
									<li><a href="${pageContext.request.contextPath}/member/addMembershipMember">운동이용권 구매</a></li>
									<li><a href="">운동복(없음)</a></li>
									<li><a href="">라커(없음)</a></li>
								</ul>
							</li>
							<li><a href="#">Pages</a>
                                <ul class="dropdown">
                                    <li><a href="${pageContext.request.contextPath}/">About us</a></li>
                                    <li><a href="${pageContext.request.contextPath}/getClassTimetable">Classes timetable</a></li>
                                    <li><a href="${pageContext.request.contextPath}/">Bmi calculate</a></li>
                                    <li><a href="${pageContext.request.contextPath}/">Our team</a></li>
                                    <li><a href="${pageContext.request.contextPath}/">Gallery</a></li>
                                    <li><a href="${pageContext.request.contextPath}/">Our blog</a></li>
                                    <li><a href="${pageContext.request.contextPath}/">404</a></li>
                                </ul>
                            </li>
							<li><a href="#">BOARD</a>
								<ul class="dropdown">
									<li><a href="${pageContext.request.contextPath}/getNoticeList">공지사항 게시판</a></li>
									<li><a href="${pageContext.request.contextPath}/getReviewList">후기 게시판</a></li>
									<li><a href="${pageContext.request.contextPath}/getQnAList">Q&A 게시판</a></li>
									<li><a href="${pageContext.request.contextPath}/getRecruitList">구인 게시판</a></li>
								</ul>
							</li>
							<c:if test="${loginMember != null}">
								<li><a href="${pageContext.request.contextPath}/member/getMemberMyPage">MyPage</a>
							</li>
							</c:if>
							
						</ul>
					</nav>
			</div>
			
			<div class="col-lg-3">
                <div class="top-option">
                	<c:if test="${loginMember != null}">	
                		<div class="to-social">
                			<a href="${pageContext.request.contextPath}/memberLogout">LOGOUT</a>
                		</div>
					</c:if>
					<c:if test="${loginAdmin != null}">	
						<div class="to-social">
							<a href="${pageContext.request.contextPath}/admin/logout">LOGOUT</a>
						</div>
					</c:if>
                    <c:if test="${loginMember == null && loginAdmin == null && loginBranch == null}">
	                    <div class="to-social">
							<a href="${pageContext.request.contextPath}/login">Login</a>
	                    </div>
                    </c:if>
                </div>
            </div>
			
            <div class="canvas-open">
                <i class="fa fa-bars"></i>
            </div>
        </div>
    </header>
    <!-- Header End -->
</body>