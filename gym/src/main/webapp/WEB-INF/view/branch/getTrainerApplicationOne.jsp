<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TrainerApplicaionOne</title>
</head>
<body>
	<!-- 메뉴 네비게이션 바 -->
    <jsp:include page="/WEB-INF/view/inc/BranchNavBar.jsp"></jsp:include>
    
	<h1>강사지원 상세보기</h1>
	
	<button type="submit">채용</button>
	<table border="1">
         <tbody>
			<tr>
                <td>강사지원 번호</td>
                <td>${trainerApplicationOne.trainerApplicationId}</td>
            </tr>
            <tr>
                <td>이름</td>
                <td>${trainerApplicationOne.memberName}</td>
            </tr>
            <tr>
                <td>Eamil</td>
                <td>${trainerApplicationOne.memberEmail}</td>
            </tr>
            <tr>
                <td>주소</td>
                <td>${trainerApplicationOne.memberAddress}</td>
            </tr>
            <tr>
                <td>전화번호</td>
                <td>${trainerApplicationOne.memberPhone}</td>
            </tr>
            <tr>
                <td>경력</td>
                <td>${trainerApplicationOne.career}</td>
            </tr>
            <tr>
                <td>분야</td>
                <td>${trainerApplicationOne.type}</td>
            </tr>
            <tr>
                <td>사진</td>
                <td>${trainerApplicationOne.resumeImg}</td>
            </tr>
            <tr>
                <td>자격증</td>
                <td>${trainerApplicationOne.certificate}</td>
            </tr>
            <tr>
                <td>자기소개서</td>
                <td>${trainerApplicationOne.resumeContent}</td>
            </tr>
            <tr>
                <td>고용형태</td>
                <td>${trainerApplicationOne.employmentType}</td>
            </tr>
            <tr>
                <td>구인게시판 제목</td>
                <td><a href="">${trainerApplicationOne.jobOpeningTitle}</a></td>
            </tr>
            <tr>
                <td>지원날짜</td>
                <td>${trainerApplicationOne.applyDate}</td>
            </tr>
            <tr>
                <td>수정날짜</td>
                <td>${trainerApplicationOne.lastUpdate}</td>
            </tr>
        </tbody>
    </table>
</body>
</html>