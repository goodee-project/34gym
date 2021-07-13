<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ADMIN LOGIN PAGE</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
$(document).ready(function(){
	$('#btn').click(function(){
		console.log('btn click');
		$('#loginForm').submit();
		console.log('submit');
	});
})
</script>
</head>
<body>
	<!-- mainMenu -->
	<jsp:include page="/WEB-INF/view/inc/mainMenu.jsp"></jsp:include>
	<H1>관리자 로그인</H1>
	<c:if test="${loginAdmin == null}">
		<form id="loginForm" action="${pageContext.request.contextPath}/admin/adminLogin" method="post">
			<table border="1">
				<tr>
					<td>
						Mail
					</td>
					<td>
						<input type="text" name="adminMail">
					</td>
				</tr>
				<tr>
					<td>
						Pw
					</td>
					<td>
						<input type="password" name="adminPw">
					</td>
				</tr>
			</table>
			<button id="btn" type="button">로그인</button>
		</form>
	</c:if>
	<c:if test="${loginAdmin != null}">
	테스트중 -> 로그인성공 : ${loginAdmin.adminName}님 <a href="${pageContext.request.contextPath}/admin/logout">로그아웃</a>
	<jsp:include page="/WEB-INF/view/inc/adminNavBar.jsp"></jsp:include>
	</c:if>
</body>
</html>