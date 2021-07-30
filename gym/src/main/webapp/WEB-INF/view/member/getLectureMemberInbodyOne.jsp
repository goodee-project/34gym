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
<title>Inbody 상세보기</title>
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
                            <span>Inbody</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->
    
    <!-- Table Section Begin -->
    <section class="bmi-calculator-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title chart-title">
                        <h2>Inbody 상세보기</h2>
                    </div>
    				<div class="chart-table">
                        <table>
							<tbody>
				                <tr>
				                	<td>이력서Id</td>
				                	<td>${lectureMemberInbody.lectureMemberInbodyId}</td>
				                </tr>
				                <tr>
				                    <td>출입날짜</td>
				                    <td>${lectureMemberInbody.entranceTime}</td>
				                </tr>
				                <tr>
				                    <td>트레이너Id</td>
				                    <td>${lectureMemberInbody.trainerApplicationId}</td>
				                </tr>
				                <tr>
				                    <td>무게</td>
				                    <td>${lectureMemberInbody.weight}</td>
				                </tr>
				                <tr>
				                    <td>골격근량</td>
				                    <td>${lectureMemberInbody.skeletalMuscleMass}</td>
				                </tr>
				                <tr>
				                    <td>BMI</td>
				                    <td>${lectureMemberInbody.BMI}</td>
				                </tr>
				                <tr>
				                    <td>체지방률</td>
				                    <td>${lectureMemberInbody.percentBodyFat}</td>
				                </tr>
				                <tr>
				                    <td>신장</td>
				                    <td>${lectureMemberInbody.height}</td>
				                </tr>
				                <tr>
				                    <td>나이</td>
				                    <td>${lectureMemberInbody.age}</td>
				                </tr>
				                <tr>
				                    <td>성별</td>
				                    <td>${lectureMemberInbody.gender}</td>
				                </tr>
				                <tr>
				                    <td>측정날짜</td>
				                    <td>${lectureMemberInbody.inbodyDate}</td>
				                </tr>
							</tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Table Section End -->
   
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