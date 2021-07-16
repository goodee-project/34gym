<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>LockerRentalPrice List</title>
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
                        <h2>LockerRentalPrice List</h2>
                        <div class="bt-option">
                            <a href="${pageContext.request.contextPath}/admin/adminLogin">Home</a>
                            <span>LockerRentalPrice List</span>
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
                <div class="col-lg-6">
                    <div class="section-title chart-title">
                        <h2>라커 1개월 비용 목록</h2>
                    </div>
                    <div class="chart-table">
                        <a href="${pageContext.request.contextPath}/admin/addLockerRentalPrice"><button class="primary-btn">라커 1개월 비용 등록</button></a>
                        <table>
                        	<thead>
	                            <tr>
					                <th>lockerRentalPriceID</th>
					                <th>라커 1개월 비용</th>
					                <th>시작날짜</th>
					                <th>종료날짜</th>
					                <th>수정</th>
					                <th>삭제</th>
					            </tr>
							</thead>
							<tbody>
								<c:forEach var="l" items="${lockerRentalPriceList}">
					                <tr>
					                	<td>${l.lockerRentalPriceId}</td>
					                    <td>${l.lockerRentalPrice}</td>
					                    <td>${l.startDate}</td>
					                    <td>${l.endDate}</td>
					                    <td><a href="${pageContext.request.contextPath}/admin/modifyLockerRentalPrice?lockerRentalPriceId=${l.lockerRentalPriceId}"><button class="primary-btn">수정</button></a></td>
					                    <td><a href="${pageContext.request.contextPath}/admin/removeLockerRentalPrice?lockerRentalPriceId=${l.lockerRentalPriceId}"><button class="primary-btn">삭제</button></a></td>
					                </tr>
					            </c:forEach>
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