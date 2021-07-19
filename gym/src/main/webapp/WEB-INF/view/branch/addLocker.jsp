<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ADD LOCKER</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
$(document).ready(function(){
	$('#btn').click(function(){
		
		if($('#count').val() == '') {
		} else {
		console.log('btn click');
		$('#insertForm').submit();
		console.log('submit');
		}
	});
})
</script>
</head>
<body>
<H1>락커 관리</H1>
	<div>
		현재 ${loginBranch.branchName} 락커 수 : ${branchLockerCnt}
	</div>
	<div>
		<a href="${pageContext.request.contextPath}/branch/removeLocker?permissionId=${loginBranch.permissionId}"><button>락커삭제</button></a>
	</div>
	<form id="insertForm" action="${pageContext.request.contextPath}/branch/addLocker" method="post">
		<table border="1">
			<tr>
				<td>
					 지점
				</td>
				<td>
					<input type="hidden" name="permissionId" value="${loginBranch.permissionId}">
					<input type="text" name="branchName" value="${loginBranch.branchName}" readonly="readonly">
				</td>
			</tr>
			<tr>
				<td>
					수량 입력
				</td>
				<td>
					<input id="count" type="text" name="count">
				</td>
			</tr>
		</table>
		<button id="btn" type="button">락커 등록</button>
	</form>
</body>
</html>