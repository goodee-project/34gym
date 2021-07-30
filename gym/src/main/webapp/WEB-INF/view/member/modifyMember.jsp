<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>getLectureByMemberList</title>
</head>
<body>
	<!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

   <!-- mainMenu -->
   <jsp:include page="/WEB-INF/view/inc/navBar.jsp"></jsp:include>
   
   <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="${pageContext.request.contextPath}/img/breadcrumb-bg.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb-text">
                        <h2>My Page</h2>
                        <div class="bt-option">
                            <a href="${pageContext.request.contextPath}/">Home</a>
                            <a href="${pageContext.request.contextPath}/member/getMemberMyPage">My Page</a>
                            <span>LectureListByMember</span>
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
						<h2>회원 수정</h2>
					</div>
					<div class="chart-table">
						<table>
							<tr>
								<td>이메일 : 
									<input type="email" name="memberMail" id="memberMail" value="${memberList.memberMail}" readonly="readonly">${memberList.memberMail}
								</td>
							</tr>
							<tr>
								<td>이름 : <input type="text" name="memberName" readonly="readonly">${memberList.memberName}</td>
							</tr>
							<tr>
								<td>비밀번호 : <input type="password" onkeyup="passwordCheck()" id="memberPw" name="memberPw"></td>
							</tr>
							<tr>
								<td>비밀번호 확인 : 
									<input type="password" onkeyup="passwordCheck()" id="memberPwCheck">
									<p id="passwordCheckMessage"></p>
								</td>
							</tr>
							<tr>
								<td>
									<input type="text" name="postCode" id="postcode" placeholder="우편번호">
									<input type="button" id="addressBtn" value="우편번호 찾기" class="d_btn">
								</td>
							</tr>
							<tr>
								<td><input type="text" name="memberAddress" id="address" placeholder="주소"></td>
							</tr>
							<tr>
								<td>
									<input type="text" name="memberDetailAddress" id="detailAddress" class="d_form" placeholder="상세주소">
									<input type="text" name="memberExtraAddress" id="extraAddress" class="d_form" placeholder="참고항목">
								</td>
							</tr>
							<tr>
								<td>핸드폰 번호 : <input type="tel" name="memberPhone"></td>
							</tr>
						</table>
					</div>
				</div>
                
                <!-- 마이페이지 메뉴 -->
                <jsp:include page="/WEB-INF/view/inc/MyPage.jsp"></jsp:include>
   
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