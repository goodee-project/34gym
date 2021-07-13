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
	$('#submitBtn').click(function() {
		if($('#reviewTitle').val().length < 5){
			alert('제목은 5자 이상이어야 합니다.');
			$('#reviewTitle').focus();
		} else if($('#reviewContent').val().length < 10) {
			alert('내용은 10자 이상이어야 합니다');
			$('#reviewContent').focus();
		} else {
		     $('#modifyForm').submit();
		}
    });
});
</script>
</head>
<body>
	<h1>리뷰작성</h1>
	<form id ="modifyForm" action="${pageContext.request.contextPath}/modifyReview" method="post">
		<table border="1">
			<tr>
				<td>lectureMemberId</td>
				<td>
					<input type = "text" id = "lectureMemberId" name = "lectureMemberId" readonly="readonly" value="${lectureMemberId}" >
				</td>
			</tr>
			<tr>
				<td>reviewTitle</td>
				<td>
					<input type = "text" id = "reviewTitle" name = "reviewTitle" value="${reviewOne.reviewTitle}">
				</td>
			</tr>
			<tr>
				<td>reviewContent</td>
				<td>
					<textarea rows="8" cols="50" id = "reviewContent" name = "reviewContent">${reviewOne.reviewContent}</textarea>
				</td>
			</tr>
			<tr>
				<td>reviewScore</td>
				<td>
					<select name ="reviewScore" >
						<c:forEach var ="i" begin="1" end="5" >
							<c:if test="${i ==  reviewOne.reviewScore}">
								<option value="${i}" selected="selected">${i}</option>
							</c:if>
							<c:if test="${i !=  reviewOne.reviewScore}">
								<option value="${i}">${i}</option>
							</c:if>
						</c:forEach>
						
					</select>
				</td>
			</tr>
		</table>
		<button type="button" id = "submitBtn">작성완료</button>
	</form>
	
	<a href = "${pageContext.request.contextPath}/getReviewList"><button type="button">목록보기</button></a>

</body>
</html>