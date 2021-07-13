<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TIMETABLE LIST</title>
</head>
<body>
	<!-- 메뉴 네비게이션 바 -->
    <jsp:include page="/WEB-INF/view/inc/adminNavBar.jsp"></jsp:include>
	
	<h1>강좌 시간표 카테고리</h1>
	
	<a href="${pageContext.request.contextPath}/admin/addTimetable">등록</a>
	<table border="1">
		<tr>
			<th>timetableId</th>
			<th>timetableDay</th>
			<th>timetablePeriod</th>
			<th>lastUpdate</th>
			<th>수정</th>
			<th>삭제</th>
		</tr>
		<c:forEach var="t" items="${timetableList}">
			<tr>
				<td>${t.timetableId}</td>
				<td>${t.timetableDay}</td>
				<td>${t.timetablePeriod}</td>
				<td>${t.lastUpdate}</td>
				<td><a href="${pageContext.request.contextPath}/admin/modifyTimetable?timetableId=${t.timetableId}"><button>수정</button></a></td>
				<td><a href="${pageContext.request.contextPath}/admin/removeTimetable?timetableId=${t.timetableId}"><button>삭제</button></a></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>