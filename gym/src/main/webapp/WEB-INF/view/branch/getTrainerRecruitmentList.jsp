<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TrainerRecruitment</title>
</head>
<body>
	<h1>강의실 목록</h1>
	
	<a href="${pageContext.request.contextPath}/branch/addTrainerRecruitment">등록</a>
	<table border="1">
		<tr>
			<th>강사지원 번호</th>
			<th>허가시청 번호</th>
			<th>입사일</th>
			<th>퇴사일</th>
			<th>수정</th>
			<th>삭제</th>
		</tr>
		<c:forEach var="t" items="${trainerRecruitmentList}">
			<tr>
				<td>${t.trainerApplicationId}</td>
				<td>${t.permissionId}</td>
				<td>${t.joinDate}</td>
				<td>${t.retireDate}</td>
				<td><a href="${pageContext.request.contextPath}/branch/modifyTrainerRecruitment?trainerApplicationId=${t.trainerApplicationId}"><button>수정</button></a></td>
				<td><a href="${pageContext.request.contextPath}/branch/removeTrainerRecruitment?trainerApplicationId=${t.trainerApplicationId}"><button>삭제</button></a></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>