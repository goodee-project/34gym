<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addLectureRoom</title>
</head>
<body>
	<H1>���ǽ� ���</H1>
	
	<form action="${pageContext.request.contextPath}/branch/addLectureRoom" method="post">
		<table border="1">
			<tr>
				<td>
					������
				</td>
				<td>
					<input type="text" name="permissionId">
				</td>
			</tr>
			<tr>
				<td>
					���ǽǸ�
				</td>
				<td>
					<input type="text" name="lectureRoomName">
				</td>
			</tr>
			<tr>
				<td>
					�����ο�
				</td>
				<td>
					<input type="text" name="lectureRoomCapacity">
				</td>
			</tr>
		</table>
		<button type="submit">���</button>
	</form>
</body>
</html>