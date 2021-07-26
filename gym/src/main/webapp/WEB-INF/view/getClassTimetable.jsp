<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="Gym Template">
<meta name="keywords" content="Gym, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<title>Class Time Table</title>
	
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
<body>
	<div>
		<jsp:include page="/WEB-INF/view/inc/navBar.jsp"></jsp:include>
	</div>

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="img/breadcrumb-bg.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb-text">
                        <h2>Timetable</h2>
                        <div class="bt-option">
                            <a href="./index.html">Home</a>
                            <a href="#">Pages</a>
                            <span>Timetable</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Class Timetable Section Begin -->
    <section class="class-timetable-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="section-title">
                        <span>Find Your Time</span>
                        <h2>Find Your Time</h2>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="table-controls">
                        <ul>
                        	<c:forEach var="b" items="${branchList}">
                        		<li><a href="${pageContext.request.contextPath}/getClassTimetable?permissionId=${b.permissionId}">${b.branchName}</a></li>
                        	</c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="class-timetable">
                        <table>
                            <thead>
                                <tr>
                                    <th></th>
                                    <th>Monday</th>
                                    <th>Tuesday</th>
                                    <th>Wednesday</th>
                                    <th>Thursday</th>
                                    <th>Friday</th>
                                    <th>Saturday</th>
                                    <th>Sunday</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<tr>
                            		<td class="class-time">6.00am - 8.00am</td>
	                            	<c:forEach var="l" items="${lectureTimetableList}">
	                            		<c:if test="${l.timetablePeriod == '6.00am - 8.00am' && l.timetableDay == 'Monday'}">
                            				<c:if test="${l.lectureName != NULL}">
	                            				<td class="dark-bg hover-bg ts-meta" data-tsmeta="workout" style = "cursor:pointer;" onClick ="location.href='${pageContext.request.contextPath}/getClassTimetableOne?lectureId=${l.lectureId}'">
			                                        <h5>${l.lectureName}</h5>
			                                        <span>${l.trainerName}</span>
			                                    </td>
		                                    </c:if>
		                                    <c:if test="${l.lectureName == NULL}">
	                            				<td class="dark-bg blank-td"></td>
		                                    </c:if>
	                            		</c:if>
	                            		<c:if test="${l.timetablePeriod == '6.00am - 8.00am' && l.timetableDay == 'Tuesday'}">
                            				<c:if test="${l.lectureName != NULL}">
	                            				<td class="hover-bg ts-meta" data-tsmeta="workout" style = "cursor:pointer;" onClick ="location.href='${pageContext.request.contextPath}/getClassTimetableOne?lectureId=${l.lectureId}'">
			                                        <h5>${l.lectureName}</h5>
			                                        <span>${l.trainerName}</span>
			                                    </td>
		                                    </c:if>
		                                    <c:if test="${l.lectureName == NULL}">
	                            				<td class="blank-td"></td>
		                                    </c:if>
	                            		</c:if>
	                            		<c:if test="${l.timetablePeriod == '6.00am - 8.00am' && l.timetableDay == 'Wednesday'}">
                            				<c:if test="${l.lectureName != NULL}">
	                            				<td class="dark-bg hover-bg ts-meta" data-tsmeta="workout" style = "cursor:pointer;" onClick ="location.href='${pageContext.request.contextPath}/getClassTimetableOne?lectureId=${l.lectureId}'">
			                                        <h5>${l.lectureName}</h5>
			                                        <span>${l.trainerName}</span>
			                                    </td>
		                                    </c:if>
		                                    <c:if test="${l.lectureName == NULL}">
	                            				<td class="dark-bg blank-td"></td>
		                                    </c:if>
	                            		</c:if>
	                            		<c:if test="${l.timetablePeriod == '6.00am - 8.00am' && l.timetableDay == 'Thursday'}">
                            				<c:if test="${l.lectureName != NULL}">
	                            				<td class="hover-bg ts-meta" data-tsmeta="workout" style = "cursor:pointer;" onClick ="location.href='${pageContext.request.contextPath}/getClassTimetableOne?lectureId=${l.lectureId}'">
			                                        <h5>${l.lectureName}</h5>
			                                        <span>${l.trainerName}</span>
			                                    </td>
		                                    </c:if>
		                                    <c:if test="${l.lectureName == NULL}">
	                            				<td class="blank-td"></td>
		                                    </c:if>
	                            		</c:if>
	                            		<c:if test="${l.timetablePeriod == '6.00am - 8.00am' && l.timetableDay == 'Friday'}">
                            				<c:if test="${l.lectureName != NULL}">
	                            				<td class="dark-bg hover-bg ts-meta" data-tsmeta="workout" style = "cursor:pointer;" onClick ="location.href='${pageContext.request.contextPath}/getClassTimetableOne?lectureId=${l.lectureId}'">
			                                        <h5>${l.lectureName}</h5>
			                                        <span>${l.trainerName}</span>
			                                    </td>
		                                    </c:if>
		                                    <c:if test="${l.lectureName == NULL}">
	                            				<td class="dark-bg blank-td"></td>
		                                    </c:if>
	                            		</c:if>
	                            		<c:if test="${l.timetablePeriod == '6.00am - 8.00am' && l.timetableDay == 'Saturday'}">
                            				<c:if test="${l.lectureName != NULL}">
	                            				<td class="hover-bg ts-meta" data-tsmeta="workout" style = "cursor:pointer;" onClick ="location.href='${pageContext.request.contextPath}/getClassTimetableOne?lectureId=${l.lectureId}'">
			                                        <h5>${l.lectureName}</h5>
			                                        <span>${l.trainerName}</span>
			                                    </td>
		                                    </c:if>
		                                    <c:if test="${l.lectureName == NULL}">
	                            				<td class="blank-td"></td>
		                                    </c:if>
	                            		</c:if>
	                            		<c:if test="${l.timetablePeriod == '6.00am - 8.00am' && l.timetableDay == 'Sunday'}">
                            				<c:if test="${l.lectureName != NULL}">
	                            				<td class="dark-bg hover-bg ts-meta" data-tsmeta="workout" style = "cursor:pointer;" onClick ="location.href='${pageContext.request.contextPath}/getClassTimetableOne?lectureId=${l.lectureId}'">
			                                        <h5>${l.lectureName}</h5>
			                                        <span>${l.trainerName}</span>
			                                    </td>
		                                    </c:if>
		                                    <c:if test="${l.lectureName == NULL}">
	                            				<td class="dark-bg blank-td"></td>
		                                    </c:if>
	                            		</c:if>
	                            	</c:forEach>
								</tr>
								
								<tr>
                            		<td class="class-time">10.00am - 12.00am</td>
	                            	<c:forEach var="l" items="${lectureTimetableList}">
	                            		<c:if test="${l.timetablePeriod == '10.00am - 12.00am' && l.timetableDay == 'Monday'}">
                            				<c:if test="${l.lectureName != NULL}">
	                            				<td class="hover-bg ts-meta" data-tsmeta="workout" style = "cursor:pointer;" onClick ="location.href='${pageContext.request.contextPath}/getClassTimetableOne?lectureId=${l.lectureId}'">
			                                        <h5>${l.lectureName}</h5>
			                                        <span>${l.trainerName}</span>
			                                    </td>
		                                    </c:if>
		                                    <c:if test="${l.lectureName == NULL}">
	                            				<td class="blank-td"></td>
		                                    </c:if>
	                            		</c:if>
	                            		<c:if test="${l.timetablePeriod == '10.00am - 12.00am' && l.timetableDay == 'Tuesday'}">
                            				<c:if test="${l.lectureName != NULL}">
	                            				<td class="dark-bg hover-bg ts-meta" data-tsmeta="workout" style = "cursor:pointer;" onClick ="location.href='${pageContext.request.contextPath}/getClassTimetableOne?lectureId=${l.lectureId}'">
			                                        <h5>${l.lectureName}</h5>
			                                        <span>${l.trainerName}</span>
			                                    </td>
		                                    </c:if>
		                                    <c:if test="${l.lectureName == NULL}">
	                            				<td class="dark-bg blank-td"></td>
		                                    </c:if>
	                            		</c:if>
	                            		<c:if test="${l.timetablePeriod == '10.00am - 12.00am' && l.timetableDay == 'Wednesday'}">
                            				<c:if test="${l.lectureName != NULL}">
	                            				<td class="hover-bg ts-meta" data-tsmeta="workout" style = "cursor:pointer;" onClick ="location.href='${pageContext.request.contextPath}/getClassTimetableOne?lectureId=${l.lectureId}'">
			                                        <h5>${l.lectureName}</h5>
			                                        <span>${l.trainerName}</span>
			                                    </td>
		                                    </c:if>
		                                    <c:if test="${l.lectureName == NULL}">
	                            				<td class="blank-td"></td>
		                                    </c:if>
	                            		</c:if>
	                            		<c:if test="${l.timetablePeriod == '10.00am - 12.00am' && l.timetableDay == 'Thursday'}">
                            				<c:if test="${l.lectureName != NULL}">
	                            				<td class="dark-bg hover-bg ts-meta" data-tsmeta="workout" style = "cursor:pointer;" onClick ="location.href='${pageContext.request.contextPath}/getClassTimetableOne?lectureId=${l.lectureId}'">
			                                        <h5>${l.lectureName}</h5>
			                                        <span>${l.trainerName}</span>
			                                    </td>
		                                    </c:if>
		                                    <c:if test="${l.lectureName == NULL}">
	                            				<td class="dark-bg blank-td"></td>
		                                    </c:if>
	                            		</c:if>
	                            		<c:if test="${l.timetablePeriod == '10.00am - 12.00am' && l.timetableDay == 'Friday'}">
                            				<c:if test="${l.lectureName != NULL}">
	                            				<td class="hover-bg ts-meta" data-tsmeta="workout" style = "cursor:pointer;" onClick ="location.href='${pageContext.request.contextPath}/getClassTimetableOne?lectureId=${l.lectureId}'">
			                                        <h5>${l.lectureName}</h5>
			                                        <span>${l.trainerName}</span>
			                                    </td>
		                                    </c:if>
		                                    <c:if test="${l.lectureName == NULL}">
	                            				<td class="blank-td"></td>
		                                    </c:if>
	                            		</c:if>
	                            		<c:if test="${l.timetablePeriod == '10.00am - 12.00am' && l.timetableDay == 'Saturday'}">
                            				<c:if test="${l.lectureName != NULL}">
	                            				<td class="dark-bg hover-bg ts-meta" data-tsmeta="workout" style = "cursor:pointer;" onClick ="location.href='${pageContext.request.contextPath}/getClassTimetableOne?lectureId=${l.lectureId}'">
			                                        <h5>${l.lectureName}</h5>
			                                        <span>${l.trainerName}</span>
			                                    </td>
		                                    </c:if>
		                                    <c:if test="${l.lectureName == NULL}">
	                            				<td class="dark-bg blank-td"></td>
		                                    </c:if>
	                            		</c:if>
	                            		<c:if test="${l.timetablePeriod == '10.00am - 12.00am' && l.timetableDay == 'Sunday'}">
                            				<c:if test="${l.lectureName != NULL}">
	                            				<td class="hover-bg ts-meta" data-tsmeta="workout" style = "cursor:pointer;" onClick ="location.href='${pageContext.request.contextPath}/getClassTimetableOne?lectureId=${l.lectureId}'">
			                                        <h5>${l.lectureName}</h5>
			                                        <span>${l.trainerName}</span>
			                                    </td>
		                                    </c:if>
		                                    <c:if test="${l.lectureName == NULL}">
	                            				<td class="blank-td"></td>
		                                    </c:if>
	                            		</c:if>
	                            	</c:forEach>
								</tr>
								
								<tr>
                            		<td class="class-time">5.00pm - 7.00pm</td>
	                            	<c:forEach var="l" items="${lectureTimetableList}">
	                            		<c:if test="${l.timetablePeriod == '5.00pm - 7.00pm' && l.timetableDay == 'Monday'}">
                            				<c:if test="${l.lectureName != NULL}">
	                            				<td class="dark-bg hover-bg ts-meta" data-tsmeta="workout" style = "cursor:pointer;" onClick ="location.href='${pageContext.request.contextPath}/getClassTimetableOne?lectureId=${l.lectureId}'">
			                                        <h5>${l.lectureName}</h5>
			                                        <span>${l.trainerName}</span>
			                                    </td>
		                                    </c:if>
		                                    <c:if test="${l.lectureName == NULL}">
	                            				<td class="dark-bg blank-td"></td>
		                                    </c:if>
	                            		</c:if>
	                            		<c:if test="${l.timetablePeriod == '5.00pm - 7.00pm' && l.timetableDay == 'Tuesday'}">
                            				<c:if test="${l.lectureName != NULL}">
	                            				<td class="hover-bg ts-meta" data-tsmeta="workout" style = "cursor:pointer;" onClick ="location.href='${pageContext.request.contextPath}/getClassTimetableOne?lectureId=${l.lectureId}'">
			                                        <h5>${l.lectureName}</h5>
			                                        <span>${l.trainerName}</span>
			                                    </td>
		                                    </c:if>
		                                    <c:if test="${l.lectureName == NULL}">
	                            				<td class="blank-td"></td>
		                                    </c:if>
	                            		</c:if>
	                            		<c:if test="${l.timetablePeriod == '5.00pm - 7.00pm' && l.timetableDay == 'Wednesday'}">
                            				<c:if test="${l.lectureName != NULL}">
	                            				<td class="dark-bg hover-bg ts-meta" data-tsmeta="workout" style = "cursor:pointer;" onClick ="location.href='${pageContext.request.contextPath}/getClassTimetableOne?lectureId=${l.lectureId}'">
			                                        <h5>${l.lectureName}</h5>
			                                        <span>${l.trainerName}</span>
			                                    </td>
		                                    </c:if>
		                                    <c:if test="${l.lectureName == NULL}">
	                            				<td class="dark-bg blank-td"></td>
		                                    </c:if>
	                            		</c:if>
	                            		<c:if test="${l.timetablePeriod == '5.00pm - 7.00pm' && l.timetableDay == 'Thursday'}">
                            				<c:if test="${l.lectureName != NULL}">
	                            				<td class="hover-bg ts-meta" data-tsmeta="workout" style = "cursor:pointer;" onClick ="location.href='${pageContext.request.contextPath}/getClassTimetableOne?lectureId=${l.lectureId}'">
			                                        <h5>${l.lectureName}</h5>
			                                        <span>${l.trainerName}</span>
			                                    </td>
		                                    </c:if>
		                                    <c:if test="${l.lectureName == NULL}">
	                            				<td class="blank-td"></td>
		                                    </c:if>
	                            		</c:if>
	                            		<c:if test="${l.timetablePeriod == '5.00pm - 7.00pm' && l.timetableDay == 'Friday'}">
                            				<c:if test="${l.lectureName != NULL}">
	                            				<td class="dark-bg hover-bg ts-meta" data-tsmeta="workout" style = "cursor:pointer;" onClick ="location.href='${pageContext.request.contextPath}/getClassTimetableOne?lectureId=${l.lectureId}'">
			                                        <h5>${l.lectureName}</h5>
			                                        <span>${l.trainerName}</span>
			                                    </td>
		                                    </c:if>
		                                    <c:if test="${l.lectureName == NULL}">
	                            				<td class="dark-bg blank-td"></td>
		                                    </c:if>
	                            		</c:if>
	                            		<c:if test="${l.timetablePeriod == '5.00pm - 7.00pm' && l.timetableDay == 'Saturday'}">
                            				<c:if test="${l.lectureName != NULL}">
	                            				<td class="hover-bg ts-meta" data-tsmeta="workout" style = "cursor:pointer;" onClick ="location.href='${pageContext.request.contextPath}/getClassTimetableOne?lectureId=${l.lectureId}'">
			                                        <h5>${l.lectureName}</h5>
			                                        <span>${l.trainerName}</span>
			                                    </td>
		                                    </c:if>
		                                    <c:if test="${l.lectureName == NULL}">
	                            				<td class="blank-td"></td>
		                                    </c:if>
	                            		</c:if>
	                            		<c:if test="${l.timetablePeriod == '5.00pm - 7.00pm' && l.timetableDay == 'Sunday'}">
                            				<c:if test="${l.lectureName != NULL}">
	                            				<td class="dark-bg hover-bg ts-meta" data-tsmeta="workout" style = "cursor:pointer;" onClick ="location.href='${pageContext.request.contextPath}/getClassTimetableOne?lectureId=${l.lectureId}'">
			                                        <h5>${l.lectureName}</h5>
			                                        <span>${l.trainerName}</span>
			                                    </td>
		                                    </c:if>
		                                    <c:if test="${l.lectureName == NULL}">
	                            				<td class="dark-bg blank-td"></td>
		                                    </c:if>
	                            		</c:if>
	                            	</c:forEach>
								</tr>
								
								<tr>
                            		<td class="class-time">7.00pm - 9.00pm</td>
	                            	<c:forEach var="l" items="${lectureTimetableList}">
	                            		<c:if test="${l.timetablePeriod == '7.00pm - 9.00pm' && l.timetableDay == 'Monday'}">
                            				<c:if test="${l.lectureName != NULL}">
	                            				<td class="hover-bg ts-meta" data-tsmeta="workout" style = "cursor:pointer;" onClick ="location.href='${pageContext.request.contextPath}/getClassTimetableOne?lectureId=${l.lectureId}'">
			                                        <h5>${l.lectureName}</h5>
			                                        <span>${l.trainerName}</span>
			                                    </td>
		                                    </c:if>
		                                    <c:if test="${l.lectureName == NULL}">
	                            				<td class="blank-td"></td>
		                                    </c:if>
	                            		</c:if>
	                            		<c:if test="${l.timetablePeriod == '7.00pm - 9.00pm' && l.timetableDay == 'Tuesday'}">
                            				<c:if test="${l.lectureName != NULL}">
	                            				<td class="dark-bg hover-bg ts-meta" data-tsmeta="workout" style = "cursor:pointer;" onClick ="location.href='${pageContext.request.contextPath}/getClassTimetableOne?lectureId=${l.lectureId}'">
			                                        <h5>${l.lectureName}</h5>
			                                        <span>${l.trainerName}</span>
			                                    </td>
		                                    </c:if>
		                                    <c:if test="${l.lectureName == NULL}">
	                            				<td class="dark-bg blank-td"></td>
		                                    </c:if>
	                            		</c:if>
	                            		<c:if test="${l.timetablePeriod == '7.00pm - 9.00pm' && l.timetableDay == 'Wednesday'}">
                            				<c:if test="${l.lectureName != NULL}">
	                            				<td class="hover-bg ts-meta" data-tsmeta="workout" style = "cursor:pointer;" onClick ="location.href='${pageContext.request.contextPath}/getClassTimetableOne?lectureId=${l.lectureId}'">
			                                        <h5>${l.lectureName}</h5>
			                                        <span>${l.trainerName}</span>
			                                    </td>
		                                    </c:if>
		                                    <c:if test="${l.lectureName == NULL}">
	                            				<td class="blank-td"></td>
		                                    </c:if>
	                            		</c:if>
	                            		<c:if test="${l.timetablePeriod == '7.00pm - 9.00pm' && l.timetableDay == 'Thursday'}">
                            				<c:if test="${l.lectureName != NULL}">
	                            				<td class="dark-bg hover-bg ts-meta" data-tsmeta="workout" style = "cursor:pointer;" onClick ="location.href='${pageContext.request.contextPath}/getClassTimetableOne?lectureId=${l.lectureId}'">
			                                        <h5>${l.lectureName}</h5>
			                                        <span>${l.trainerName}</span>
			                                    </td>
		                                    </c:if>
		                                    <c:if test="${l.lectureName == NULL}">
	                            				<td class="dark-bg blank-td"></td>
		                                    </c:if>
	                            		</c:if>
	                            		<c:if test="${l.timetablePeriod == '7.00pm - 9.00pm' && l.timetableDay == 'Friday'}">
                            				<c:if test="${l.lectureName != NULL}">
	                            				<td class="hover-bg ts-meta" data-tsmeta="workout" style = "cursor:pointer;" onClick ="location.href='${pageContext.request.contextPath}/getClassTimetableOne?lectureId=${l.lectureId}'">
			                                        <h5>${l.lectureName}</h5>
			                                        <span>${l.trainerName}</span>
			                                    </td>
		                                    </c:if>
		                                    <c:if test="${l.lectureName == NULL}">
	                            				<td class="blank-td"></td>
		                                    </c:if>
	                            		</c:if>
	                            		<c:if test="${l.timetablePeriod == '7.00pm - 9.00pm' && l.timetableDay == 'Saturday'}">
                            				<c:if test="${l.lectureName != NULL}">
	                            				<td class="dark-bg hover-bg ts-meta" data-tsmeta="workout" style = "cursor:pointer;" onClick ="location.href='${pageContext.request.contextPath}/getClassTimetableOne?lectureId=${l.lectureId}'">
			                                        <h5>${l.lectureName}</h5>
			                                        <span>${l.trainerName}</span>
			                                    </td>
		                                    </c:if>
		                                    <c:if test="${l.lectureName == NULL}">
	                            				<td class="dark-bg blank-td"></td>
		                                    </c:if>
	                            		</c:if>
	                            		<c:if test="${l.timetablePeriod == '7.00pm - 9.00pm' && l.timetableDay == 'Sunday'}">
                            				<c:if test="${l.lectureName != NULL}">
	                            				<td class="hover-bg ts-meta" data-tsmeta="workout" style = "cursor:pointer;" onClick ="location.href='${pageContext.request.contextPath}/getClassTimetableOne?lectureId=${l.lectureId}'">
			                                        <h5>${l.lectureName}</h5>
			                                        <span>${l.trainerName}</span>
			                                    </td>
		                                    </c:if>
		                                    <c:if test="${l.lectureName == NULL}">
	                            				<td class="blank-td"></td>
		                                    </c:if>
	                            		</c:if>
	                            	</c:forEach>
								</tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Class Timetable Section End -->

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