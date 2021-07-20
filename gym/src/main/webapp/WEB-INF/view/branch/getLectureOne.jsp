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
	<!-- 메뉴 네비게이션 바 -->
    <jsp:include page="/WEB-INF/view/inc/BranchNavBar.jsp"></jsp:include>
    
	<h1>강좌 상세보기</h1>
	
	<table border="1">
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
	    <a href="${pageContext.request.contextPath}/branch/modifyLecture?lectureId=${lectureOne.lectureId}"><button class="btn btn-default">수정</button></a>
	    <a href="${pageContext.request.contextPath}/branch/removeLecture?lectureId=${lectureOne.lectureId}"><button id="removeBtn" class="btn btn-default">삭제</button></a>
	    <a href="${pageContext.request.contextPath}/branch/getLectureList"><button type="button" class="btn btn-default">목록</button></a>
	</div>
</body>
</html>