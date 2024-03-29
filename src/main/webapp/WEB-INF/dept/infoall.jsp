<%@page import="java.util.List"%>
<%@page import="webapp.model.Dept"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta charset=UTF-8">
<title>infoall.jsp</title>
<style type="text/css">
table {
	border: 1px solid red;
	border-collapse: collapse;
	/* 		margin: 50px auto */
}

th, td {
	border: 1px dotted blue;
	padding: 10px
}
td:HOVER {
	background-color: orange;
}
</style>
<script type="text/javascript">
window.onload = function() {
	var tds = document.querySelectorAll("td");
	
	for (var i = 0; i < tds.length; i++) {
		tds[i].onclick = function() {
			if(this.style.color != "red")
				this.style.color = "red";
			else
				this.style.color = "black";
		};
	}
}
</script>
</head>
<body>
	<hr>
	<h1>부서 정보 (all)</h1>
	<hr>
	<%
		List<Dept> list = (List<Dept>) request.getAttribute("model");
	%>
	<table>
		<tr>
			<th>deptno</th>	<th>dname</th>	<th>loc</th>
			<%
				for (Dept d : list) {
					out.println("<tr><td>" + d.getDeptno() + "</td><td>"+ d.getDname() + "</td><td>" + d.getLoc()+ "</td></tr><br>");
				}
			%>
	</table>
	<hr>
	
	<table>
		<tr>
			<th>deptno</th>	<th>dname</th>	<th>loc</th>
		</tr>
		<c:forEach var="d" items="${requestScope.model}">
			<tr>
				<td>${pageScope.d.deptno}</td>
				<td>${pageScope.d.dname}</td>
				<td>${pageScope.d.loc}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>