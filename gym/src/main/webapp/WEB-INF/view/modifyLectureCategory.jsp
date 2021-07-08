<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MODIFY LECTURECATEGORY</title>
</head>
<body>
	<H1>강좌 카테고리 수정</H1>
	<form action="${pageContext.request.contextPath}/modifyLectureCategory" method="post">
		<input type="hidden" name="lectureCategoryId" value="${lectureCategoryOne.lectureCategoryId}">
		<table border="1">
			<tr>
				<td>
					강좌명
				</td>
				<td>
					<input type="text" name="lectureCategory" value="${lectureCategoryOne.lectureCategory}">
				</td>
			</tr>
		</table>
		<button type="submit">수정</button>
	</form>
</body>
</html>