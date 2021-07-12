<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>LectureRoomList</title>
</head>
<body>
	<h1>강의실 목록</h1>
	
	<a href="${pageContext.request.contextPath}/admin/addLectureRoom">등록</a>
	<table border="1">
		<tr>
			<th>lectureRoomId</th>
			<th>permissionId</th>
			<th>lectureRoomName</th>
			<th>lectureRoomCapacity</th>
			<th>lastUpdate</th>
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
				<td><a href="${pageContext.request.contextPath}/admin/modifyLectureRoom?lectureRoomId=${room.lectureRoomId}"><button>수정</button></a></td>
				<td><a href="${pageContext.request.contextPath}/admin/removeLectureRoom?lectureRoomId=${room.lectureRoomId}"><button>삭제</button></a></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>