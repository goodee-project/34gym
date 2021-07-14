<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>removeMemberForm</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
   $(document).ready(function(){
      console.log("removeMember Ready!");
      
      $('#removeMemberBtn').click(function(){
         console.log("removeMemberBtn click!");
         $('#removeMemberForm').submit();
      });
   });
</script>
</head>
<body>
   <h1>removeMemberForm</h1>
   <form id="removeMemberForm" action="${pageContext.request.contextPath}/removeMember" method="post">
      <input type="hidden" name="memberMail" value="${loginMember.memberMail}">
      <table border="1">
         <tr>
            <td>아이디 : ${loginMember.memberMail}</td>
         </tr>
         <tr>
            <td>비밀번호 : <input type="password" name="memberPw"></td>
         </tr>
      </table>
      <button type="button" id="removeMemberBtn">탈퇴</button>
      <button type="button" onclick="history.back()">취소</button>
   </form>
</body>
</html>
