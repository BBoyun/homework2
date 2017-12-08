<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>학사정보시스템</title>

</head>

<style>
body {
	background-color: lightblue;
}

h1 {
	color: white;
	text-align: center;
}

p {
	font-family: verdana;
	font-size: 20px;
}

button {
	align-self: center;
}

.button {
	background-color: #4CAF50; /* Green */
	border: none;
	color: white;
	padding: 16px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	-webkit-transition-duration: 0.4s; /* Safari */
	transition-duration: 0.4s;
	cursor: pointer;
}

.button1 {
	background-color: white;
	color: black;
	border: 2px solid #4CAF50;
}

.button1:hover {
	background-color: #4CAF50;
	color: white;
}

.center {
	height: 200px;
	position: relative;
	border: 3px solid green;
	text-align: center;
}

.center p {
	margin: 0;
	position: absolute;
	top: 50%;
	left: 50%;
	-ms-transform: translate(-50%, -50%);
	transform: translate(-50%, -50%);
}

.center ul {
	display: inline-block;
	margin: 3;
	padding: 3;
	zoom: 1;
	*display: inline;
}

.center li {
	float: left;
	padding: 2px 5px;
}

.center button {
	
}
</style>

<body>

	<h1>한성대학교 종합정보시스템</h1><br>
	
	<div class="center">

		<ul>
			<li><a href="${pageContext.request.contextPath}/semesterSearch">학기별 이수 학점 조회</a><br></li><br><br>
			<li><a href="${pageContext.request.contextPath}/classificationSearch">구분별 학점 조회</a><br></li><br><br>
			<li><a href="${pageContext.request.contextPath}/enrollment">수강신청하기</a><br></li><br><br>
			<li><a href="${pageContext.request.contextPath}/enrollmentSearch">수강 신청조회</a><br></li><br><br>
		</ul>

	</div>

	<center>
		<c:if test="${pageContext.request.userPrincipal.name != null}">
			<button type="button" class="button button1" onclick="javascript:document.getElementById('logout').submit()">Logout</button>
		</c:if>

		<form id="logout" action="<c:url value="/logout"/>" method="post">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		</form>
	</center>

</body>
</html>

