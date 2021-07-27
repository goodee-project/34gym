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
		if($('#recruitTitle').val().length < 5){
			alert('제목은 5자 이상이어야 합니다.');
			$('#recruitTitle').focus();
		} else if($('#recruitContent').val().length < 10) {
			alert('내용은 10자 이상이어야 합니다');
			$('#recruitContent').focus();
		} else {
		     $('#addForm').submit();
		}
    });
});
</script>
</head>
<body>
	<h1>recruit작성</h1>
	<form id ="addForm" action="${pageContext.request.contextPath}/addRecruit" method="post">
		<table border="1">
			<tr>
				<td>branchName</td>
				<td> 
					<input type = "text" readonly="readonly" value="${loginBranch.branchName}" name = "branchName"> 
				</td>
			</tr>
			<tr>
				<td>recruitTitle</td>
				<td>
					<input type = "text" id = "recruitTitle" name = "recruitTitle">
				</td>
			</tr>
			<tr>
				<td>recruitContent</td>
				<td>
					<textarea rows="8" cols="50" id = "recruitContent" name = "recruitContent"></textarea>
				</td>
			</tr>
			<tr>
				<td>memberName</td>
				<td>
					<input type = "text" readonly="readonly" value="${loginBranch.memberName}" name = "memberName">
				</td>
			</tr>
		</table>
		<button type="button" id = "submitBtn">작성완료</button>
	</form>
	
	<a href = "${pageContext.request.contextPath}/getRecruitList"><button type="button">목록보기</button></a>

</body>
</html>