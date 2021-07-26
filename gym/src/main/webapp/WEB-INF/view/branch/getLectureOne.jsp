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
<title>getLectureOne</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
$(document).ready(function(){
	$('#removeBtn').click(function(){
		console.log('removeBtn click');
	}); 
});
</script>
</head>
<body>
	<!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>
	
	<!-- 메뉴 네비게이션 바 -->
    <jsp:include page="/WEB-INF/view/inc/navBar.jsp"></jsp:include>
    
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="${pageContext.request.contextPath}/img/breadcrumb-bg.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb-text">
                        <h2>Lecture One</h2>
                        <div class="bt-option">
                            <a href="${pageContext.request.contextPath}/admin/adminLogin">Home</a>
                            <span>Lecture One</span>
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
                        <h2>강좌 상세보기</h2>
                    </div>
                    <div class="chart-table">
                        <table>
							<tbody>
								<tr>
					                <td>강좌ID</td>
					                <td>${lectureOne.lectureId}</td>
					            </tr>
					            <tr>
					                <td>지점이름</td>
					                <td>${lectureOne.branchName}</td>
					            </tr>
					            <tr>
					                <td>강좌종류</td>
					                <td>${lectureOne.lectureCategory}</td>
					            </tr>
					            <tr>
					                <td>강좌이름</td>
					                <td>${lectureOne.lectureName}</td>
					            </tr>
					            <tr>
					                <td>강사이름</td>
					                <td>${lectureOne.trainerName}</td>
					            </tr>
					            <tr>
					                <td>시간</td>
					                <td>${lectureOne.timetableDay}</td>
					            </tr>
					            <tr>
					                <td>강의실</td>
					                <td>${lectureOne.lectureRoomName}</td>
					            </tr>
					            <tr>
					                <td>수용인원</td>
					                <td>${lectureOne.lectureRoomCapacity}</td>
					            </tr>
					            <tr>
					                <td>강좌비용</td>
					                <td>${lectureOne.lecturePrice}</td>
					            </tr>
					            <tr>
					                <td>시작날짜</td>
					                <td>${lectureOne.startDate}</td>
					            </tr>
					            <tr>
					                <td>종료날짜</td>
					                <td>${lectureOne.endDate}</td>
					            </tr>
							</tbody>
                        </table>
                        <div>
						    <a href="${pageContext.request.contextPath}/branch/modifyLecture?lectureId=${lectureOne.lectureId}"><button class="primary-btn">수정</button></a>
						    <a href="${pageContext.request.contextPath}/branch/removeLecture?lectureId=${lectureOne.lectureId}"><button id="removeBtn" class="primary-btn">삭제</button></a>
						    <a href="${pageContext.request.contextPath}/branch/getLectureList"><button type="button" class="primary-btn">목록</button></a>
						</div>
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