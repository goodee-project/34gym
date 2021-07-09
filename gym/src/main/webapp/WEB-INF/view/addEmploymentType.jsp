<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ADD EMPLOYMENTTYPE</title>
</head>
<body>
	<H1>고용형태 등록</H1>
	<form action="${pageContext.request.contextPath}/addEmploymentType" method="post">
		<table border="1">
			<tr>
				<td>
					고용형태
				</td>
				<td>
					<input type="text" name="employmentType">
				</td>
			</tr>
		</table>
		<button type="submit">등록</button>
	</form>
</body>
</html>