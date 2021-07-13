<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ADMIN LIST</title>
</head>
<body>
	<!-- 메뉴 네비게이션 바 -->
    <jsp:include page="/WEB-INF/view/inc/adminNavBar.jsp"></jsp:include>
	<h1>관리자 목록</h1>
	<a href="${pageContext.request.contextPath}/admin/addAdmin">관리자 등록</a>
	<table border="1">
		<tr>
			<th>adminId</th>
			<th>adminName</th>
			<th>adminMail</th>
			<th>adminAddress</th>
			<th>adminPhone</th>
			<th>createDate</th>
			<th>lastUpdate</th>
			<th>수정</th>
			<th>삭제</th>
		</tr>
		<c:forEach var="a" items="${adminList}">
			<tr>
				<td>${a.adminId}</td>
				<td>${a.adminName}</td>
				<td>${a.adminMail}</td>
				<td>${a.adminAddress}</td>
				<td>${a.adminPhone}</td>
				<td>${a.createDate}</td>
				<td>${a.lastUpdate}</td>
				<td><a href="${pageContext.request.contextPath}/admin/modifyAdmin?adminId=${a.adminId}"><button>수정</button></a></td>
				<td><a href="${pageContext.request.contextPath}/admin/removeAdmin?adminId=${a.adminId}"><button>삭제</button></a></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>