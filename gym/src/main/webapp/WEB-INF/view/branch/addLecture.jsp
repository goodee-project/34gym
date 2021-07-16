<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addLecture</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
$(document).ready(function(){
	// 요일/교시/시간 선택
	console.log('시간 목록 조회');
	$('#timetableDay').empty();
	$('#timetableDay').append('<option value="">==선택==</option>');
	if($('#branchName').val() != '') { // 지점이 선택되었다면 실행되게 함
		$.ajax({ // ajax는 하나의 url만 사용 가능함
				type:'get',
				url:'${pageContext.request.contextPath}/usableTimetable',
				data:{permissionId : $('#permissionId').val()},
				success: function(jsonData) {
					$(jsonData).each(function(index, item){
						$('#timetableDay').append(
								'<option value="'+item.timetableId+'">'+item.timetableDay+'</option>'
						);
					});
				}
		});
	}
		
	// 강사 선택
	console.log('강사 목록 조회');
	$('#trainerName').empty();
	$('#trainerName').append('<option value="">==선택==</option>');
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
				}
		});
	}
		
	// 강의실 선택
	console.log('강의실 조회');
	$('#lectureRoom').empty();
	$('#lectureRoom').append('<option value="">==선택==</option>');
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
				}
		});
	}
	
	// 강좌종류 선택
	console.log('강좌종류 조회');
	$('#lectureCategory').empty();
	$('#lectureCategory').append('<option value="">==선택==</option>');
	$.ajax({ // ajax는 하나의 url만 사용 가능함
		type:'get',
		url:'${pageContext.request.contextPath}/lectureCategory',
		success: function(jsonData) {
			$(jsonData).each(function(index, item){
				$('#lectureCategory').append(
						'<option value="'+item.lectureCategoryId+'">'+item.lectureCategory+'</option>'
				);
			});
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
		     $('#addForm').submit();
		}
    });
});
</script>
</head>
<body>
	<h1>강좌 개설</h1>
	<form id="addForm" action="${pageContext.request.contextPath}/branch/addLecture" method="post">	
		<input type="hidden" name="permissionId" id="permissionId" value="${permissionId}">
		<table border="1">
   			<tr>
   				<th>지점이름</th>
   				<td>
   					<input type="text" name="branchName" id="branchName" value="${branchName}" readonly="readonly">
   				</td>
   			</tr>
   			<tr>
   				<th>강좌종류</th>
   				<td>
   					<select name="lectureCategoryId" id="lectureCategory"></select>
   				</td>
   			</tr>
   			<tr>
   				<th>강좌이름</th>
   				<td><input type="text" name="lectureName" id="lectureName" class="form-control"></td>
   			</tr>
   			<tr>
   				<th>강사이름</th>
   				<td>
   					<select name="trainerApplicationId" id="trainerName"></select>
   				</td>
   			</tr>
   			<tr>
   				<th>시간</th>
   				<td>
   					<select name="timetableId" id="timetableDay"></select>
   				</td>
   			</tr>
   			<tr>
				<th>강의실</th>
   				<td>
   					<select name="lectureRoomId" id="lectureRoom"></select>
   				</td>
   			</tr>
   			<tr>
   				<th>강좌비용</th>
   				<td><input type="text" name="lecturePrice" id="lecturePrice" class="form-control"></td>
   			</tr>
   			<tr>
   				<th>시작날짜</th>
   				<td><input type="text" name="startDate" id="startDate" class="form-control"></td>
   			</tr>
   			<tr>
   				<th>종료날짜</th>
   				<td><input type="text" name="endDate" id="endDate" class="form-control"></td>
   			</tr>
	   	</table>
	   	<div>
		    <button class="btn btn-default" id="btn" type="button">개설</button>
		    <button class="btn btn-default" type="reset">초기화</button>
		    <a class="btn btn-default" href="${pageContext.request.contextPath}/branch/getLectureList"><button class="btn btn-default">목록</button></a>
		</div>
	</form>
</body>
</html>