<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="description" content="Gym Template">
    <meta name="keywords" content="Gym, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

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
</head>
<title>findMemberPwForm</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		console.log("ready!");
		$('#verifCodeCheck').click(function() {
			console.log("verifCodeCheck click!");
			console.log($('#memberMail').val());
			console.log($('#verifCode').val());
			$.ajax({
				type : 'post',
				url : '/gym/verifCodeCheck',
				data : {
					memberMail : $('#memberMail').val(),
					verifCode : $('#verifCode').val()
				},
				success : function(data) {
					if (data == 0) {
						alert("인증번호가 틀렸습니다.");
						$('#verifCodeMessage').html("");
					} else {
						$('#verifCodeMessage').html("인증 완료");
						$('#verifCodeMessage').css({
							color : "green"
						});
						$('#findMemberBtn').removeAttr("disabled");
					}
				}
			});
		});
		$('#findMemberBtn').click(function() {
			console.log("findMemberBtn click!");
			$('#findMemberPwForm').submit();
		});
	});

	function sendMail() {
		console.log("실행");
		
		let mail = $('#memberMail').val()
		console.log("mail : " + mail);
		
		let check = isMail(mail);
		console.log("check : " + check);

		if (check == true) {
			console.log("이메일입니다");
			$.ajax({
				type : 'post',
				url : '/gym/getMailAuth',
				data : {
					userMail : mail
				},
				success : function(data) {
				},
				error : function(e) {
					alert('오류입니다');
				}
			});
		} else {
			alert('이메일 형식에 맞게 작성해주세요');
		}
	}
	function isMail(Val) {
		let regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		return regExp.test(Val);
	}
</script>

<body>
	<!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

	<!-- mainMenu -->
	<jsp:include page="/WEB-INF/view/inc/navBar.jsp"></jsp:include>

	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section set-bg"
		data-setbg="${pageContext.request.contextPath}/img/breadcrumb-bg.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb-text">
						<h2>My Page</h2>
						<div class="bt-option">
							<a href="${pageContext.request.contextPath}/">Home</a> <a
								href="${pageContext.request.contextPath}/member/getMemberMyPage">My
								Page</a> <span>LectureListByMember</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->
	
	<!-- Blog Section Begin -->
    <section class="blog-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-10 p-0">
					<div class="section-title chart-title">
						<h2>비밀번호 찾기</h2>
					</div>
					<div class="chart-table">
						<form id="findMemberPwForm" action="${pageContext.request.contextPath}/findMemberPw" method="post">
							<table border="1">
								<tr>
									<td>Email</td>
									<td><input type="email" id="memberMail" name="memberMail">
										&nbsp;<button class ="primary-btn" type="button" onclick="sendMail()">인증번호 보내기</button>
									</td>
								</tr>
								<tr>
									<td>인증번호</td>
									<td><input type="text" name="verifCode" id="verifCode">
										&nbsp;<button class ="primary-btn" type="button" id="verifCodeCheck">인증번호 확인</button>
										<div>
											<p id="verifCodeMessage"></p>
										</div>
									</td>
								</tr>
							</table>
							<div>&nbsp;</div>
							<button class ="primary-btn" type="button" id="findMemberBtn" disabled="disabled">비밀번호 찾기(이메일로 임시비밀번호가 전송됩니다)</button>
							<button class ="primary-btn" type="button" onclick='history.back()'>뒤로 가기</button>
						</form>
					</div>
				</div>           
   			</div>
        </div>
   </section>
   <!-- Blog Section End -->
   
	<!-- Footer Start -->
	<jsp:include page="/WEB-INF/view/inc/footer.jsp"></jsp:include>
	<!-- Footer End -->

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