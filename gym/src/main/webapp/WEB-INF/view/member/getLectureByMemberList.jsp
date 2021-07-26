<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getLectureByMemberList</title>
</head>
<body>
	<h1>구매한 강좌 목록</h1>
	<div>
		<table border="1">
			<thead>
				<tr>
					<td>지점</td>
					<td>강좌이름</td>
					<td>강사이름</td>
					<td>구매날짜</td>
					<td>시작날짜</td>
					<td>종료날짜</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="l" items="${lectureByMemberList}">
					<tr>
						<td>${l.branchName}</td>
						<td>${l.lectureCategory}</td>
						<td>${l.memberName}</td>
						<td>${l.lastUpdate}</td>
						<td>${l.startDate}</td>
						<td>${l.endDate}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>