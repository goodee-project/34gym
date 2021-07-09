<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addUniformRentalPrice</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
$(document).ready(function() {
    $('#btn').click(function() {
		if($('#uniformRentalPrice').val() == ''){
			alert('운동복 1개월 비용을 입력하세요.');
			$('#uniformRentalPrice').focus();
		} else if($('#startDate').val() == '') {
			alert('시작날짜를 입력하세요.');
			$('#startDate').focus();
		} else if($('#endDate').val() == '') {
			alert('종료날짜를 입력하세요.');
			$('#endDate').focus();
		} else {
		     $('#addForm').submit();
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
    <div class="container">
        <h1>운동복 1개월 비용 추가</h1>
        <form id="addForm" action="${pageContext.request.contextPath}/addUniformRentalPrice" method="post">
            <table class="table table-hover">
            <tr>
               <td>운동복 1개월 비용</td>
               <td>
                  <input type="text" name="uniformRentalPrice" id="uniformRentalPrice" class="form-control">
               </td>
            </tr>
            <tr>
               <td>시작날짜</td>
               <td>
                  <input type="text" name="startDate" id="startDate" class="form-control">
               </td>
            </tr>
            <tr>
               <td>종료날짜</td>
               <td>
                  <input type="text" name="endDate" id="endDate" class="form-control">
               </td>
            </tr>
            </table>
            <div>
                <button class="btn btn-default" id="btn" type="button">추가</button>
                <button class="btn btn-default" type="reset">초기화</button>
                <a href="javascript:history.back()"><button class="btn btn-default">목록</button></a>
            </div>
        </form>
    </div>
</body>
</html>