<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getMembershipPriceList</title>
</head>
<body>
<div class="container">
    <h1>운동이용권 1개월 비용 목록</h1>
    <table border="1">
        <thead>
            <tr>
                <th>membershipPriceID</th>
                <th>운동이용권 1개월 비용</th>
                <th>시작날짜</th>
                <th>종료날짜</th>
                <th>수정</th>
                <th>삭제</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="m" items="${membershipPriceList}">
                <tr>
                	<td>${m.membershipPriceId}</td>
                    <td>${m.membershipPrice}</td>
                    <td>${m.startDate}</td>
                    <td>${m.endDate}</td>
                    <td><a href="${pageContext.request.contextPath}/admin/modifyMembershipPrice?membershipPriceId=${m.membershipPriceId}"><button>수정</button></a></td>
                    <td><a href="${pageContext.request.contextPath}/admin/removeMembershipPrice?membershipPriceId=${m.membershipPriceId}"><button>삭제</button></a></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <a href="${pageContext.request.contextPath}/admin/addMembershipPrice"><button>운동이용권 비용 추가</button></a>
</div>
</body>
</html>