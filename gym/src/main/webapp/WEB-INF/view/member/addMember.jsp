<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addMember</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
	
	$(document).ready(function(){
		console.log("ready!");
		
		$('#addressBtn').click(function(){
		    new daum.Postcode({
		        oncomplete: function(data) {
		        	 // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                let addr = ''; // 주소 변수
	                let extraAddr = ''; // 참고항목 변수

	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }

	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    document.getElementById("extraAddress").value = extraAddr;
	                
	                } else {
	                    document.getElementById("extraAddress").value = '';
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('postcode').value = data.zonecode;
	                document.getElementById("address").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("detailAddress").focus();
		        }
		    }).open();
		})
		
		$('#getMailCheck').click(function(){
			console.log("getMailCheck");
			$.ajax({
				type: 'post',
				url: '/gym/getMailCheck',
				data: {
					memberMail : $('#memberMail').val()
				},
				success:function(data){
					console.log("ajax 확인");
					console.log(data);
					if(data == ''){
						$('#mailCheckMessage').html("아이디 사용가능합니다.");
						$('#mailCheckMessage').css({color:"green"});
						$('#addMemberBtn').removeAttr("disabled");
					}
					else {
						$('#mailCheckMessage').html("아이디 불사용가능합니다.");
						$('#mailCheckMessage').css({color:"red"});
						$('#addMemberBtn').attr("disabled", true);
					}
				}
			});
		});
		
		$('#addMemberBtn').click(function(){
			console.log("addMemberBtn click");
			$('#addMemberForm').submit();
		});
	});
	
	function sendMail(){
		console.log("실행");
		
		let mail = $('#memberMail').val();
		console.log("mail : " + mail);
		
		let check = isMail(mail);
		console.log("check : " + check);
		
		if(check == true){
			console.log("이메일입니다");
			$.ajax({
				type: 'post',
				url: '/gym/getMailAuth',
				data:{
					userMail : mail
				},
				success:function(data){},
				error:function(e){
					alert('오류입니다');
				}
			});
		} else {
			alert('이메일 형식에 맞게 작성해주세요');
		}
	}
	
	function isMail(Val){
		let regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		return regExp.test(Val);
	}
	
	function passwordCheck(){
		console.log("paaswordCheck");
		
		let password = $('#memberPw').val();
		let passwordCheck = $('#memberPwCheck').val();
		
		console.log(password);
		console.log(passwordCheck);
		
		if(password != passwordCheck && passwordCheck != ''){
			console.log("같지 않다");
			$('#passwordCheckMessage').html("비밀번호가 불일치합니다");
			$('#passwordCheckMessage').css({color:"red"});
			$('#addMemberBtn').attr("disabled", true);
		} 
			
		if(password == passwordCheck){
			console.log("같다");
			$('#passwordCheckMessage').html("비밀번호가 일치합니다");
			$('#passwordCheckMessage').css({color:"green"});
			$('#addMemberBtn').removeAttr("disabled");
		}
	};
</script>
</head>
<body>
	<h1>회원 가입</h1>
	<form id="addMemberForm" action="${pageContext.request.contextPath}/addMember" method="post">
		<table border="1">
			<tr>
				<td>이메일 : 
					<input type="email" name="memberMail" id="memberMail">
					<button type="button" id="getMailCheck">중복 체크</button>
					<button type="button" onclick="sendMail()">인증번호 보내기</button>
					<div><p id="mailCheckMessage"></p></div>
				</td>
			</tr>
			<tr>
				<td>
					인증번호 :
					<input type="text">
					<button type="button" id="getAuthMail">인증번호 확인</button>
				</td>
			</tr>
			<tr>
				<td>이름 : <input type="text" name="memberName"></td>
			</tr>
			<tr>
				<td>비밀번호 : <input type="password" onkeyup="passwordCheck()" id="memberPw" name="memberPw"></td>
			</tr>
			<tr>
				<td>비밀번호 확인 : 
					<input type="password" onkeyup="passwordCheck()" id="memberPwCheck">
					<p id="passwordCheckMessage"></p>
				</td>
			</tr>
			<tr>
				<td>
					<input type="text" name="postCode" id="postcode" placeholder="우편번호">
					<input type="button" id="addressBtn" value="우편번호 찾기" class="d_btn">
				</td>
			</tr>
			<tr>
				<td><input type="text" name="memberAddress" id="address" placeholder="주소"></td>
			</tr>
			<tr>
				<td>
					<input type="text" name="memberDetailAddress" id="detailAddress" class="d_form" placeholder="상세주소">
					<input type="text" name="memberExtraAddress" id="extraAddress" class="d_form" placeholder="참고항목">
				</td>
			</tr>
			<tr>
				<td>핸드폰 번호 : <input type="tel" name="memberPhone"></td>
			</tr>
		</table>
		<button type="button" id="addMemberBtn">회원 가입</button>
	</form>
</body>
</html>