<%-- 
    Document   : task2
    Created on : Nov 14, 2014, 8:19:16 PM
    Author     : Brandon Auwaerter
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://216.70.85.35"
     user="class"  password="healthcare"/>

<sql:query dataSource="${snapshot}" var="result">
    SELECT * from hw.hw limit 10;
</sql:query>
<!DOCTYPE html>
<html>
    <jsp:include page="navbar.jsp"/>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Task 2</title>
    </head>
    <body>
        <h1>Task 2</h1>
    </body>
</html>


<script>
    $(document).ready(function(){
       
    });
        
</script>