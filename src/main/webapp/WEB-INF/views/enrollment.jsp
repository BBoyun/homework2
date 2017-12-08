<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>수강 신청 하기</title>
</head>
<style>
table, td, th {    
    border: 2px solid black;
    text-align: center;
}

table {
    width: 30%;
}

.label {
    background-color: #4CAF50;
    color: white;
}

th, td {
    padding: 10px;
}

.error {
    color: red;
}

</style>

<body>
<h2>수강 신청</h2>
	<hr>
	
	<sf:form method="post" action="${pageContext.request.contextPath}/doenrollment" modelAttribute="course">
		<table class="formtable">
			<tr>
				<td class="label">년도 :</td>
				<td><sf:input class="control" path="year" type="text" value="2018"/><br/>
				<sf:errors cssClass="error" path="year"></sf:errors></td>
			</tr>
			<tr>
				<td class="label">학기 :</td>
				<td><sf:input class="control" path="semester" type="text" value="1"/><br/>
				<sf:errors cssClass="error" path="semester"></sf:errors></td>
			</tr>
			<tr>
				<td class="label">과목 코드 :</td>
				<td><sf:input class="control" path="subjectCode" type="text" /><br/>
				<sf:errors cssClass="error" path="subjectCode"></sf:errors></td>
			</tr>
			<tr>
				<td class="label">과목명 :</td>
				<td><sf:input class="control" path="subject" type="text" /><br/>
				<sf:errors cssClass="error" path="subject"></sf:errors></td>
			</tr>
			<tr>
				<td class="label">이수 구분 :</td>
				<td><sf:input class="control" path="classification" type="text" /><br/>
				<sf:errors cssClass="error" path="classification"></sf:errors></td>
			</tr>			
			<tr>
				<td class="label">학점 :</td>
				<td><sf:input class="control" path="credit" type="text" /><br/>
				<sf:errors cssClass="error" path="credit"></sf:errors></td>
			</tr>
			<tr>
				<td colspan="2"><input class="control" value="수강 신청" type="submit" /></td>
			</tr>
		</table>
	</sf:form>
</body>
</html>