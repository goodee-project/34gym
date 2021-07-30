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
                    </div>
                    <br>
                    <!-- 로그인 회원이 강좌회원일경우 QnA작성 버튼 생성 -->
					<c:if test="${loginMember != null || lectureinfo.size() > 0}">
						<div>
							<a href = "${pageContext.request.contextPath}/addQnA" class ="primary-btn btn-normal">Q&A쓰기</a>
						</div>
					</c:if>
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