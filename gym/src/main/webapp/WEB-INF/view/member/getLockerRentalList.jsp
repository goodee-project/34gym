<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Rental List</title>
</head>
<body>
	<H1>락커 대여</H1>
	<table border="1">
		<tr>
		<c:forEach var="l" items="${lockerRentalCheckList}">
			<c:if test="${l.Ck == 'O'}">	
				<c:set var="i" value="${i + 1}" />
					<td><button>${l.lockerNumber}</button></td>
				<c:if test="${i%15 == 0 }">
				    </tr><tr>
				</c:if>
			</c:if>
			<c:if test="${l.Ck == 'X'}">	
				<c:set var="i" value="${i + 1}" />
					<td><button disabled="disabled">${l.lockerNumber}</button></td>
				<c:if test="${i%15 == 0 }">
				    </tr><tr>
				</c:if>
			</c:if>
		</c:forEach>
	</table>
</body>
</html>