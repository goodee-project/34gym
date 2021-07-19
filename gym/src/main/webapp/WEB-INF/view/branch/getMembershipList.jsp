<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<<title>MembershipList</title>
</head>
<body>
	<!-- 메뉴 네비게이션 바 -->
    <jsp:include page="/WEB-INF/view/inc/BranchNavBar.jsp"></jsp:include>
    
	<h1>운동이용권 목록</h1>
	
	<a href="${pageContext.request.contextPath}/branch/addMembership"><button>운동이용권 등록</button></a>
	
	<table border="1">
		<tr>
			<th>운동이용권 번호</th>
			<th>지점명</th>
			<th>운동 1개월 비용</th>
			<th>판매날짜</th>
			<th>수정날짜</th>
			<th>수정</th>
		</tr>
		<c:forEach var="m" items="${membershipList}">
			<tr>
				<td>${m.membershipId}</td>
				<td>${m.branchName}</td>
				<td>${m.membershipPrice}</td>
				<td>${m.soldDate}</td>
				<td>${m.lastUpdate}</td>
				<td><a href="${pageContext.request.contextPath}/branch/modifyMembership?membershipId=${m.membershipId}"><button>수정</button></a></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>