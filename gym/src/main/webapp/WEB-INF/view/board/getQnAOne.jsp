<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
$(document).ready(function(){
	//댓글 10자 미만 입력시 경고창 팝업

	$('#submitQnAComment').click(function() {
		if($('#qnaCommentContent').val().length < 10) {
			alert('댓글 10자 이상 입력하세요');
			$('#qnaCommentContent').focus();
		} else {
		     $('#QnACommentForm').submit();
		}
    });
	
	//댓글삭제 눌렀을경우 데이터베이스 삭제 후 태그 삭제
	$(document).on('click','.deleteBtn',function(){
		let btn = $(this);
		let btnArea = btn.parent();
		let commentArea = btn.parent().parent();
		let commentId = btn.parent().prev().prev().val();
		$.ajax({
			type:'get',
			url:'${pageContext.request.contextPath}/removeQnAComment',
			data:{commentId : commentId},
			success: function() {
				commentArea.remove();
			}
		});
		
	});
	//댓글 수정버튼 클릭시 수정폼으로 변경
	$(document).on('click','.modifyBtn',function(){
		let btn = $(this);
		let btnArea = btn.parent();
		let commentContentArea = btn.parent().prev().children();
		let commentId = btn.parent().prev().prev().val();
		let commentContent = btn.parent().prev().children().text();
		commentContentArea.empty();
		commentContentArea.append('<textarea rows="5" cols="50" class = "modifyContent">'+commentContent+'</textarea>');
		btnArea.empty();
		btnArea.append('<button type="button" class = "modifyFinish">수정완료</button>');
		btnArea.append('<button type="button" class = "modifyCancle">취소</button>');
		//댓글 수정 완료시 비동기 업데이트
		$(document).on('click','.modifyFinish',function(){
			let commentContent = $('.modifyContent').val();
			$.ajax({
				type:'get',
				url:'${pageContext.request.contextPath}/modifyQnAComment',
				data:{commentId : commentId, commentContent : commentContent},
				success: function(data) {
					commentContentArea.empty();
					commentContentArea.append('<span id = "commentContent">'+data+'</span>');
					btnArea.empty();
					btnArea.append('<button type="button" class = "modifyBtn">수정</button>');
					btnArea.append('<button type="button" class = "deleteBtn">삭제</button>');
				}
			});
	    });		
		//댓글 수정 취소 눌렀을경우 원상복귀
		$(document).on('click','.modifyCancle',function(){
			commentContentArea.empty();
			commentContentArea.append(commentContent);
			btnArea.empty();
			btnArea.append('<button type="button" class = "modifyBtn">수정</button>');
			btnArea.append('<button type="button" class = "deleteBtn">삭제</button>');
		});
	});
});
</script>
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
	<!-- 로그인 회원이 글쓴이일경우 수정 버튼 생성 -->
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
	<c:if test="${loginMember != null}">
		<h5>댓글작성</h5>
		<form action="${pageContext.request.contextPath}/addQnAComment" method ="post" id ="QnACommentForm">
			<input type="hidden" name="qnaId" value = "${QnAOne.qnaId}">
			<input type="hidden" name="memberId" value = "${loginMember.memberId}">
			<div>
				<input type="text" readonly="readonly" name="memberName" value="${loginMember.memberName}">
			</div>
			<div>
				<textarea rows="5" cols="50" name = "qnaComment" id="qnaCommentContent" placeholder="댓글을 입력하세요"></textarea>
			</div>
			<button type="button" id="submitQnAComment">작성완료</button>
		</form>
	</c:if>
	<c:forEach var="c" items="${QnACommentList}">
		
		<div class ="commentArea">
			<div>
				<span>${c.memberName}</span>
			</div>
			<input type="hidden" name = "commentId" value="${c.commentId}">
			<div class = "test2">
				<span id = "commentContent">${c.qnaComment}</span>
			</div>
			<c:if test="${c.memberId == loginMember.memberId}">
				<div class="btnArea">
					<button type="button" class = "modifyBtn">수정</button>
					<button type="button" class = "deleteBtn">삭제</button>
				</div>
			</c:if>
		</div>
	</c:forEach>
</body>
</html>