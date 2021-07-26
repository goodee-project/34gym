<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<title>modifyLecture</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
$(document).ready(function(){
		
	// 강사 선택
	console.log('강사 목록 조회');
	$('#trainerName').empty();
	if($('#branchName').val() != '') {
		$.ajax({ // ajax는 하나의 url만 사용 가능함
				type:'get',
				url:'${pageContext.request.contextPath}/trainer',
				data:{permissionId : $('#permissionId').val()},
				success: function(jsonData) {
					$(jsonData).each(function(index, item){
						$('#trainerName').append(
								'<option value="'+item.trainerApplicationId+'">'+item.trainerName+'</option>'
						);
					});
					// 기존 정보와 동일한 option값이 selected 되어서 보이게 함
					$('#trainerName').val($('#trainerNameVal').val).prop("selected",true);
				}
		});
	}
		
	// 강의실 선택
	console.log('강의실 조회');
	$('#lectureRoom').empty();
	if($('#branchName').val() != '') {
		$.ajax({ // ajax는 하나의 url만 사용 가능함
				type:'get',
				url:'${pageContext.request.contextPath}/lectureRoom',
				data:{permissionId : $('#permissionId').val()},
				success: function(jsonData) {
					$(jsonData).each(function(index, item){
						$('#lectureRoom').append(
								'<option value="'+item.lectureRoomId+'">'+item.lectureRoomName+'</option>'
						);
					});
					// 기존 정보와 동일한 option값이 selected 되어서 보이게 함
					$('#lectureRoom').val($('#lectureRoomVal').val).prop("selected",true);
				}
		});
	}
	
	// 강좌종류 선택
	console.log('강좌종류 조회');
	$('#lectureCategory').empty();
	$.ajax({ // ajax는 하나의 url만 사용 가능함
		type:'get',
		url:'${pageContext.request.contextPath}/lectureCategory',
		success: function(jsonData) {
			$(jsonData).each(function(index, item){
				$('#lectureCategory').append(
						'<option value="'+item.lectureCategoryId+'">'+item.lectureCategory+'</option>'
				);
			});
			// 기존 정보와 동일한 option값이 selected 되어서 보이게 함
			$('#lectureCategory').val($('#lectureCategoryVal').val).prop("selected",true);
		}
	});
	
	
	// 시작날짜(startDate), 끝나는 날짜(endDate)를 datepicker API로 선택 가능하게 함
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
	
	// 폼 유효성 검사
	$('#btn').click(function() {
		if($('#lectureCategory').val() == ''){
			alert('강좌종류를 선택하세요.');
			$('#lectureCategory').focus();
		} else if($('#lectureName').val() == '') {
			alert('강좌이름을 입력하세요.');
			$('#lectureName').focus();
		} else if($('#trainerName').val() == '') {
			alert('강사를 선택하세요.');
			$('#trainerName').focus();
		} else if($('#timetableDay').val() == '') {
			alert('강좌시간을 선택하세요.');
			$('#timetableDay').focus();
		} else if($('#lectureRoom').val() == '') {
			alert('강의실을 선택하세요.');
			$('#lectureRoom').focus();
		} else if($('#lecturePrice').val() == '') {
			alert('강좌비용을 입력하세요.');
			$('#lecturePrice').focus();
		} else if($('#startDate').val() == '') {
			alert('시작날짜을 선택하세요.');
			$('#startDate').focus();
		} else if($('#endDate').val() == '') {
			alert('종료날짜를 입력하세요.');
			$('#endDate').focus();
		} else {
		     $('#modifyForm').submit();
		}
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
                        <h2>Modify Lecture</h2>
                        <div class="bt-option">
                            <a href="${pageContext.request.contextPath}/admin/adminLogin">Home</a>
                            <span>Modify Lecture</span>
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
                        <h2>강좌 수정</h2>
                    </div>
                    <div class="chart-table">
                        <input type="hidden" name="permissionId" id="permissionId" value="${permissionId}">
                        <form id="modifyForm" action="${pageContext.request.contextPath}/branch/modifyLecture" method="post">	
	                        <table>
								<tbody>
									<tr>
						                <td>강좌ID</td>
						                <td>
						   					<input type="text" name="lectureId" id="lectureId" value="${lectureOne.lectureId}" readonly="readonly">
						   				</td>
						            </tr>
						            <tr>
						                <td>지점이름</td>
						                <td>
						   					<input type="text" name="branchName" id="branchName" value="${lectureOne.branchName}" readonly="readonly">
						   				</td>
						            </tr>
						            <tr>
						                <td>강좌종류</td>
						                <td>
						   					<input type="hidden" id="lectureCategoryVal" value="${lectureOne.lectureCategory}">
						   					<select name="lectureCategoryId" id="lectureCategory"></select>
						   				</td>
						            </tr>
						            <tr>
						                <td>강좌이름</td>
						                <td><input type="text" name="lectureName" id="lectureName" value="${lectureOne.lectureName}" class="form-control"></td>
						            </tr>
						            <tr>
						                <td>강사이름</td>
	                   					<td>
						   					<input type="hidden" id="trainerNameVal" value="${lectureOne.trainerName}">
						   					<select name="trainerApplicationId" id="trainerName"></select>
						   				</td>
						            </tr>
						            <tr>
						                <td>시간</td>
						                <td>
						   					<input type="text" id="timetableDay" value="${lectureOne.timetableDay}" readonly="readonly">
						   				</td>
						            </tr>
						            <tr>
						                <td>강의실</td>
						                <td>
						   					<input type="hidden" id="lectureRoomVal" value="${lectureOne.trainerName}">
						   					<select name="lectureRoomId" id="lectureRoom"></select>
						   				</td>
						            </tr>
						            <tr>
						                <td>수용인원</td>
						                <td>${lectureOne.lectureRoomCapacity}</td>
						            </tr>
						            <tr>
						                <td>강좌비용</td>
						                <td><input type="text" name="lecturePrice" id="lecturePrice" value="${lectureOne.lecturePrice}" class="form-control"></td>
						            </tr>
						            <tr>
						                <td>시작날짜</td>
						                <td><input type="text" name="startDate" id="startDate" value="${lectureOne.startDate}" class="form-control"></td>
						            </tr>
						            <tr>
						                <td>종료날짜</td>
						                <td><input type="text" name="endDate" id="endDate" value="${lectureOne.endDate}" class="form-control"></td>
						            </tr>
								</tbody>
	                        </table>
	                        <div>
							    <button class="primary-btn" id="btn" type="button">수정</button>
							    <button class="primary-btn" type="reset">초기화</button>
							    <a href="${pageContext.request.contextPath}/branch/getLectureList"><button type="button" class="primary-btn">목록</button></a>
							</div>
	                    	</form>
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
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.magnific-popup.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/masonry.pkgd.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.barfiller.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.slicknav.js"></script>
    <script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/main.js"></script>
</body>
</html>