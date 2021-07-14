<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>findMemberPwForm</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		console.log("ready!");
		$('#verifCodeCheck').click(function() {
			console.log("verifCodeCheck click!");
			console.log($('#memberMail').val());
			console.log($('#verifCode').val());
			$.ajax({
				type : 'post',
				url : '/gym/verifCodeCheck',
				data : {
					memberMail : $('#memberMail').val(),
					verifCode : $('#verifCode').val()
				},
				success : function(data) {
					if (data == 0) {
						alert("인증번호가 틀렸습니다.");
						$('#verifCodeMessage').html("");
					} else {
						$('#verifCodeMessage').html("인증 완료");
						$('#verifCodeMessage').css({
							color : "green"
						});
						$('#findMemberBtn').removeAttr("disabled");
					}
				}
			});
		});
		$('#findMemberBtn').click(function() {
			console.log("findMemberBtn click!");
			$('#findMemberPwForm').submit();
		});
	});

	function sendMail() {
		console.log("실행");
		
		let mail = $('#memberMail').val()
		console.log("mail : " + mail);
		
		let check = isMail(mail);
		console.log("check : " + check);

		if (check == true) {
			console.log("이메일입니다");
			$.ajax({
				type : 'post',
				url : '/gym/getMailAuth',
				data : {
					userMail : mail
				},
				success : function(data) {
				},
				error : function(e) {
					alert('오류입니다');
				}
			});
		} else {
			alert('이메일 형식에 맞게 작성해주세요');
		}
	}
	function isMail(Val) {
		let regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		return regExp.test(Val);
	}
</script>
</head>
<body>
	<h1>비밀번호 찾기</h1>
	<form id="findMemberPwForm" action="${pageContext.request.contextPath}/findMemberPw" method="post">
		<table border="1">
			<tr>
				<td>Email : <input type="email" id="memberMail" name="memberMail">
					<button type="button" onclick="sendMail()">인증번호 보내기</button>
				</td>
			</tr>
			<tr>
				<td>인증번호 : <input type="text" name="verifCode" id="verifCode">
					<button type="button" id="verifCodeCheck">인증번호 확인</button>
					<div>
						<p id="verifCodeMessage"></p>
					</div>
				</td>
			</tr>
		</table>
		<button type="button" id="findMemberBtn" disabled="disabled">비밀번호 찾기(이메일로 임시비밀번호가 전송됩니다)</button>
	</form>
</body>
</html>