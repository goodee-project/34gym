<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="description" content="Gym Template">
    <meta name="keywords" content="Gym, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Oswald:300,400,500,600,700&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/flaticon.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/barfiller.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css">
</head>
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
		
		$('#verifCodeCheck').click(function(){
			console.log("verifCodeCheck click!");
			console.log($('#memberMail').val());
			console.log($('#verifCode').val());
			$.ajax({
				type: 'post',
				url: '/gym/verifCodeCheck',
				data: {
					memberMail : $('#memberMail').val(),
					verifCode : $('#verifCode').val()
				},
				success:function(data){
					if(data==0){
						alert("인증번호가 틀렸습니다.");
						$('#verifCodeMessage').html("");
						$('#addMemberBtn').attr("disabled", true);
					} else {
						$('#verifCodeMessage').html("인증 완료");
						$('#verifCodeMessage').css({color:"green"});
						$('#addMemberBtn').removeAttr("disabled");
					}
					
				}
			});
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

<body>
	<!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

	<!-- mainMenu -->
	<jsp:include page="/WEB-INF/view/inc/navBar.jsp"></jsp:include>

	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-section set-bg"
		data-setbg="${pageContext.request.contextPath}/img/breadcrumb-bg.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb-text">
						<h2>My Page</h2>
						<div class="bt-option">
							<a href="${pageContext.request.contextPath}/">Home</a> <a
								href="${pageContext.request.contextPath}/member/getMemberMyPage">My
								Page</a> <span>LectureListByMember</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->

	<!-- Blog Section Begin -->
    <section class="blog-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-10 p-0">
					<div class="section-title chart-title">
						<h2>회원 가입</h2>
					</div>
					<div class="chart-table">
						<form id="addMemberForm" action="${pageContext.request.contextPath}/addMember" method="post">
							<table border="1">
								<tr>
									<td>이메일</td>
									<td>
										<input type="email" name="memberMail" id="memberMail">
										&nbsp;<button class ="primary-btn" type="button" id="getMailCheck">중복 체크</button>
										&nbsp;<button class ="primary-btn" type="button" onclick="sendMail()">인증번호 보내기</button>
										<div><p id="mailCheckMessage"></p></div>
									</td>
								</tr>
								<tr>
									<td>인증번호</td>
									<td>
										<input type="text" name="verifCode" id="verifCode">
										&nbsp;<button class ="primary-btn" type="button" id="verifCodeCheck">인증번호 확인</button>
										<div><p id="verifCodeMessage"></p></div>
									</td>
								</tr>
								<tr>
									<td>이름</td>
									<td> <input type="text" name="memberName"></td>
								</tr>
								<tr>
									<td>비밀번호</td>
									<td><input type="password" onkeyup="passwordCheck()" id="memberPw" name="memberPw"></td>
								</tr>
								<tr>
									<td>비밀번호 확인</td>
									<td>
										<input type="password" onkeyup="passwordCheck()" id="memberPwCheck">
										<p id="passwordCheckMessage"></p>
									</td>
								</tr>
								<tr>
									<td rowspan="3">주소</td>
									<td>
										<input type="text" name="postCode" id="postcode" placeholder="우편번호">
										&nbsp;<input type="button" id="addressBtn" value="우편번호 찾기" class ="primary-btn">
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
									<td>핸드폰 번호 </td><td><input type="tel" name="memberPhone"></td>
								</tr>
							</table>
							<button class ="primary-btn" type="button" id="addMemberBtn">회원 가입</button>
							<button class ="primary-btn" type="button" onclick='history.back()'>뒤로 가기</button>
						</form>
					</div>
				</div>           
   			</div>
        </div>
   </section>
   <!-- Blog Section End -->

	<!-- Footer Start -->
	<jsp:include page="/WEB-INF/view/inc/footer.jsp"></jsp:include>
	<!-- Footer End -->

	<!-- Js Plugins -->
	<script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.magnific-popup.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/masonry.pkgd.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.barfiller.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.slicknav.js"></script>
	<script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/main.js"></script>
</body>
</html>