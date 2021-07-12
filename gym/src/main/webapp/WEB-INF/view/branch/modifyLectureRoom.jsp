<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MODIFY LECTUREROOM</title>
</head>
<body>
	<H1>강의실 수정</H1>
	
	<form action="${pageContext.request.contextPath}/branch/modifyLectureRoom" method="post">
		<input type="hidden" name="lectureRoomId" value="${lectureRoomId}">
		<table border="1">
			<tr>
				<td>
					지점장
				</td>
				<td>
					<input type="text" name="permissionId" value="${permissionId}">
				</td>
			</tr>
			<tr>
				<td>
					강의실명
				</td>
				<td>
					<input type="text" name="lectureRoomName" value="${lectureRoomName}">
				</td>
			</tr>
			<tr>
				<td>
					수용인원
				</td>
				<td>
					<input type="text" name="lectureRoomCapacity" value="${lectureRoomCapacity}">
				</td>
			</tr>
		</table>
		<button type="submit">수정</button>
	</form>
</body>
</html>