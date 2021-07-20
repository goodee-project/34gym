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
	<h1>리뷰게시판</h1>
	<jsp:include page="/WEB-INF/view/inc/memberNavBar.jsp"></jsp:include>
	<table border="1">
		<thead>
			<tr>
				<th>reviewId</th>
				<th>lectureName</th>
				<th>reviewTitle</th>
				<th>reviewScore</th>
				<th>memberName</th>
				<th>createDate</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="r" items="${reviewList}">
			<tr>
				<td>${r.reviewId}</td>
				<td>${r.lectureName}</td>
				<td>
					<a href="${pageContext.request.contextPath}/getReviewOne?reviewId=${r.reviewId}">${r.reviewTitle}</a>
				</td>
				<td>${r.reviewScore}</td>
				<td>${r.memberName}</td>
				<td>${r.createDate}</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	<!-- 로그인 회원이 강좌회원일경우 리뷰작성 버튼 생성 -->
	<c:if test="${lectureinfo.size() > 0}">
		<div>
			<a href = "${pageContext.request.contextPath}/addReview"><button type="button">리뷰쓰기</button></a>
		</div>
	</c:if>
	

</body>
</html>