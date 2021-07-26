<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
	<h1>구인뷰게시판</h1>
	<jsp:include page="/WEB-INF/view/inc/navBar.jsp"></jsp:include>
	<table border="1">
		<thead>
			<tr>
				<th>recruitId</th>
				<th>branchName</th>
				<th>recruitTitle</th>
				<th>memberName</th>
				<th>createDate</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="r" items="${recruitList}">
			<tr>
				<td>${r.recruitId}</td>
				<td>${r.branchName}</td>
				<td>
					<a href="${pageContext.request.contextPath}/getRecruitOne?recruitId=${r.recruitId}">${r.recruitTitle}</a>
				</td>
				<td>${r.memberName}</td>
				<td>${r.createDate}</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	<!-- 로그인 회원이 강좌회원일경우 리뷰작성 버튼 생성 -->
	<c:if test="${loginBranch != null}">
		<div>
			<a href = "${pageContext.request.contextPath}/addRecruit"><button type="button">게시물작성</button></a>
		</div>
	</c:if>
	

</body>
</html>