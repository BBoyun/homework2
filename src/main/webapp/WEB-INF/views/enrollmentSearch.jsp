<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>수강 신청 조회</title>
</head>
<style>
table, td, th {    
    border: 2px solid black;
    text-align: center;
}

table {
    width: 50%;
}
th {
    background-color: #4CAF50;
    color: white;
}
th, td {
    padding: 10px;
}
</style>

<body>
	<h2>수강 신청 조회 메뉴</h2>
	<hr>
	<table>
		<thead>
			<tr>
				<th>년도</th>
				<th>학기</th>
				<th>과목코드</th>
				<th>과목명</th>
				<th>이수 구분</th>
				<th>학점</th>
			</tr>
		</thead>
		
		<tbody>
		<c:forEach var="course" items="${courses}">
			<tr>
				<c:if test="${course.year==2018&&course.semester==1}">
					<td><c:out value="${course.year}"></c:out></td>
					<td><c:out value="${course.semester}"></c:out></td>
					<td><c:out value="${course.subjectCode}"></c:out></td>
					<td><c:out value="${course.subject}"></c:out></td>
					<td><c:out value="${course.classification}"></c:out></td>
					<td><c:out value="${course.credit}"></c:out></td>
				</c:if>
			<tr>
		</c:forEach>
		</tbody>

	</table>

</body>
</html>