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
	$('#submitBtn').click(function() {
		if($('#qnaTitle').val().length < 5){
			alert('제목은 5자 이상이어야 합니다.');
			$('#qnaTitle').focus();
		} else if($('#qnaContent').val().length < 10) {
			alert('내용은 10자 이상이어야 합니다');
			$('#qnaContent').focus();
		} else {
		     $('#addForm').submit();
		}
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
                        <h2>Q&A작성</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="chart-table typing">
                    	<form id ="addForm" action="${pageContext.request.contextPath}/addQnA" method="post">
							<input type = "hidden" value="${loginMember.memberId}" name = "memberId"> 
							<p>memberName</p>
                    		<input type = "text" readonly="readonly" value="${loginMember.memberName}" >                     		
                    		<p>Q&ATitle</p>
                    		<input type = "text" id = "qnaTitle" name = "qnaTitle">
                    		<p>Q&AContent</p>
                    		<textarea rows="8" cols="50" id = "qnaContent" name = "qnaContent"></textarea>   		
							<button type="button" class ="primary-btn btn-normal" id = "submitBtn">작성완료</button>
							<a href = "${pageContext.request.contextPath}/getQnAList" class ="primary-btn">목록보기</a>
						</form>
                    </div>
                    <br>       
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