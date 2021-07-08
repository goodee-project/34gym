<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ADD LECTURECATEGORY</title>
</head>
<body>
	<H1>강좌 카테고리 등록</H1>
	<form action="${pageContext.request.contextPath}/addLectureCategory" method="post">
		<table border="1">
			<tr>
				<td>
					강좌명
				</td>
				<td>
					<input type="text" name="lectureCategory">
				</td>
			</tr>
		</table>
		<button type="submit">등록</button>
	</form>
</body>
</html>