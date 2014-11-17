<%-- 
    Document   : task1
    Created on : Nov 14, 2014, 8:19:04 PM
    Author     : Brandon Auwaerter
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@ page import="java.io.*,java.util.*,java.sql.*"%>
        <%@ page import="javax.servlet.http.*,javax.servlet.*" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet"/>
        <script src="js/libs/jquery/jquery.js" type="text/javascript"></script>
</head>
<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
        url="jdbc:mysql://216.70.85.35/hw" user="class"  password="healthcare"/>

<body style="padding-left:50px; padding-right:50px; width:100%;">
<%@include file="navbar.jsp" %>
