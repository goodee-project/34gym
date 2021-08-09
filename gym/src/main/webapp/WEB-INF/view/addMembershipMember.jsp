
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
<title>Add MembershipMember</title>

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
    	if(confirm("정말 구매하시겠습니까 ?") == true) { // 확인 누를시 진행
			if($('#permissionId').val() == ''){
				alert('지점을 선택하세요.');
				$('#permissionId').focus();
			} else if($('#membershipPriceId').val() == '') {
				alert('운동이용권을 선택하세요.');
				$('#membershipPriceId').focus();
			} else if($('#startDate').val() == '') {
				alert('시작날짜를 입력하세요.');
				$('#startDate').focus();
			} else if($('#endDate').val() == '') {
				alert('종료날짜를 입력하세요.');
				$('#endDate').focus();
			} else {
				$('#addForm').submit();
			}
    	} else{ // 취소
    		return;	
    	}
    });

	$('#membershipPriceId').change(function(){
		console.log($('#membershipPriceId').val());
		$.ajax({
			type:'get',
			url:'${pageContext.request.contextPath}/getMembershipPriceForAmount',
			data:{membershipPriceId : $('#membershipPriceId').val()},
			success: function(jsonData) {
				$('#membershipPrice').empty();
				$(jsonData).each(function(index, item) {
					console.log(item.membershipPrice);
					$('#membershipPrice').append('<input type="hidden" name="membershipPrice" value="'+item.membershipPrice+'" readonly="readonly">');
				});
			}
		});
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
		monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		onSelect:function(dateText, inst) {  
			var stDate = dateText.split("-");  
            var dt = new Date(stDate[0], stDate[1], stDate[2]);  
            var year = dt.getFullYear(); // 년도 구하기
            
            var plusMon = $('#membershipPriceId option:selected').text();
            var mon = plusMon.replace(/[^0-9]/g,'');
            
            var month = dt.getMonth() + parseInt(mon);
            var month = month + ""; // 문자형태  
            if(month.length == "1") var month = "0" + month; // 두자리 정수형태  
            var day = dt.getDate();  
            var day = day + "";   
            if(day.length == "1") var day = "0" + day;  
  
            var nextMonth = year + "-" + month + "-" + day;  
            $("#endDate").val(nextMonth);  
		}

	});
});
// 날짜 선택후 개월수 변경시
$(function(){
	$("#membershipPriceId").change(function(){
		if($('#startDate').val() != '') {
			var stDate = $('#startDate').val().split("-");  
            var dt = new Date(stDate[0], stDate[1], stDate[2]);  
            var year = dt.getFullYear(); // 년도 구하기
            
            var plusMon = $('#membershipPriceId option:selected').text();
            var mon = plusMon.replace(/[^0-9]/g,'');
            
            var month = dt.getMonth() + parseInt(mon);
            var month = month + ""; // 문자형태  
            if(month.length == "1") var month = "0" + month; // 두자리 정수형태  
            var day = dt.getDate();  
            var day = day + "";   
            if(day.length == "1") var day = "0" + day;  
  
            var nextMonth = year + "-" + month + "-" + day;  
            $("#endDate").val(nextMonth);
		}
	});
});

</script>
</head>
<body>
	<!-- 메뉴 네비게이션 바 -->
    <jsp:include page="/WEB-INF/view/inc/navBar.jsp"></jsp:include>
    
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="${pageContext.request.contextPath}/img/breadcrumb-bg.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb-text">
                        <h2>Price</h2>
                        <div class="bt-option">
                            <a href="${pageContext.request.contextPath}/memberLogin">Home</a>
                            <span>Buying</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->
	
	<!-- Pricing Section Begin -->
    <section class="pricing-section service-pricing spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <span>Our Plan</span>
                        <h2>Choose your pricing plan</h2>
                    </div>
                </div>
            </div>
            <div class="row justify-content-center">
            	<c:forEach var="m" items="${membershipNameList}"> 
	                <div class="col-lg-4 col-md-8">
	                    <div class="ps-item">
	                        <h3>${m.membershipName}</h3>
	                        <div class="pi-price">
	                            <h2>${m.membershipPrice}₩</h2>
	                            <span>Total Class</span>
	                        </div>
	                        <ul>
	                            <li>Free riding</li>
	                            <li>Unlimited equipments</li>
	                            <li>Personal trainer</li>
	                            <li>Weight losing classes</li>
	                            <li>Month to mouth</li>
	                            <li>No time restriction</li>
	                        </ul>
	                        <a href="#" class="thumb-icon"><i class="fa fa-picture-o"></i></a>
	                    </div>
	                </div>
                </c:forEach>
            </div>
        </div>
    </section>
    <!-- Pricing Section End -->
	
	<!-- 관리자 수정 Section Begin -->
    <section class="contact-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="leave-comment">
                        <form action="${pageContext.request.contextPath}/addMembershipMember" id="addForm" method="post">
                            <input type="hidden" name="membershipMember.memberId" value="${loginMember.memberId}">
                            <p>지점명: </p>
                            	<select name="membershipMember.permissionId" id="permissionId" class="form-control"> 
									<option value="">--선택--</option> 
									<c:forEach var="b" items="${branchNameList}"> 
										<option value="${b.permissionId}">${b.branchName}</option> 
									</c:forEach> 
								</select>
                            <p>운동이용권: </p>
                            	<select name="membershipMember.membershipPriceId" id="membershipPriceId" class="form-control">
                            		<option value="">--선택--</option> 
									<c:forEach var="m" items="${membershipNameList}"> 
										<option value="${m.membershipPriceId}">${m.membershipName}</option> 
									</c:forEach> 
                            	</select>
                            	<span id="membershipPrice"></span>
                            <p>시작날짜: </p>
                            	<input type="text" name="membershipMember.startDate" id="startDate">
                            <p>종료날짜: </p>
                            	<input type="text" name="membershipMember.endDate" id="endDate">
                            <button id="btn" type="button" class="primary-btn btn-normal appoinment-btn" >구매</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- 관리자 수정 Section End -->
	
	<!-- Footer Section Begin -->
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