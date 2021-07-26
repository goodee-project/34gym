<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getLectureOne</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
</script>
</head>
<body>

	<h1>지점신청 대기 상세보기</h1>
	<table border="1">
         <tbody>
			<tr>
                <td>permissionID</td>
                <td>${permissionOne.permissionId}</td>
            </tr>
            <tr>
                <td>신청인</td>
                <td>${permissionOne.memberName}</td>
            </tr>
            <tr>
                <td>설명</td>
                <td>${permissionOne.description}</td>
            </tr>
            <tr>
                <td>건물주소</td>
                <td>${permissionOne.buildingAddress}</td>
            </tr>
            <tr>
                <td>계약조건</td>
                <td>${permissionOne.contractName}</td>
            </tr>
            <tr>
                <td>로얄티</td>
                <td>${permissionOne.contractLoyalty}%</td>
            </tr>
            <tr>
                <td>계약기간</td>
                <td>${permissionOne.contractDuration}</td>
            </tr>
            <tr>
                <td>계약금</td>
                <td><fmt:formatNumber value="${permissionOne.contractDeposit}" pattern="#,###"/>원</td>
            </tr>
            <tr>
                <td>신청날짜</td>
                <td>${permissionOne.createDate}</td>
            </tr>
        </tbody>
    </table>
    <div>
	    <a href="${pageContext.request.contextPath}/admin/addBranch?permissionId=${permissionOne.permissionId}"><button type="button" class="btn btn-default">허가</button></a>
	    <a href="${pageContext.request.contextPath}/admin/addRefusal?permissionId=${permissionOne.permissionId}"><button type="button" class="btn btn-default">거부</button></a>
	    <a href="${pageContext.request.contextPath}/admin/getWaitingForPermissionList"><button type="button" class="btn btn-default">목록</button></a>
	</div>
</body>
</html>