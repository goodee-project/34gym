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
                        <h2>Recruit</h2>
                        <div class="bt-option">
                            <a href="${pageContext.request.contextPath}/">Home</a>
                            <a href="#">Board</a>
                            <span>구인게시판</span>
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
                        <span>Recruit</span>
                        <h2>구인게시판</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="chart-table">
                        <table>
                            <thead>
                                <tr>
                                    <th>recruitId</th>
                                    <th>branchName</th>
                                    <th>recruitTitle</th>
                                    <th>memberName</th>
                                    <th>createDate</th>

                                </tr>
                            </thead>
                            <tbody>
                            	<c:forEach var="r" items="${recruitList}">
								<tr>
									<td>${r.recruitId}</td>
									<td>${r.branchName}</td>
									<td>
										<a href="${pageContext.request.contextPath}/getRecruitOne?recruitId=${r.recruitId}&pageNum=${pageNum}">${r.recruitTitle}</a>
									</td>
									<td>${r.memberName}</td>
									<td>${r.createDate}</td>
								</tr>
								</c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <br>
                    <!-- 페이징 -->
	                <div>
	                	<ul class="pagination">
	                		<c:if test="${pageNum eq '0'}">
	                			<li class="page-item"><a class="page-link primary-btn">이전</a></li>
	                		</c:if>
	                		<c:if test="${pageNum ne '0' }">
	                			<li class="page-item"><a class="page-link primary-btn"  href="${pageContext.request.contextPath}/getRecruitList?pageNum=${pageNum - 1}">이전</a></li>
	                		</c:if>
						  	<c:if test="${nextFlag == true}">
	                			<li class="page-item"><a class="page-link primary-btn" href="${pageContext.request.contextPath}/getRecruitList?pageNum=${pageNum + 1}">다음</a></li>
	                		</c:if>
	                		<c:if test="${nextFlag == false}">
	                			<li class="page-item"><a class="page-link primary-btn">다음</a></li>
	                		</c:if>
						</ul>
	                </div>
                    <br>
                    <!-- 로그인 회원이 지점장일경우 게시물작성 버튼 생성 -->
					<c:if test="${loginBranch != null}">
						<div>
							<a href = "${pageContext.request.contextPath}/addRecruit" class ="primary-btn btn-normal ">게시물작성</a>
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