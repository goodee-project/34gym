<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MODIFY LECTUREROOM</title>
</head>
<body>
	<!-- 메뉴 네비게이션 바 -->
    <jsp:include page="/WEB-INF/view/inc/BranchNavBar.jsp"></jsp:include>
    
	<H1>강의실 수정</H1>
	
	<form action="${pageContext.request.contextPath}/branch/modifyLectureRoom" method="post">
		<input type="hidden" name="lectureRoomId" value="${lectureRoomId}">
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