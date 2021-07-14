<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LectureRoomList</title>
</head>
<body>
	<!-- �޴� �׺���̼� �� -->
    <jsp:include page="/WEB-INF/view/inc/BranchNavBar.jsp"></jsp:include>
    
	<h1>���ǽ� ���</h1>
	
	<a href="${pageContext.request.contextPath}/branch/addLectureRoom">���</a>
	<table border="1">
		<tr>
			<th>��ȣ</th>
			<th>������</th>
			<th>���ǽǸ�</th>
			<th>�����ο�</th>
			<th>��������</th>
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
				<td><a href="${pageContext.request.contextPath}/branch/modifyLectureRoom?lectureRoomId=${room.lectureRoomId}&permissionId=${room.permissionId}&lectureRoomName=${room.lectureRoomName}&lectureRoomCapacity=${room.lectureRoomCapacity}"><button>����</button></a></td>
				<td><a href="${pageContext.request.contextPath}/branch/removeLectureRoom?lectureRoomId=${room.lectureRoomId}"><button>����</button></a></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>