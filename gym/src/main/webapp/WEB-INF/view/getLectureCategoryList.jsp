<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LectureCategoryList</title>
</head>
<body>
	<h1>강좌 카테고리</h1>
	
	<a href="${pageContext.request.contextPath}/addLectureCategory">등록</a>
	<table border="1">
		<tr>
			<th>lectureCategoryId</th>
			<th>lectureCategory</th>
			<th>lastUpdate</th>
			<th>수정</th>
			<th>삭제</th>
		</tr>
		<c:forEach var="l" items="${lectureCategoryList}">
			<tr>
				<td>${l.lectureCategoryId}</td>
				<td>${l.lectureCategory}</td>
				<td>${l.lastUpdate}</td>
				<td><a href="${pageContext.request.contextPath}/modifyLectureCategory?lectureCategoryId=${l.lectureCategoryId}"><button>수정</button></a></td>
				<td><a href="${pageContext.request.contextPath}/removeLectureCategory?lectureCategoryId=${l.lectureCategoryId}"><button>삭제</button></a></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>