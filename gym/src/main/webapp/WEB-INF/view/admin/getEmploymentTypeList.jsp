<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EmploymentTypeList</title>
</head>
<body>
	<h1>고용형태(카테고리)</h1>
	
	<a href="${pageContext.request.contextPath}/admin/addEmploymentType">등록</a>
	<table border="1">
		<tr>
			<th>employmentTypeId</th>
			<th>employmentType</th>
			<th>lastUpdate</th>
			<th>수정</th>
			<th>삭제</th>
		</tr>
		<c:forEach var="e" items="${employmentTypeList}">
			<tr>
				<td>${e.employmentTypeId}</td>
				<td>${e.employmentType}</td>
				<td>${e.lastUpdate}</td>
				<td><a href="${pageContext.request.contextPath}/admin/modifyEmploymentType?employmentTypeId=${e.employmentTypeId}"><button>수정</button></a></td>
				<td><a href="${pageContext.request.contextPath}/admin/removeEmploymentType?employmentTypeId=${e.employmentTypeId}"><button>삭제</button></a></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>