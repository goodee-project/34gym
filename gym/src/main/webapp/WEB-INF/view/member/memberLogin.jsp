<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberLogin</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		console.log("document ready!");
		$('#memberloginBtn').click(function(){
			console.log("btn click!");
			
			// 폼 유효성 검사
			$('#memberLoginForm').submit();
		});
	});
</script>
</head>
<body>
	<!-- mainMenu -->
	<jsp:include page="/WEB-INF/view/inc/mainMenu.jsp"></jsp:include>
	<h1>로그인</h1>
	<c:if test="${loginMember==null}">
		<form id="memberLoginForm" action="${pageContext.request.contextPath}/memberLogin" method="post">
			<table border="1">
				<tr>
					<td>Email : <input type="email" name="memberMail" id="memberMail"></td>
				</tr>
				<tr>
					<td>Password : <input type="password" name="memberPw" id="memberPw"></td>
				</tr>
			</table>
			<button type="button" id="memberloginBtn">로그인</button>
		</form>
		<a class="btn btn-default" href="${pageContext.request.contextPath}/member/addMember">회원 가입</a>
	</c:if>
	
	<c:if test="${loginMember!=null}">
		로그인 테스트
		<a href="${pageContext.request.contextPath}/memberLogout"><button type="button">로그아웃</button></a>
	</c:if>
</body>
</html>