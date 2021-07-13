<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getLectureMemberEntranceRecordList</title>
</head>
<body>
	<h1>강좌회원 출입기록 목록</h1>
	
	<table border="1">
		<tr>
			<th>출입기록ID</th>
			<th>강좌회원ID</th>
			<th>지점ID</th>
			<th>입장시간</th>
			<th>퇴장시간</th>
		</tr>
		<c:forEach var="r" items="${recordList}">
			<tr>
				<td>${r.lectureMemberEntranceRecordId}</td>
				<td>${r.lectureMemberId}</td>
				<td>${r.permissionId}</td>
				<td>${r.entranceTime}</td>
				<td>${r.exitTime}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>