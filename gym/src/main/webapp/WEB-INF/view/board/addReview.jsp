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
		if($('#lectureMemberId').val() == null) {
			alert('강좌를 선택하세요');
			$('#lectureName').focus();
		} else if($('#reviewTitle').val().length < 5){
			alert('제목은 5자 이상이어야 합니다.');
			$('#reviewTitle').focus();
		} else if($('#reviewContent').val().length < 10) {
			alert('내용은 10자 이상이어야 합니다');
			$('#reviewContent').focus();
		} else {
		     $('#addForm').submit();
		}
    });
});
</script>
</head>
<body>
	<h1>리뷰작성</h1>
	<form id ="addForm" action="${pageContext.request.contextPath}/addReview" method="post">
		<table border="1">
			<tr>
				<td>memberName</td>
				<td> 
					<input type = "text" readonly="readonly" value="${memberName}" > 
				</td>
			</tr>
			<tr>
				<td>lectureName</td>
				<td>
					<select name ="lectureMemberId" id ="lectureMemberId">
						<option>강좌선택</option>
					<c:forEach var = "l" items="${lectureInfo}" >
						<option value="${l.lectureMemberId}">${l.lectureName}</option>
					</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td>reviewTitle</td>
				<td>
					<input type = "text" id = "reviewTitle" name = "reviewTitle">
				</td>
			</tr>
			<tr>
				<td>reviewContent</td>
				<td>
					<textarea rows="8" cols="50" id = "reviewContent" name = "reviewContent"></textarea>
				</td>
			</tr>
			<tr>
				<td>reviewScore</td>
				<td>
					<select name ="reviewScore" >
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
					</select>
				</td>
			</tr>
		</table>
		<button type="button" id = "submitBtn">작성완료</button>
	</form>
	
	<a href = "${pageContext.request.contextPath}/getReviewList"><button type="button">목록보기</button></a>

</body>
</html>