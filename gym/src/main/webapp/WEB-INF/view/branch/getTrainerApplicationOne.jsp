<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TrainerApplicaionOne</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
$(document).ready(function(){
	$('#btn').click(function(){
		if($('#count').val() == '') {
		} else {
			console.log('btn click');
			$('#addForm').submit();
			console.log('submit');
		}
	});
	
	//input을 datepicker로 선언
    $("#joinDate").datepicker({
        dateFormat: 'yy-mm-dd' //달력 날짜 형태
        ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
        ,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
        ,changeYear: true //option값 년 선택 가능
        ,changeMonth: true //option값  월 선택 가능                
        ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
        ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
        ,buttonImageOnly: true //버튼 이미지만 깔끔하게 보이게함
        ,buttonText: "선택" //버튼 호버 텍스트              
        ,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
        ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
        ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
        ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
        ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
        ,minDate: "-5Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
        ,maxDate: "+5y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)  
    }); 
})
</script>
</head>
<body>
	<!-- 메뉴 네비게이션 바 -->
    <jsp:include page="/WEB-INF/view/inc/BranchNavBar.jsp"></jsp:include>
    
	<h1>강사지원 상세보기</h1>
	
	<form id="addForm" action="${pageContext.request.contextPath}/branch/addTrainerRecruitment" method="post">
		<input type="hidden" name="trainerApplicationId" value="${trainerApplicationOne.trainerApplicationId}">
		<input type="hidden" name="permissionId" value="${permissionId}">
		입사일: <input type="text" name="joinDate" id="joinDate">
		<c:if test="${trainerApplicationIdForRecruitment.trainerApplicationId != ''}">
			<button id="btn" type="button">채용</button>
		</c:if>
	</form>
	
	<table border="1">
         <tbody>
			<tr>
                <td>강사지원 번호</td>
                <td>${trainerApplicationOne.trainerApplicationId}</td>
            </tr>
            <tr>
                <td>이름</td>
                <td>${trainerApplicationOne.memberName}</td>
            </tr>
            <tr>
                <td>Eamil</td>
                <td>${trainerApplicationOne.memberEmail}</td>
            </tr>
            <tr>
                <td>주소</td>
                <td>${trainerApplicationOne.memberAddress}</td>
            </tr>
            <tr>
                <td>전화번호</td>
                <td>${trainerApplicationOne.memberPhone}</td>
            </tr>
            <tr>
                <td>경력</td>
                <td>${trainerApplicationOne.career}</td>
            </tr>
            <tr>
                <td>분야</td>
                <td>${trainerApplicationOne.type}</td>
            </tr>
            <tr>
                <td>사진</td>
                <td>${trainerApplicationOne.resumeImg}</td>
            </tr>
            <tr>
                <td>자격증</td>
                <td>${trainerApplicationOne.certificate}</td>
            </tr>
            <tr>
                <td>자기소개서</td>
                <td>${trainerApplicationOne.resumeContent}</td>
            </tr>
            <tr>
                <td>고용형태</td>
                <td>${trainerApplicationOne.employmentType}</td>
            </tr>
            <tr>
                <td>구인게시판 제목</td>
                <td><a href="">${trainerApplicationOne.jobOpeningTitle}</a></td>
            </tr>
            <tr>
                <td>지원날짜</td>
                <td>${trainerApplicationOne.applyDate}</td>
            </tr>
            <tr>
                <td>수정날짜</td>
                <td>${trainerApplicationOne.lastUpdate}</td>
            </tr>
        </tbody>
    </table>
</body>
</html>