<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Success LectureMember</title>
</head>
<body>
	<h1>강좌 결제 성공</h1>
	<table border="1">
		<tr>
			<td>강좌명</td>
			<td>${itemName}</td>
		</tr>
		<tr>
			<td>금액</td>
			<td>${amount.total}</td>
		</tr>
		<tr>
			<td>부가세</td>
			<td>${amount.vat}</td>
		</tr>
	</table>
	<a href=""><button>마이페이지</button></a>
</body>
</html> 