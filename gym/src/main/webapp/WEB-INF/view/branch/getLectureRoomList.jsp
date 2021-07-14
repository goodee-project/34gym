<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LectureRoomList</title>
</head>
<body>
	<!-- 메뉴 네비게이션 바 -->
    <jsp:include page="/WEB-INF/view/inc/BranchNavBar.jsp"></jsp:include>
    
	<h1>강의실 목록</h1>
	
	<a href="${pageContext.request.contextPath}/branch/addLectureRoom">등록</a>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>지점장</th>
			<th>강의실명</th>
			<th>수용인원</th>
			<th>수정일자</th>
			<th>수정</th>
			<th>삭제</th>
		</tr>
		<c:forEach var="room" items="${lectureRoomList}">
			<tr>
				<td>${room.lectureRoomId}</td>
				<td>${room.permissionId}</td>
				<td>${room.lectureRoomName}</td>
				<td>${room.lectureRoomCapacity}</td>
				<td>${room.lastUpdate}</td>
				<td><a href="${pageContext.request.contextPath}/branch/modifyLectureRoom?lectureRoomId=${room.lectureRoomId}&permissionId=${room.permissionId}&lectureRoomName=${room.lectureRoomName}&lectureRoomCapacity=${room.lectureRoomCapacity}"><button>수정</button></a></td>
				<td><a href="${pageContext.request.contextPath}/branch/removeLectureRoom?lectureRoomId=${room.lectureRoomId}"><button>삭제</button></a></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>