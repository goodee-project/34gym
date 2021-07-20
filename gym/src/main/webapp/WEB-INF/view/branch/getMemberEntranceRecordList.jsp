<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getMemberEntranceRecordList</title>
</head>
<body>
	<h1>회원 출입기록 목록</h1>
	<!-- 옵션으로 회원유형(강좌, 운동)을 선택해서 볼 수 있게 함 -->
	<form id="typeForm" action="${pageContext.request.contextPath}/branch/getMemberEntranceRecordList" method="get">
		<select name="memberType">
			<option value="">==선택==</option>
			<option value="membership">운동회원</option>
			<option value="lecture">강좌회원</option>
		</select>
		<button id="btn" type="submit">조회</button>
	</form>
	
	<table border="1">
		<tr>
			<th>회원이름</th>
			<th>회원유형</th>
			<th>입장시간</th>
			<th>퇴장시간</th>
		</tr>
		<c:forEach var="r" items="${recordList}">
			<tr>
				<td>${r.memberName}</td>
				<td>${r.memberType}</td>
				<td>${r.entranceTime}</td>
				<td>${r.exitTime}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>