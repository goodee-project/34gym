<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="Gym Template">
<meta name="keywords" content="Gym, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<title>Insert title here</title>

<!-- Google Font -->
<link href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Oswald:300,400,500,600,700&display=swap" rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/flaticon.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/barfiller.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/magnific-popup.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css">
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
		commentContentArea.append('<textarea rows="5" cols="50" class = "modifyContent primary-btn">'+commentContent+'</textarea>');
		btnArea.empty();
		btnArea.append('<button type="button" class = "modifyFinish primary-btn">수정완료</button>');
		btnArea.append('<button type="button" class = "modifyCancle primary-btn">취소</button>');
		//댓글 수정 완료시 비동기 업데이트
		$(document).on('click','.modifyFinish',function(){
			let commentContent = $('.modifyContent').val();
			$.ajax({
				type:'get',
				url:'${pageContext.request.contextPath}/modifyQnAComment',
				data:{commentId : commentId, commentContent : commentContent},
				success: function(data) {
					commentContentArea.empty();
					commentContentArea.append('<p id = "commentContent">'+data+'</p>');
					btnArea.empty();
					btnArea.append('<button type="button" class = "modifyBtn primary-btn">수정</button>');
					btnArea.append('<button type="button" class = "deleteBtn primary-btn">삭제</button>');
				}
			});
	    });		
		//댓글 수정 취소 눌렀을경우 원상복귀
		$(document).on('click','.modifyCancle',function(){
			commentContentArea.empty();
			commentContentArea.append(commentContent);
			btnArea.empty();
			btnArea.append('<button type="button" class = "modifyBtn primary-btn">수정</button>');
			btnArea.append('<button type="button" class = "deleteBtn primary-btn">삭제</button>');
		});
	});
});
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/view/inc/navBar.jsp"></jsp:include>
	<!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="${pageContext.request.contextPath}/img/breadcrumb-bg.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb-text">
                        <h2>Q&A</h2>
                        <div class="bt-option">
                            <a href="${pageContext.request.contextPath}/">Home</a>
                            <a href="#">Board</a>
                            <span>Q&A게시판</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->
    
    <!-- RecruitList Section Begin -->
    <section class="class-timetable-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="section-title">
                        <span>Q&A</span>
                        <h2>Q&A게시판</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="chart-table">
                        <table>
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
                    </div>
                    <br>
                    <!-- 로그인 회원이 글쓴이일경우 수정 버튼 생성 -->
                    <div>
					<c:if test="${loginMember.memberId == QnAOne.memberId}">					
						<a href = "${pageContext.request.contextPath}/modifyQnA?qnaId=${QnAOne.qnaId}" class ="primary-btn btn-normal">Q&A수정</a>
						<a href = "${pageContext.request.contextPath}/removeQnA?qnaId=${QnAOne.qnaId}" class ="primary-btn btn-normal">Q&A삭제</a>
					</c:if>
					<a href = "${pageContext.request.contextPath}/getQnAList?pageNum=${pageNum}" class ="primary-btn btn-normal">목록보기</a>
					</div>
                </div>
            </div>
            <div class = "container">
	            <h3>댓글</h3>
	            <hr style="border-top: 1px solid #ccc;">
	            <div class ="typing">
					<c:if test="${loginMember != null}">
						<h5>댓글작성</h5>
						<br>
						<form action="${pageContext.request.contextPath}/addQnAComment" method ="post" id ="QnACommentForm">
							<input type="hidden" name="qnaId" value = "${QnAOne.qnaId}">
							<input type="hidden" name="memberId" value = "${loginMember.memberId}">
							<div>
								<input type="text" readonly="readonly" name="memberName" value="${loginMember.memberName}">
							</div>
							<div>
								<textarea rows="5" cols="50" name = "qnaComment" id="qnaCommentContent" placeholder="댓글을 입력하세요"></textarea>
							</div>
							<button type="button" id="submitQnAComment" class ="primary-btn">작성완료</button>
						</form>
					</c:if>
					<c:forEach var="c" items="${QnACommentList}">
						
						<div class ="commentArea">
							<div>
								<p>${c.memberName}</p>
							</div>
							<input type="hidden" name = "commentId" value="${c.commentId}">
							<div class = "test2">
								<p id = "commentContent">${c.qnaComment}</p>
							</div>
							<c:if test="${c.memberId == loginMember.memberId}">
								<div class="btnArea">
									<button type="button" class = "modifyBtn primary-btn">수정</button>
									<button type="button" class = "deleteBtn primary-btn">삭제</button>
								</div>
							</c:if>
						</div>
						<hr style="border-top: 1px solid #ccc; border-style: groove;;">
					</c:forEach>
				</div>
			</div>
        </div>
    </section>
    <!-- RecruitList Section End -->

    <!-- Footer Section Begin -->
	<jsp:include page="/WEB-INF/view/inc/footer.jsp"></jsp:include>

    <!-- Js Plugins -->
    <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.magnific-popup.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/masonry.pkgd.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.barfiller.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.slicknav.js"></script>
    <script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/main.js"></script>	
</body>
</html>