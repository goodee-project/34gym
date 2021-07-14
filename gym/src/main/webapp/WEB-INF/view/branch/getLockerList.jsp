<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GET LOCKER LIST</title>
</head>
<body>
	<h1>${loginBranch.branchName} 락커 목록</h1>
	<a href="${pageContext.request.contextPath}/branch/addLocker">락커 추가</a>
	<table border="1">
		<tr>
		<c:forEach var="l" items="${lockerList}">
			<c:set var="i" value="${i + 1}" />
				<td>${l.lockerNumber}</td>
			<c:if test="${i%15 == 0 }">
			    </tr><tr>
			</c:if>
		</c:forEach>
	</table>
</body>
</html>