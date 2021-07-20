<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>QnA게시판</h1>
	<jsp:include page="/WEB-INF/view/inc/memberNavBar.jsp"></jsp:include>
	<table border="1">
		<thead>
			<tr>
				<th>QnAId</th>
				<th>QnATitle</th>
				<th>memberName</th>
				<th>createDate</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="q" items="${QnAList}">
			<tr>
				<td>${q.qnaId}</td>
				<td>
					<a href="${pageContext.request.contextPath}/getQnAOne?qnaId=${q.qnaId}">${q.qnaTitle}</a>
				</td>
				<td>${q.memberName}</td>
				<td>${q.createDate}</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	<!-- 로그인 회원이 강좌회원일경우 리뷰작성 버튼 생성 -->
	<c:if test="${loginMember != null || lectureinfo.size() > 0}">
		<div>
			<a href = "${pageContext.request.contextPath}/addQnA"><button type="button">QnA쓰기</button></a>
		</div>
	</c:if>
	
</body>
</html>