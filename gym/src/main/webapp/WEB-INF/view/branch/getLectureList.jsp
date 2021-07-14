<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getLectureList</title>
</head>
<body>
	<!-- 메뉴 네비게이션 바 -->
    <jsp:include page="/WEB-INF/view/inc/BranchNavBar.jsp"></jsp:include>
    
	<h1>강좌 목록</h1>
	
	<a href="${pageContext.request.contextPath}/branch/addLecture"><button>강좌등록</button></a>
	<table border="1">
		<tr>
			<th>lectureID</th>
			<th>지점이름</th>
			<th>강좌종류</th>
			<th>강좌이름</th>
			<th>강사이름</th>
			<th>요일/교시</th>
			<th>시간</th>
			<th>강의실</th>
			<th>강좌비용</th>
			<th>시작날짜</th>
			<th>종료날짜</th>
			<th>수정</th>
			<th>삭제</th>
		</tr>
		<c:forEach var="l" items="${lectureList}">
			<tr>
				<td>${l.lectureId}</td>
				<td>${l.branchName}</td>
				<td>${l.lectureCategory}</td>
				<td>${l.lectureName}</td>
				<td>${l.trainerName}</td>
				<td>${l.timetableDay}</td>
				<td>${l.timetablePeriod}</td>
				<td>${l.lectureRoomName}</td>
				<td>${l.lecturePrice}</td>
				<td>${l.startDate}</td>
				<td>${l.endDate}</td>
				<td><a href="${pageContext.request.contextPath}/branch/modifyLecture?lectureId="><button>수정</button></a></td>
				<td><a href="${pageContext.request.contextPath}/branch/removeLecture?lectureId="><button>삭제</button></a></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>