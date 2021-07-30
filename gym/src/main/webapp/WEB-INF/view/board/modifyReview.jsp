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
		if($('#reviewTitle').val().length < 5){
			alert('제목은 5자 이상이어야 합니다.');
			$('#reviewTitle').focus();
		} else if($('#reviewContent').val().length < 10) {
			alert('내용은 10자 이상이어야 합니다');
			$('#reviewContent').focus();
		} else {
		     $('#modifyForm').submit();
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
                        <h2>Review</h2>
                        <div class="bt-option">
                            <a href="${pageContext.request.contextPath}/">Home</a>
                            <a href="#">Board</a>
                            <span>Review게시판</span>
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
                        <span>Review</span>
                        <h2>Review수정</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="chart-table typing">
                    	<form id ="modifyForm" action="${pageContext.request.contextPath}/modifyReview" method="post">
							<p>reviewId</p>
                    		<input type = "text" id = "reviewId" name = "reviewId" readonly="readonly" value="${reviewOne.reviewId}" >                     		
                    		<p>lectureName</p>
                    		<input type = "text" id = "lectureName" name = "lectureName" readonly="readonly" value="${reviewOne.lectureName}" >
                    		<p>memberName</p>
                    		<input type = "text" id = "memberName" name = "memberName" readonly="readonly" value="${reviewOne.memberName}" > 
							<p>reviewTitle</p>
                    		<input type = "text" id = "reviewTitle" name = "reviewTitle" value="${reviewOne.reviewTitle}">
                    		<p>reviewContent</p>
                    		<textarea rows="8" cols="50" id = "reviewContent" name = "reviewContent">${reviewOne.reviewContent}</textarea>
                    		<p>reviewScore</p>
                    		<select name ="reviewScore" class ="form-control" style="background: transparent; font-size: 13px; color: #c4c4c4; border: 1px solid #363636;">
								<c:forEach var ="i" begin="1" end="5" >
									<c:if test="${i ==  reviewOne.reviewScore}">
										<option value="${i}" selected="selected" >${i}</option>
									</c:if>
									<c:if test="${i !=  reviewOne.reviewScore}">
										<option value="${i}">${i}</option>
									</c:if>
								</c:forEach>
							</select>
                    		<button type="button" id = "submitBtn" class ="primary-btn">수정완료</button>
                    	</form>
                    </div>
                    <br>
                    <a href = "${pageContext.request.contextPath}/getReviewList" class ="primary-btn">목록보기</a>
					<a href = "${pageContext.request.contextPath}/getReviewOne?${reviewOne.reviewId}" class ="primary-btn">돌아가기</a>
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