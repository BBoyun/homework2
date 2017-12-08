<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>이수 구분별 학점 조회</title>
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
	<h2>이수 구분별 학점 조회</h2>
	<hr>
	<table border="1">
		<thead>
			<tr>
				<th>교필</th>
				<th>핵교A</th>
				<th>핵교B</th>
				<th>일교</th>
				<th>자율</th>
				<th>전지</th>
				<th>전기</th>
				<th>전선</th>
				<th>총학점</th>
			</tr>
		</thead>
		<tr>
			<td><c:out value="${credits.get('교필')}"></c:out></td>
			<td><c:out value="${credits.get('핵교A')}"></c:out></td>
			<td><c:out value="${credits.get('핵교B')}"></c:out></td>
			<td><c:out value="${credits.get('일교')}"></c:out></td>
			<td><c:out value="${credits.get('자율')}"></c:out></td>
			<td><c:out value="${credits.get('전지')}"></c:out></td>
			<td><c:out value="${credits.get('전기')}"></c:out></td>
			<td><c:out value="${credits.get('전선')}"></c:out></td>
			<td><c:out value="${credits.get('총학점')}"></c:out></td>
		</tr>
	</table>
</body>
</html>