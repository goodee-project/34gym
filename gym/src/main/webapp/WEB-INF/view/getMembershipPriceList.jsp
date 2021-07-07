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
    <h1>MembershipPriceList</h1>
    <table border="1">
        <thead>
            <tr>
                <th>membershipPriceID</th>
                <th>membershipPrice</th>
                <th>startDate</th>
                <th>endDate</th>
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
                    <td><a href="${pageContext.request.contextPath}/modifyMembershipPrice?membershipPriceId=${m.membershipPriceId}"><button>수정</button></a></td>
                    <td><a href="${pageContext.request.contextPath}/removeMembershipPrice?membershipPriceId=${m.membershipPriceId}"><button>삭제</button></a></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>