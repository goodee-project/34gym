<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<<title>TrainerApplicationList</title>
</head>
<body>
	<!-- 메뉴 네비게이션 바 -->
    <jsp:include page="/WEB-INF/view/inc/BranchNavBar.jsp"></jsp:include>
    
	<h1>${loginBranch.branchName} 지점 강사지원 목록</h1>
	
	<table border="1">
		<tr>
			<th>강사지원 번호</th>
			<th>이름</th>
			<th>고용형태</th>
			<th>지원날짜</th>
			<th>수정일자</th>
		</tr>
		<c:forEach var="ta" items="${trainerApplicationList}">
			<tr>
				<td>${ta.trainerApplicationId}</td>
				<td><a href="${pageContext.request.contextPath}/branch/getTrainerApplicationOne?trainerApplicationId=${ta.trainerApplicationId}&permissionId=${permissionId}">${ta.memberName}</a></td>
				<td>${ta.employmentType}</td>
				<td>${ta.applyDate}</td>
				<td>${ta.lastUpdate}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>