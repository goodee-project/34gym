<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>QnA</h1>
	<table border="1">
		<tr>
			<td>QnAId</td>
			<td>${QnAOne.qnaId}</td>
		</tr>
		<tr>
			<td>QnATitle</td>
			<td>${QnAOne.qnaTitle}</td>
		</tr>
		<tr>
			<td>memberName</td>
			<td>${QnAOne.memberName}</td>
		</tr>
		<tr>
			<td>QnAContent</td>
			<td>${QnAOne.qnaContent}</td>
		</tr>
		<tr>
			<td>createDate</td>
			<td>${QnAOne.createDate}</td>
		</tr>
		<tr>
			<td>lastUpdate</td>
			<td>${QnAOne.lastUpdate}</td>
		</tr>
	</table>
	<!-- 로그인 회원이 강좌회원일경우 리뷰수정 버튼 생성 -->
	<c:if test="${loginMember.memberId == QnAOne.memberId}">
		<div>
			<a href = "${pageContext.request.contextPath}/modifyQnA?qnaId=${QnAOne.qnaId}"><button type="button">Q&A수정</button></a>
		</div>
		<div>
			<form action="${pageContext.request.contextPath}/removeQnA" method="post">
				<input type="hidden" name = "qnaId" value = "${QnAOne.qnaId}">
				<button type="submit">Q&A삭제</button>
			</form>
		</div>
	</c:if>
	<a href = "${pageContext.request.contextPath}/getQnAList"><button type="button">목록보기</button></a>
	<h3>댓글</h3>
	<c:forEach var="c" items="${QnACommentList}">
		<div>
			<div>
				<span>${c.memberName}</span>
			</div>
			<div>
				<span>${c.qnaComment}</span>
			</div>
			<c:if test="${c.memberId == loginMember.memberId}">
				<div>
					<button type="button" id = >
				</div>
			</c:if>
		</div>
	</c:forEach>
</body>
</html>