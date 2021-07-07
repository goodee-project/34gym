<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ContractList</title>
</head>
<body>
	<h1>지점 계약조건</h1>
	<table>
		<tr>
			<th>contractId</th>
			<th>adminId</th>
			<th>contractName</th>
			<th>contractLoyalty</th>
			<th>contractDuration</th>
			<th>contractDeposit</th>
			<th>lastUpdate</th>
		</tr>
		<c:forEach var="c" items="${contractList}">
			<tr>
				<td>${c.contractId}</td>
				<td>${c.adminId}</td>
				<td>${c.contractName}</td>
				<td>${c.contractLoyalty}</td>
				<td>${c.contractDuration}</td>
				<td>${c.contractDeposit}</td>
				<td>${c.lastUpdate}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>