<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mainMenu</title>
</head>
<body>
	<div>
		<ul>
			<li><a href="${pageContext.request.contextPath}/member/memberLogin">회원로그인</a></li>
			<li><a href="${pageContext.request.contextPath}/admin/adminLogin">관리자로그인</a></li>
		</ul>
	</div>
</body>
</html>