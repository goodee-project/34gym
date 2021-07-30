<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPage</title>
</head>
<body>
   <div class="">
	   <div class="sidebar-option">
		   <div class="so-categories">
		      <h5 class="title"><a href="${pageContext.request.contextPath}/member/getMemberMyPage">My Page</a></h5>
		      <ul>
		         <li><a href="${pageContext.request.contextPath}/member/modifyMemberForm">회원수정</a></li>
		         <li><a href="${pageContext.request.contextPath}/member/getMembershipMemberInbodyList">운동 인바디조회</a></li>
		         <li><a href="${pageContext.request.contextPath}/member/getLectureMemberInbodyList">강좌 인바디조회</a></li>
		         <li><a href="${pageContext.request.contextPath}/member/getMembershipByMember">운동이용권조회</a></li>
		         <li><a href="${pageContext.request.contextPath}/member/getLectureByMemberList">강좌구매조회</a></li>
		         <li><a href="${pageContext.request.contextPath}/member/getBuildingList">건물등록조회</a></li>
		         <li><a href="${pageContext.request.contextPath}/member/getPermissionList">지점신청조회</a></li>
		         <li><a href="${pageContext.request.contextPath}/member/getResumeListById">이력서조회</a></li>
		         <li><a href="${pageContext.request.contextPath}/">강사지원신청조회</a></li>
		         <li><a href="${pageContext.request.contextPath}/member/removeMemberForm">회원탈퇴</a></li>
		      </ul>
		   </div>
	   </div>
   </div>
</body>
</html>