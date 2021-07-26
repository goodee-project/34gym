<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPage</title>
</head>
<body>
   <div>
      <ul>
         <li><a href="${pageContext.request.contextPath}/">마이페이지</a></li>
         <li><a href="${pageContext.request.contextPath}/">회원수정</a></li>
         <li><a href="${pageContext.request.contextPath}/">인바디조회</a></li>
         <li><a href="${pageContext.request.contextPath}/">운동이용권조회</a></li>
         <li><a href="${pageContext.request.contextPath}/member/getLectureByMemberList">강좌구매조회</a></li>
         <li><a href="${pageContext.request.contextPath}/member/getBuildingList">건물등록조회</a></li>
         <li><a href="${pageContext.request.contextPath}/member/getPermissionList">지점신청조회</a></li>
         <li><a href="${pageContext.request.contextPath}/">강사지원신청조회</a></li>
         <li><a href="${pageContext.request.contextPath}/member/removeMemberForm">회원탈퇴</a></li>
      </ul>
   </div>
</body>
</html>