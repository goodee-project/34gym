<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getNoticeList</title>
</head>
<body>
<div class="container">
    <h1>공지사항 게시판</h1>
    <a href="${pageContext.request.contextPath}/board/addNotice"><button>공지사항 등록</button></a>
    <table border="1">
        <thead>
            <tr>
                <th>noticeID</th>
                <th>관리자ID</th>
                <th>제목</th>
                <th>게시날짜</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="n" items="${noticeList}">
                <tr>
                	<td>${n.noticeId}</td>
                    <td>${n.adminId}</td>
                    <td><a href="${pageContext.request.contextPath}/board/getNoticeOne?noticeId=${n.noticeId}">${n.noticeTitle}</a></td>
                    <td>${n.createDate}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>