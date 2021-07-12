<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>LectureRoomList</title>
</head>
<body>
	<h1>���ǽ� ���</h1>
	
	<a href="${pageContext.request.contextPath}/admin/addLectureRoom">���</a>
	<table border="1">
		<tr>
			<th>lectureRoomId</th>
			<th>permissionId</th>
			<th>lectureRoomName</th>
			<th>lectureRoomCapacity</th>
			<th>lastUpdate</th>
			<th>����</th>
			<th>����</th>
		</tr>
		<c:forEach var="room" items="${lectureRoomList}">
			<tr>
				<td>${room.lectureRoomId}</td>
				<td>${room.permissionId}</td>
				<td>${room.lectureRoomName}</td>
				<td>${room.lectureRoomCapacity}</td>
				<td>${room.lastUpdate}</td>
				<td><a href="${pageContext.request.contextPath}/admin/modifyLectureRoom?lectureRoomId=${room.lectureRoomId}"><button>����</button></a></td>
				<td><a href="${pageContext.request.contextPath}/admin/removeLectureRoom?lectureRoomId=${room.lectureRoomId}"><button>����</button></a></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>