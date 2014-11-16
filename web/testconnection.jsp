<%-- 
    Document   : testconnection
    Created on : Nov 15, 2014, 10:54:23 PM
    Author     : Brandon Auwaerter
--%>

<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<html>
<head>
<title>JSTL sql:query Tag</title>
</head>
<body>
 
<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://216.70.85.35"
     user="class"  password="healthcare"/>

<sql:query dataSource="${snapshot}" var="result">
    SELECT * from hw.hw limit 10;
</sql:query>
 
<table border="1" width="100%">
<tr>
<th>Age</th>
</tr>
<c:forEach var="row" items="${result.rows}">
<tr>
<td><c:out value="${row.AGE}"/></td>

</tr>
</c:forEach>
</table>

</body>
</html>
