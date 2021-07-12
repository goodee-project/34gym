<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MODIFY ADMIN</title>
</head>
<body>
	<H1>관리자 수정</H1>
	<form action="${pageContext.request.contextPath}/admin/modifyAdmin" method="post">
		<table border="1">
			<tr>
				<td>
					이름
				</td>
				<td>
					<input type="hidden" name="adminId" value="${adminOne.adminId}">
					<input type="text" name="adminName" value="${adminOne.adminName}">
				</td>
			</tr>
			<tr>
				<td>
					메일
				</td>
				<td>
					<input type="text" name="adminMail" value="${adminOne.adminMail}">
				</td>
			</tr>
			<tr>
				<td>
					비밀번호
				</td>
				<td>
					<input type="password" name="adminPw" value="${adminOne.adminPw}">
				</td>
			</tr>
			<tr>
				<td>
					주소
				</td>
				<td>
					<input type="text" name="adminAddress" value="${adminOne.adminAddress}">
				</td>
			</tr>
			<tr>
				<td>
					전화번호
				</td>
				<td>
					<input type="text" name="adminPhone" value="${adminOne.adminPhone}">
				</td>
			</tr>
		</table>
		<button type="submit">수정</button>
	</form>
</body>
</html>