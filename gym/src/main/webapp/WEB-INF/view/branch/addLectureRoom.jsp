<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addLectureRoom</title>
</head>
<body>
	<H1>강의실 등록</H1>
	
	<form action="${pageContext.request.contextPath}/branch/addLectureRoom" method="post">
		<table border="1">
			<tr>
				<td>
					지점명
				</td>
				<td>
					<select name="permissionId"> 
						<option value="">--선택--</option> 
						<c:forEach var="b" items="${branchNameList}"> 
							<option value="${b.permissionId}">${b.branchName}</option> 
						</c:forEach> 
					</select>
				</td>
			</tr>
			<tr>
				<td>
					강의실명
				</td>
				<td>
					<input type="text" name="lectureRoomName">
				</td>
			</tr>
			<tr>
				<td>
					수용인원
				</td>
				<td>
					<input type="text" name="lectureRoomCapacity">
				</td>
			</tr>
		</table>
		<button type="submit">등록</button>
	</form>
</body>
</html>