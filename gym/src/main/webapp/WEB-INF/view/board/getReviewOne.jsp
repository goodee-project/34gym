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
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
<script>
$(document).ready(function(){
	$.ajax({
		type:'get',
		url:'${pageContext.request.contextPath}/getReviewLike',
		data:{reviewId : ${reviewOne.reviewId}},
		success: function(jsonData) {
			$('#likeCount').append(jsonData);
		}
	});
	
	$('#likeBtn').click(function() {
		var memberId = $('#memberId').val();
		$.ajax({
			type:'get',
			url:'${pageContext.request.contextPath}/toggleReviewLike',
			data:{reviewId : ${reviewOne.reviewId}, memberId : memberId},
			success: function() {
				$('#likeCount').empty();
				$.ajax({
					type:'get',
					url:'${pageContext.request.contextPath}/getReviewLike',
					data:{reviewId : ${reviewOne.reviewId}},
					success: function(jsonData) {
						$('#likeCount').append(jsonData);
					}
				});
			}
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
                        <h2>Review</h2>
                        <div class="bt-option">
                            <a href="${pageContext.request.contextPath}/">Home</a>
                            <a href="#">Board</a>
                            <span>리뷰게시판</span>
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
                        <h2>리뷰게시판</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="chart-table">
                        <table>
                           <tr>
								<td>reviewId</td>
								<td>${reviewOne.reviewId}</td>
							</tr>
							<tr>
								<td>lectureName</td>
								<td>${reviewOne.lectureName}</td>
							</tr>
							<tr>
								<td>memberName</td>
								<td>${reviewOne.memberName}</td>
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
								<!-- 로그인일경우에만 좋아요 클릭가능 -->
								<c:if test="${loginMember != null}">
									<td>
										<input type="hidden" id = "memberId" value="${loginMember.memberId}">
										<a type = "button" id = "likeBtn"><i class="fas fa-heart fa-2x" style="color: #B9062F"></i></a>	
										<a type = "button"><i class="far fa-heart fa-2x" style="color: #B9062F"></i></a>								
										<button type = "button" id = "likeBtn">좋아요</button>
									</td>
								</c:if>
								<c:if test="${loginMember == null}">
									
									<td>
										<input type="hidden" id = "memberId" value="0">
										좋아요
									</td>
								</c:if>
								<td id ="likeCount"></td>
							</tr>
                        </table>
                    </div>
                    <br>
                    <!-- 로그인 회원이 강좌회원일경우 리뷰수정 버튼 생성 -->
					<c:if test="${loginMember.memberId == reviewOne.memberId}">
						<input type="hidden" id = "memberId" value="${loginMember.memberId}">
						<div id = "modifyBtn">
							<a href = "${pageContext.request.contextPath}/modifyReview?reviewId=${reviewOne.reviewId}" class ="primary-btn">리뷰수정</a>
						</div>
						<div>
							<form action="${pageContext.request.contextPath}/removeReview" method="post">
								<input type="hidden" name = "reviewId" value = "${reviewOne.reviewId}">
								<button type="submit" class ="primary-btn">리뷰삭제</button>
							</form>
						</div>
					</c:if>
					<a href = "${pageContext.request.contextPath}/getReviewList" class ="primary-btn">목록보기</a>
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