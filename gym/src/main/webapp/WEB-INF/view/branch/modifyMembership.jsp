<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Modify Membership</title>
</head>
<body>
	<!-- 메뉴 네비게이션 바 -->
    <jsp:include page="/WEB-INF/view/inc/BranchNavBar.jsp"></jsp:include>
    
	<H1>운동이용권 수정</H1>
	
	<form action="${pageContext.request.contextPath}/branch/modifyMembership" method="post">
		<input type="hidden" name="membershipId" value="${membershipId}">
		<table border="1">
			<tr>
				<td>
					판매날짜
				</td>
				<td>
					<input type="text" name="soldDate" value="${soldDate}">
				</td>
			</tr>
		</table>
		<button type="submit">수정</button>
	</form>
</body>
</html>