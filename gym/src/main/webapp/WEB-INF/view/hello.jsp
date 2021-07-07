<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<H1>득근득근화이팅 테스트샘플</H1>
	<c:if test="${loginAdmin == null}">
		<form action="${pageContext.request.contextPath}/getLoginAdmin" method="post">
			<div>	
				Mail :	<input type="text" name="adminMail">
			</div>
			<div>	
				Pw : 	<input type="password" name="adminPw">
			</div>
			<button type="submit">로그인</button>
		</form>
	</c:if>
	<c:if test="${loginAdmin != null}">
	테스트중 -> 로그인성공 : ${loginAdmin.adminName}님 <a href="${pageContext.request.contextPath}/logout">로그아웃</a>
	</c:if>
</body>
</html>