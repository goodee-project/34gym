<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>리뷰게시판</h1>
	<table border="1">
		<thead>
			<tr>
				<th>reviewId</th>
				<th>lectureMemberId</th>
				<th>reviewTitle</th>
				<th>reviewScore</th>
				<th>createDate</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="r" items="${reviewList}">
			<tr>
				<td>${r.reviewId}</td>
				<td>${r.lectureMemberId}</td>
				<td>
					<a href="${pageContext.request.contextPath}/getReviewOne?reviewId=${r.reviewId}">${r.reviewTitle}</a>
				</td>
				<td>${r.reviewScore}</td>
				<td>${r.createDate}</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>

</body>
</html>