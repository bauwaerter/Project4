<%-- 
    Document   : task1
    Created on : Nov 14, 2014, 8:19:04 PM
    Author     : Brandon Auwaerter
--%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Task 1</title>
</head>
<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
        url="jdbc:mysql://216.70.85.35/hw" user="class"  password="healthcare"/>

<%@include file="navbar.jsp" %>

<body style="width:100%;">
    <div class="panel panel-info">
        <div style="padding-left:50px; padding-right:50px; class="panel-body">
     
