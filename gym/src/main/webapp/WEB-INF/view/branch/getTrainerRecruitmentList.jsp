<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TrainerRecruitment</title>
</head>
<body>
	<!-- 메뉴 네비게이션 바 -->
    <jsp:include page="/WEB-INF/view/inc/BranchNavBar.jsp"></jsp:include>
    
	<h1>강사 채용 목록</h1>
	
	<table border="1">
		<tr>
			<th>강사지원 번호</th>
			<th>지점명</th>
			<th>분야</th>
			<th>이름</th>
			<th>입사일</th>
			<th>퇴사일</th>
			<th>수정</th>
			<th>삭제</th>
		</tr>
		<c:forEach var="t" items="${trainerRecruitmentList}">
			<tr>
				<td>${t.trainerApplicationId}</td>
				<td>${t.branchName}</td>
				<td>${t.type}</td>
				<td>${t.memberName}</td>
				<td>${t.joinDate}</td>
				<td>${t.retireDate}</td>
				<td><a href="${pageContext.request.contextPath}/branch/modifyTrainerRecruitment?trainerApplicationId=${t.trainerApplicationId}"><button>수정</button></a></td>
				<td><a href="${pageContext.request.contextPath}/branch/removeTrainerRecruitment?trainerApplicationId=${t.trainerApplicationId}"><button>삭제</button></a></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>