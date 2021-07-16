<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="description" content="Gym Template">
    <meta name="keywords" content="Gym, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>modifyAdmin</title>

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
    
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script>
	$(document).ready(function() {
	    $('#btn').click(function() {
			if($('#lockerRentalPrice').val() == ''){
				alert('라커 1개월 비용을 입력하세요.');
				$('#lockerRentalPrice').focus();
			} else if($('#startDate').val() == '') {
				alert('시작날짜를 입력하세요.');
				$('#startDate').focus();
			} else if($('#endDate').val() == '') {
				alert('종료날짜를 입력하세요.');
				$('#endDate').focus();
			} else {
			     $('#modifyForm').submit();
			}
	    });
	});
	
	$(function(){
		$("#startDate,#endDate").datepicker({
			changeMonth: true,
			changeYear: true, 
			minDate: '-50y', 
			nextText: '다음 달', 
			prevText: '이전 달', 
			yearRange: 'c-50:c+50', 
			showButtonPanel: true, 
			currentText: '오늘 날짜', 
			closeText: '닫기', 
			dateFormat: "yy-mm-dd", 
			showMonthAfterYear: true, 
			dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
			monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] 
		});
	});
	</script>
</head>
<body>
    <!-- 메뉴 네비게이션 바 -->
    <jsp:include page="/WEB-INF/view/inc/adminNavBar.jsp"></jsp:include>

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="${pageContext.request.contextPath}/img/breadcrumb-bg.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb-text">
                        <h2>Modify LockerRentalPrice</h2>
                        <div class="bt-option">
                            <a href="${pageContext.request.contextPath}/admin/adminLogin">Home</a>
                            <a href="${pageContext.request.contextPath}/admin/getLockerRentalPriceList">LockerRentalPrice List</a>
                            <span>Modify LockerRentalPrice</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- 지점 계약조건 수정 Section Begin -->
	<section class="contact-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="leave-comment">
                         <form id="modifyForm" action="${pageContext.request.contextPath}/admin/modifyLockerRentalPrice" method="post">
							<input type="hidden" name="lockerRentalPriceId" value="${lockerRentalPriceOne.lockerRentalPriceId}">
                            <p>라커 1개월 비용: </p>
                            	<input type="text" name="lockerRentalPrice" id="lockerRentalPrice" class="form-control" value="${lockerRentalPriceOne.lockerRentalPrice}">
                            <p>시작날짜: </p>
                            	<input type="text" name="startDate" id="startDate" class="form-control" value="${lockerRentalPriceOne.startDate}">
                            <p>종료날짜: </p>
                            	<input type="text" name="endDate" id="endDate" class="form-control" value="${lockerRentalPriceOne.endDate}">
                            <button id="btn" type="button">수정</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- 지점 계약조건 수정 Section End -->

    <!-- footer 바 -->
    <jsp:include page="/WEB-INF/view/inc/footer.jsp"></jsp:include>
    
    <!-- Js Plugins -->
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.magnific-popup.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/masonry.pkgd.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.barfiller.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.slicknav.js"></script>
    <script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/main.js"></script>
</body>
</html>