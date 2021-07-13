<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addNotice</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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
		     $('#addForm').submit();
		}
    });
});
</script>
</head>
<body>
    <div class="container">
        <h1>공지사항 등록</h1>
        <form id="addForm" action="${pageContext.request.contextPath}/admin/addNotice" method="post">
            <table border="1">
            <tr>
               <td>공지사항 제목</td>
               <td>
                  <input type="text" name="noticeTitle" id="noticeTitle" class="form-control">
               </td>
            </tr>
            <tr>
               <td>공지사항 내용</td>
               <td>
                  <textarea name="noticeContent" id="noticeContent" rows="5" cols="80"></textarea>
               </td>
            </tr>
            </table>
            <div>
                <button class="btn btn-default" id="btn" type="button">등록</button>
                <button class="btn btn-default" type="reset">초기화</button>
                <a href="javascript:history.back()"><button class="btn btn-default">목록</button></a>
            </div>
        </form>
    </div>
</body>
</html>