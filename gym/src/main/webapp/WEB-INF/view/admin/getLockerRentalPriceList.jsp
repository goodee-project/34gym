<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getLockerRentalPriceList</title>
</head>
<body>
<div class="container">
    <h1>라커 1개월 비용 목록</h1>
    <table border="1">
        <thead>
            <tr>
                <th>lockerRentalPriceID</th>
                <th>라커 1개월 비용</th>
                <th>시작날짜</th>
                <th>종료날짜</th>
                <th>수정</th>
                <th>삭제</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="l" items="${lockerRentalPriceList}">
                <tr>
                	<td>${l.lockerRentalPriceId}</td>
                    <td>${l.lockerRentalPrice}</td>
                    <td>${l.startDate}</td>
                    <td>${l.endDate}</td>
                    <td><a href="${pageContext.request.contextPath}/admin/modifyLockerRentalPrice?lockerRentalPriceId=${l.lockerRentalPriceId}"><button>수정</button></a></td>
                    <td><a href="${pageContext.request.contextPath}/admin/removeLockerRentalPrice?lockerRentalPriceId=${l.lockerRentalPriceId}"><button>삭제</button></a></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <a href="${pageContext.request.contextPath}/admin/addLockerRentalPrice"><button>라커 1개월 비용 추가</button></a>
</div>
</body>
</html>