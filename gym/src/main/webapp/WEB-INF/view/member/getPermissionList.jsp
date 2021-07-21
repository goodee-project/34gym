<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getPermissionList</title>
</head>
<body>
	<h1>지점신청 조회</h1>
	<div>
		<a href="${pageContext.request.contextPath}/member/addPermissionForm?memberId=${memberId}&memberName=${memberName}">건물 등록</a>
		<table border="1">
			<thead>
				<tr>
					<td>지점신청ID</td>
					<td>건물ID</td>
					<td>계약조건ID</td>
					<td>설명</td>
					<td>신청일자</td>
					<td>상태</td>
					<td>취소</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="p" items="${permissionList}">
					<tr>
						<td>${p.permissionId}</td>
						<td>${p.buildingId}</td>
						<td>${p.contractId}</td>
						<td>${p.description}</td>
						<td>${p.createDate}</td>
						<td>
							<c:if test="${p.permissionLevel == 0}">
								대기
							</c:if>
							<c:if test="${p.permissionLevel == 1}">
								거부
							</c:if>
							<c:if test="${p.permissionLevel == 2}">
								승인
							</c:if>
						</td>
						<td>
							<c:if test="${p.permissionLevel == 0}">
								<a href="">취소</a>
							</c:if>
							<c:if test="${p.permissionLevel != 0}">
								
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>