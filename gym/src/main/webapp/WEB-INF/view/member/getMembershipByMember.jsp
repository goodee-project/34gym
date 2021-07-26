<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getMembershipByMember</title>
</head>
<body>
	<h1>구매한 운동이용권 목록</h1>
	<div>
		<table border="1">
			<thead>
				<tr>
					<td>지점</td>
					<td>기간(개월)</td>
					<td>구매날짜</td>
					<td>시작날짜</td>
					<td>종료날짜</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="m" items="${membershipByMemberList}">
					<tr>
						<td>${m.branchName}</td>
						<td>${m.membershipName}</td>
						<td>${m.soldDate}</td>
						<td>${m.startDate}</td>
						<td>${m.endDate}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>