<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="description" content="Gym Template">
    <meta name="keywords" content="Gym, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Oswald:300,400,500,600,700&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/flaticon.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/barfiller.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css">
<title>getMemberEntranceRecordList</title>
</head>
<body>
	<!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>
	
	<!-- 메뉴 네비게이션 바 -->
    <jsp:include page="/WEB-INF/view/inc/adminNavBar.jsp"></jsp:include>
	
	<!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="${pageContext.request.contextPath}/img/breadcrumb-bg.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb-text">
                        <h2>MemberEntranceRecord List</h2>
                        <div class="bt-option">
                            <a href="${pageContext.request.contextPath}/">Home</a>
                            <a>Branch</a>
                            <span>MemberEntranceRecord List</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->
	
	<!-- Table Section Begin -->
    <section class="bmi-calculator-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title chart-title">
                        <h2>회원 출입기록 목록</h2>
                    </div>
                    
                    <!-- 옵션으로 회원유형(강좌, 운동)을 선택해서 볼 수 있게 함 -->
					<form id="typeForm" action="${pageContext.request.contextPath}/branch/getMemberEntranceRecordList" method="get">
						<select name="memberType" style="background: transparent; font-size: 13px; color: #c4c4c4; border: 1px solid #363636;">
							<option value="0">==선택==</option>
							<option value="1" <c:if test="${memberType == 1}">selected</c:if>>운동회원</option>
							<option value="2" <c:if test="${memberType == 2}">selected</c:if>>강좌회원</option>
						</select>
						<button id="btn" type="submit" class="primary-btn btn-very-small">조회</button>
					</form>
                    <div class="chart-table">
                        <table>
	                        <thead>	
	                        	<tr>
									<th>회원이름</th>
									<th>회원유형</th>
									<th>입장시간</th>
									<th>퇴장시간</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${memberType == 0}">
									<c:forEach var="e" items="${entranceRecordList}">
										<tr>
											<td>${e.memberName}</td>
											<td>${e.memberType}</td>
											<td>${e.entranceTime}</td>
											<td>${e.exitTime}</td>
										</tr>
									</c:forEach>
								</c:if>
								<c:if test="${memberType == 1}">
									<c:forEach var="m" items="${membershipEntranceRecordList}">
										<tr>
											<td>${m.memberName}</td>
											<td>${m.memberType}</td>
											<td>${m.entranceTime}</td>
											<td>${m.exitTime}</td>
										</tr>
									</c:forEach>
								</c:if>
								<c:if test="${memberType == 2}">
									<c:forEach var="l" items="${lectureEntranceRecordList}">
										<tr>
											<td>${l.memberName}</td>
											<td>${l.memberType}</td>
											<td>${l.entranceTime}</td>
											<td>${l.exitTime}</td>
										</tr>
									</c:forEach>
								</c:if>
							</tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Table Section End -->
    
    <!-- Footer Start -->
    <jsp:include page="/WEB-INF/view/inc/footer.jsp"></jsp:include>
    <!-- Footer Start -->
    
	<!-- Js Plugins -->
    <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.magnific-popup.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/masonry.pkgd.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.barfiller.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.slicknav.js"></script>
    <script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/main.js"></script>
</body>
</html>