<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>건물등록 조회</title>
</head>
<body>
	<h1>건물등록 조회</h1>
	<div>
		<a class="btn btn-default" href="${pageContext.request.contextPath}/member/addBuildingForm?memberId=${memberId}&memberName=${memberName}">건물 등록</a>
		<table border="1">
			<thead>
				<tr>
					<td>건물ID</td>
					<td>주소</td>
					<td>등록날짜</td>
					<td>취소</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="b" items="${buildingList}">
					<tr>
						<td>${b.buildingId}</td>
						<td>${b.buildingAddress}&nbsp;${b.buildingDetail}</td>
						<td>${b.createDate}</td>
						<td><a class="btn btn-default" href="${pageContext.request.contextPath}/removeBuilding?buildingId=${b.buildingId}">등록 취소</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>