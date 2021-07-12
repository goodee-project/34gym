<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>����</h1>
	<table border="1">
		<tr>
			<td>reviewId</td>
			<td>${reviewOne.reviewId}</td>
		</tr>
		<tr>
			<td>lectureMemberId</td>
			<td>${reviewOne.lectureMemberId}</td>
		</tr>
		<tr>
			<td>reviewTitle</td>
			<td>${reviewOne.reviewTitle}</td>
		</tr>
		<tr>
			<td>reviewContent</td>
			<td>${reviewOne.reviewContent}</td>
		</tr>
		<tr>
			<td>reviewScore</td>
			<td>${reviewOne.reviewScore}</td>
		</tr>
		<tr>
			<td>createDate</td>
			<td>${reviewOne.createDate}</td>
		</tr>
		<tr>
			<td>reviewId</td>
			<td>${reviewOne.reviewId}</td>
		</tr>
		<tr>
			<!-- �α����ϰ�쿡�� ���ƿ� Ŭ������ -->
			<c:if test="${loginAdmin != null}">
				<td>
					<button type = "button">���ƿ�</button>
				</td>
			</c:if>
			<c:if test="${loginAdmin == null}">
				<td>���ƿ�</td>
			</c:if>
			<td>${reviewLikeCount}</td>
		</tr>
	</table>

</body>
</html>