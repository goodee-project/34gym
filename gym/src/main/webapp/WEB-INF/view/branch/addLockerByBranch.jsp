<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ADD LOCKER</title>
</head>
<body>
<H1>지점별 락커추가</H1>
	<form action="${pageContext.request.contextPath}/branch/addLockerByBranch" method="post">
		<table border="1">
			<tr>
				<td>
					지점선택
				</td>
				<td>
					<select name="permissionId">
						<option></option>
					</select>
				</td>
			</tr>
			<tr>
				<td>
					락커 수
				</td>
				<td>
					<input type="text" name="count">
				</td>
			</tr>
		</table>
		<button type="submit">등록</button>
	</form>
</body>
</html>