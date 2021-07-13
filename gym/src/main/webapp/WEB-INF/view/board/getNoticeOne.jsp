<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getNoticeOne</title>
</head>
<body>
<div class="container">
    <h1>공지사항 상세보기</h1>
    <table border="1">
		<tr>
		    <th>noticeID</th>
		    <td>${noticeOne.noticeId}</td>
		</tr>
		<tr>
			<th>관리자ID</th>
		    <td>${noticeOne.adminId}</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${noticeOne.noticeTitle}</td>
		<tr>
			<th>내용</th>
			<td>${noticeOne.noticeContent}</td>
		</tr>
		<tr>
			<th>게시날짜</th>
			<td>${noticeOne.createDate}</td>
		</tr>
    </table>
    <div>
        <a href="${pageContext.request.contextPath}/admin/modifyNotice?noticeId=${noticeOne.noticeId}"><button class="btn btn-default" type="button">수정</button></a>
        <a href="${pageContext.request.contextPath}/admin/removeNotice?noticeId=${noticeOne.noticeId}"><button class="btn btn-default" type="button">삭제</button></a>
        <a href="${pageContext.request.contextPath}/getNoticeList"><button class="btn btn-default">목록</button></a>
    </div>
</div>
</body>
</html>