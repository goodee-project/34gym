<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ADD TIMETABLE</title>
</head>
<body>
	<H1>강좌 시간표 등록</H1>
	<form action="${pageContext.request.contextPath}/admin/addTimetable" method="post">
		<table border="1">
			<tr>
				<td>
					요일
				</td>
				<td>
					<input type="text" name="timetableDay">
				</td>
			</tr>
			<tr>
				<td>
					시간
				</td>
				<td>
					<input type="text" name="timetablePeriod">
				</td>
			</tr>
		</table>
		<button type="submit">등록</button>
	</form>
</body>
</html>