<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addPermissionForm</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		console.log("addPermissionForm ready");
		
		$.ajax({
			type: 'get',
			url: '/gym/getBuildingList',
			data:{
				memberId : ${memberId}
			},
			success:function(json){
				console.log("json 확인");
				$('#buildingList').append('<option value="">건물 목록</option>');
				$(json).each(function(index, item){
					$('#buildingList').append('<option value="'+item.buildingId+'">'+item.buildingAddress + " " + item.buildingDetail +"</option>");
				});
			}
		});
		
		$.ajax({
			type: 'get',
			url: '/gym/getContractList',
			success:function(json){
				console.log("json 확인");
				$('#getContractList').append('<option value="">계약조건</option>');
				$(json).each(function(index, item){
					$('#contractList').append('<option value="'+item.contractId+'">'+ item.contractName +"</option>");
				});
			}
		});
		
		$('#addPermissionBtn').click(function(){
			console.log("addPermissionBtn");
			$('#addPermissionForm').submit();
		});
	});
</script>
</head>
<body>
	<h1>지점신청</h1>
	<div>
		<form id="addPermissionForm" action="${pageContext.request.contextPath}/addPermission" method="post">
			<table border="1">
				<tr>
					<td>건물</td>
					<td><select id="buildingList" name="buildingId"></select></td>
				</tr>
				<tr>
					<td>계약조건</td>
					<td><select id="contractList" name="contractId"></select></td>
				</tr>
				<tr>
					<td>설명</td>
					<td><textarea name="description" rows="8" cols="100" placeholder="지점신청 내용작성"></textarea></td>
				</tr>
			</table>
			<button type="button" id="addPermissionBtn">지점 신청</button>
			<button type="button" onclick='history.back()'>취소</button>
		</form>
	</div>
</body>
</html>