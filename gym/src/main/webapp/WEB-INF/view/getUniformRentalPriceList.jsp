<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getUniformRentalPriceList</title>
</head>
<body>
<div class="container">
    <h1>운동복 1개월 비용 목록</h1>
    <table border="1">
        <thead>
            <tr>
                <th>uniformRentalPriceID</th>
                <th>운동복 1개월 비용</th>
                <th>시작날짜</th>
                <th>종료날짜</th>
                <th>수정</th>
                <th>삭제</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="u" items="${uniformRentalPriceList}">
                <tr>
                	<td>${u.uniformRentalPriceId}</td>
                    <td>${u.uniformRentalPrice}</td>
                    <td>${u.startDate}</td>
                    <td>${u.endDate}</td>
                    <td><a href="${pageContext.request.contextPath}/modifyUniformRentalPrice?uniformRentalPriceId=${u.uniformRentalPriceId}"><button>수정</button></a></td>
                    <td><a href="${pageContext.request.contextPath}/removeUniformRentalPrice?uniformRentalPriceId=${u.uniformRentalPriceId}"><button>삭제</button></a></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <a href="${pageContext.request.contextPath}/addUniformRentalPrice"><button>운동복 1개월 비용 추가</button></a>
</div>
</body>
</html>