<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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

	<h1>강좌 상세보기</h1>
	<form action="${pageContext.request.contextPath}/addLectureMember" method="post">
	<input type="hidden" value="${loginMember.memberId}" name="lectureMember.memberId">
	<input type="hidden" value="${classTimetableOne.lectureId}" name="lectureMember.lectureId">
	<input type="hidden" value="${classTimetableOne.lecturePrice}" name="lectureAmount.amount">
	<input type="hidden" value="${classTimetableOne.lectureName}" name="lectureName">
	<table border="1">
         <tbody>
			<tr>
                <td>강좌ID</td>
                <td>${classTimetableOne.lectureId}</td>
            </tr>
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
    <button type="submit">강좌 구매하기</button>
    </form>
    <div>
	    <a href="${pageContext.request.contextPath}/getClassTimetable"><button type="button" class="btn btn-default">목록</button></a>
	</div>
</body>
</html>