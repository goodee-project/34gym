<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TrainerRecruitment</title>
</head>
<body>
	<!-- 메뉴 네비게이션 바 -->
    <jsp:include page="/WEB-INF/view/inc/BranchNavBar.jsp"></jsp:include>
    
	<h1>강사채용 상세보기</h1>
	
	<table border="1">
         <tbody>
			<tr>
                <td>강사채용 번호</td>
                <td>${trainerRecruitmentMap.trainerApplicationId}</td>
            </tr>
            <tr>
                <td>사진</td>
                <td>${trainerRecruitmentMap.resumeImg}</td>
            </tr>
            <tr>
                <td>지점명</td>
                <td>${trainerRecruitmentMap.branchName}</td>
            </tr>
            <tr>
                <td>분야</td>
                <td>${trainerRecruitmentMap.type}</td>
            </tr>
            <tr>
                <td>이름</td>
                <td>${trainerRecruitmentMap.memberName}</td>
            </tr>
            <tr>
                <td>E-Mail</td>
                <td>${trainerRecruitmentMap.memberMail}</td>
            </tr>
            <tr>
                <td>주소</td>
                <td>${trainerRecruitmentMap.memberAddress}</td>
            </tr>
            <tr>
                <td>전화번호</td>
                <td>${trainerRecruitmentMap.memberPhone}</td>
            </tr>
            <tr>
                <td>경력</td>
                <td>${trainerRecruitmentMap.career}</td>
            </tr>
            <tr>
                <td>자격증</td>
                <td>${trainerRecruitmentMap.certificate}</td>
            </tr>
            <tr>
                <td>입사일</td>
                <td>${trainerRecruitmentMap.joinDate}</td>
            </tr>
            <tr>
                <td>퇴사일</td>
                <td>${trainerRecruitmentMap.retireDate}</td>
            </tr>
        </tbody>
    </table>
</body>
</html>