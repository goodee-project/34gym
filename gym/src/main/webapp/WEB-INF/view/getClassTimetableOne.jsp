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

<title>getLectureOne</title>

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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
$(document).ready(function(){
	console.log(${CheckLectureMember});
	$('#btn').click(function(){
		console.log('btn click');
		if($('#memberId').val() == '') {
			alert('로그인이 필요합니다.')
			// 로그인 창으로 이동
			window.location.href = '${pageContext.request.contextPath}/login';
		} else if(${CheckLectureMember} != 0) {
			alert('이미 구매한 강좌입니다.')
			// 마이페이지 이동
			window.location.href = '${pageContext.request.contextPath}/member/getLectureByMemberList';
		} else {
			$('#addForm').submit();
		}
	}); 
});
</script>
</head>
<body>
	<div>
		<jsp:include page="/WEB-INF/view/inc/navBar.jsp"></jsp:include>
	</div>
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="img/breadcrumb-bg.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb-text">
                        <h2>Timetable One</h2>
                        <div class="bt-option">
                            <a href="./index.html">Home</a>
                            <a href="#">Pages</a>
                            <span>Timetable One</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->
	<!-- Table Section Begin -->
	<section class="contact-section spad">
		<div class="container">
			<div class="row">
	        	<div class="col-lg-12 text-center">
	        		<div class="section-title chart-title">
	          			<h2>Timetable One</h2>
	          		</div>
	          	</div>
	          	<div class="col-lg-6">
					<img alt="" src="${pageContext.request.contextPath}/img/classes/class-one.jpg">
				</div>
	            <div class="col-lg-6">
	          		<div class="chart-table"> 
						<form id="addForm" action="${pageContext.request.contextPath}/addLectureMember" method="post">
							<input id="memberId" type="hidden" value="${loginMember.memberId}" name="lectureMember.memberId">
							<input id="lectureId" type="hidden" value="${classTimetableOne.lectureId}" name="lectureMember.lectureId">
							<input id="amount" type="hidden" value="${classTimetableOne.lecturePrice}" name="lectureAmount.amount">
							<input id="lectureName" type="hidden" value="${classTimetableOne.lectureName}" name="lectureName">
							<table border="1">
						         <tbody>
						            <tr>
						                <td>지점이름</td>
						                <td>${classTimetableOne.branchName}</td>
						            </tr>
						            <tr>
						                <td>강좌종류</td>
						                <td>${classTimetableOne.lectureCategory}</td>
						            </tr>
						            <tr>
						                <td>강좌이름</td>
						                <td>${classTimetableOne.lectureName}</td>
						            </tr>
						            <tr>
						                <td>강사이름</td>
						                <td>${classTimetableOne.trainerName}</td>
						            </tr>
						            <tr>
						                <td>시간</td>
						                <td>${classTimetableOne.timetableDay}</td>
						            </tr>
						            <tr>
						                <td>강의실</td>
						                <td>${classTimetableOne.lectureRoomName}</td>
						            </tr>
						            <tr>
						                <td>수용인원</td>
						                <td>${classTimetableOne.lectureRoomCapacity}</td>
						            </tr>
						            <tr>
						                <td>강좌비용</td>
						                <td>${classTimetableOne.lecturePrice}</td>
						            </tr>
						            <tr>
						                <td>시작날짜</td>
						                <td>${classTimetableOne.startDate}</td>
						            </tr>
						            <tr>
						                <td>종료날짜</td>
						                <td>${classTimetableOne.endDate}</td>
						            </tr>
						        </tbody>
						    </table>
    					</form>
    					<hr>
    					<button id="btn" type="button" class="primary-btn btn-normal appoinment-btn" style="WIDTH: 417pt; HEIGHT: 50pt">Buy Now</button>
					</div>
            	</div>
             </div>
		</div>
    </section>
    <!-- Table Section End -->
    <!-- Footer Section Begin -->
	<jsp:include page="/WEB-INF/view/inc/footer.jsp"></jsp:include>

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