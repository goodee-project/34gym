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
	$.ajax({
		type:'get',
		url:'${pageContext.request.contextPath}/getReviewLike',
		data:{reviewId : ${reviewOne.reviewId}},
		success: function(jsonData) {
			$('#likeCount').append(jsonData);
		}
	});
	
	$('#likeBtn').click(function() {
		var memberId = $('#memberId').val();
		$.ajax({
			type:'get',
			url:'${pageContext.request.contextPath}/toggleReviewLike',
			data:{reviewId : ${reviewOne.reviewId}, memberId : memberId},
			success: function() {
				$('#likeCount').empty();
				$.ajax({
					type:'get',
					url:'${pageContext.request.contextPath}/getReviewLike',
					data:{reviewId : ${reviewOne.reviewId}},
					success: function(jsonData) {
						$('#likeCount').append(jsonData);
					}
				});
			}
		});
    });
});
</script>
</head>
<body>
	<h1>리뷰</h1>
	<table border="1">
		<tr>
			<td>reviewId</td>
			<td>${reviewOne.reviewId}</td>
		</tr>
		<tr>
			<td>lectureName</td>
			<td>${reviewOne.lectureName}</td>
		</tr>
		<tr>
			<td>memberName</td>
			<td>${reviewOne.memberName}</td>
		</tr>
		<tr>
			<td>reviewTitle</td>
			<td>${reviewOne.reviewTitle}</td>
		</tr>
		<tr>
			<td>reviewContent</td>
			<td>${reviewOne.reviewContent}</td>
		</tr>
		<tr>
			<td>reviewScore</td>
			<td>${reviewOne.reviewScore}</td>
		</tr>
		<tr>
			<td>createDate</td>
			<td>${reviewOne.createDate}</td>
		</tr>
		<tr>
			<!-- 로그인일경우에만 좋아요 클릭가능 -->
			<c:if test="${loginMember != null}">
				<td>
					<input type="hidden" id = "memberId" value="${loginMember.memberId}">
					<button type = "button" id = "likeBtn">좋아요</button>
				</td>
			</c:if>
			<c:if test="${loginMember == null}">
				
				<td>
					<input type="hidden" id = "memberId" value="0">
					좋아요
				</td>
			</c:if>
			<td id ="likeCount"></td>
		</tr>
	</table>
	<!-- 로그인 회원이 강좌회원일경우 리뷰수정 버튼 생성 -->
	<c:if test="${loginMember.memberId == reviewOne.memberId}">
		<input type="hidden" id = "memberId" value="${loginMember.memberId}">
		<div id = "modifyBtn">
			<a href = "${pageContext.request.contextPath}/modifyReview?reviewId=${reviewOne.reviewId}"><button type="button">리뷰수정</button></a>
		</div>
		<div>
			<form action="${pageContext.request.contextPath}/removeReview" method="post">
				<input type="hidden" name = "reviewId" value = "${reviewOne.reviewId}">
				<button type="submit">리뷰삭제</button>
			</form>
		</div>
	</c:if>
	<a href = "${pageContext.request.contextPath}/getReviewList"><button type="button">목록보기</button></a>

</body>
</html>