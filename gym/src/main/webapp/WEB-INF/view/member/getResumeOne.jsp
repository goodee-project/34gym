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
<title>Resume</title>
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
                            <span>Resume</span>
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
                        <h2>이력서 상세보기</h2>
                    </div>
                    <td><a href="${pageContext.request.contextPath}/member/modifyResume?resumeId=${r.resumeId}"><button class ="primary-btn btn-normal">수정</button></a></td>
    				<div class="chart-table">
                        <table>
							<tbody>
				                <tr>
				                	<td>이력서Id</td>
				                	<td>${resumeMap.resumeId}</td>
				                </tr>
				                <tr>
				                    <td>회원이름</td>
				                    <td>${resumeMap.memberName}</td>
				                </tr>
				                <tr>
				                    <td>경력</td>
				                    <td>${resumeMap.career}</td>
				                </tr>
				                <tr>
				                    <td>분야</td>
				                    <td>${resumeMap.type}</td>
				                </tr>
				                <tr>
				                    <td>사진</td>
				                    <td>
				                    	${resumeMap.resumeImg}
				                    	<a class ="primary-btn btn-normal" href="${pageContext.request.contextPath}/member/modifyResumeImg">사진수정</a>
				                    </td>
				                </tr>
				                <tr>
				                    <td>자격증</td>
				                    <td>${resumeMap.certificate}</td>
				                </tr>
				                <tr>
				                    <td>자기소개서</td>
				                    <td>${resumeMap.resumeContent}</td>
				                </tr>
				                <tr>
				                    <td>생성날짜</td>
				                    <td>${resumeMap.createDate}</td>
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