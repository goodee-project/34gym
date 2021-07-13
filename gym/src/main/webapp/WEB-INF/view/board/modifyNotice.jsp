<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modifyNotice</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script>
$(document).ready(function() {
    $('#btn').click(function() {
		if($('#noticeTitle').val() == ''){
			alert('제목을 입력하세요.');
			$('#noticeTitle').focus();
		} else if($('#noticeContent').val() == '') {
			alert('내용을 입력하세요.');
			$('#noticeContent').focus();
		} else {
		     $('#modifyForm').submit();
		}
    });
});
</script>
</head>
<body>
	<form id="modifyForm" action="${pageContext.request.contextPath}/admin/modifyNotice" method="post">
		<table border="1">
			<tr>
			    <th>noticeID</th>
			    <td>
			    	<input type="text" id="noticeId" name="noticeId" value="${noticeOne.noticeId}" readonly/>
			    </td>
			</tr>
			<tr>
				<th>관리자ID</th>
			    <td>
			    	<input type="text" id="adminId" name="adminId" value="${noticeOne.adminId}" readonly/>
			    </td>
			</tr>
			<tr>
				<th>제목</th>
				<td>
					<input type="text" id="noticeTitle" name="noticeTitle" value="${noticeOne.noticeTitle}"/>
				</td>
			<tr>
				<th>내용</th>
				<td>
					<textarea id="noticeContent" name="noticeContent">${noticeOne.noticeContent}</textarea>
				</td>
			</tr>
			<tr>
				<th>게시날짜</th>
				<td>
					<input type="text" id="createDate" name="createDate" value="${noticeOne.createDate}" readonly/>
				</td>
			</tr>
	    </table>
	    <div>
	        <button class="btn btn-default" type="button" id="btn">수정</button>
	        <button class="btn btn-default" type="reset">초기화</button>
	        <a href="javascript:history.back()"><button class="btn btn-default">뒤로</button></a>
	    </div>
    </form>
</body>
</html>