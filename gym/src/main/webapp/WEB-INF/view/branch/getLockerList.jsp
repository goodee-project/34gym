<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GET LOCKER LIST</title>
</head>
<body>
	<h1>라커 목록</h1>
	<a href="${pageContext.request.contextPath}/branch/addLocker">지점별 라커추가</a>
	<table border="1">
		<tr>
			<td>lockerId</td>
			<td>permissionId</td>
			<td>lockerNumber</td>
			<td>lastUpdate</td>
		</tr>
		<c:forEach var="l" items="${lockerList}">
			<tr>
				<td>${l.lockerId}</td>
				<td>${l.permissionId}</td>
				<td>${l.lockerNumber}</td>
				<td>${l.lastUpdate}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>