<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MODIFY EMPLOYMENTTYPE</title>
</head>
<body>
	<H1>고용형태 수정</H1>
	<form action="${pageContext.request.contextPath}/admin/modifyEmploymentType" method="post">
		<input type="hidden" name="employmentTypeId" value="${employmentTypeOne.employmentTypeId}">
		<table border="1">
			<tr>
				<td>
					고용형태
				</td>
				<td>
					<input type="text" name="employmentType" value="${employmentTypeOne.employmentType}">
				</td>
			</tr>
		</table>
		<button type="submit">수정</button>
	</form>
</body>
</html>