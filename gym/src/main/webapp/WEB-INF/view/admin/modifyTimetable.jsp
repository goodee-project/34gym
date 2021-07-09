<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MODIFY TIMETABLE</title>
</head>
<body>
	<H1>강좌 카테고리 수정</H1>
	<form action="${pageContext.request.contextPath}/admin/modifyTimetable" method="post">
		<input type="hidden" name="timetableId" value="${timetableOne.timetableId}">
		<table border="1">
			<tr>
				<td>
					요일
				</td>
				<td>
					<input type="text" name="timetableDay" value="${timetableOne.timetableDay}">
				</td>
			</tr>
			<tr>
				<td>
					교시
				</td>
				<td>
					<input type="text" name="timetablePeriod" value="${timetableOne.timetablePeriod}">
				</td>
			</tr>
		</table>
		<button type="submit">수정</button>
	</form>
</body>
</html>