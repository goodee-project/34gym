<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
$(document).ready(function(){
	let memberId = $('#memberId').val();
	$.ajax({
		type:'get',
		url:'${pageContext.request.contextPath}/checkLectureMember',
		data:{memberId : memberId},
		success: function(jsonData) {
			console.log(jsonData)
			if(jsonData != 0) {
				$('#writeBtn').append('<a href = "${pageContext.request.contextPath}/addReview?lectureMemberId='+jsonData+'"><button type="button">리뷰쓰기</button></a>');
			}
		}
	});
});

</script>
</head>
<body>
	<h1>리뷰게시판</h1>
	<jsp:include page="/WEB-INF/view/inc/memberNavBar.jsp"></jsp:include>
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
	<!-- 로그인 회원이 강좌회원일경우 리뷰작성 버튼 생성 -->
	<c:if test="${loginMember != null}">
		<input type="hidden" id = "memberId" value="${loginMember.memberId}">
		<div id = "writeBtn"></div>
	</c:if>
	<c:if test="${loginMember == null}">
		<input type="hidden" id = "memberId" value="0">
	</c:if>
	

</body>
</html>