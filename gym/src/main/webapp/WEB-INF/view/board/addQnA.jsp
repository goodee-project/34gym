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
		if($('#qnaTitle').val().length < 5){
			alert('제목은 5자 이상이어야 합니다.');
			$('#qnaTitle').focus();
		} else if($('#qnaContent').val().length < 10) {
			alert('내용은 10자 이상이어야 합니다');
			$('#qnaContent').focus();
		} else {
		     $('#addForm').submit();
		}
    });
});
</script>
</head>
<body>
	<h1>QnA작성</h1>
	<form id ="addForm" action="${pageContext.request.contextPath}/addQnA" method="post">
		<input type = "hidden" value="${loginMember.memberId}" name = "memberId"> 
		<table border="1">
			<tr>
				<td>memberName</td>
				<td> 
					<input type = "text" readonly="readonly" value="${loginMember.memberName}" > 
				</td>
			</tr>
			<tr>
				<td>Q&ATitle</td>
				<td>
					<input type = "text" id = "qnaTitle" name = "qnaTitle">
				</td>
			</tr>
			<tr>
				<td>Q&AContent</td>
				<td>
					<textarea rows="8" cols="50" id = "qnaContent" name = "qnaContent"></textarea>
				</td>
			</tr>
		</table>
		<button type="button" id = "submitBtn">작성완료</button>
	</form>
	
	<a href = "${pageContext.request.contextPath}/getQnAList"><button type="button">목록보기</button></a>

</body>
</html>