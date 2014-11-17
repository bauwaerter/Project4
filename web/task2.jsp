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

<%@ page import="sean.AttributeSel" %>
<%! 
// load data
 int i =0 ;
 AttributeSel attributes = new AttributeSel();
    


%>

<!DOCTYPE html>
<html>
    <jsp:include page="navbar.jsp"/>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Task 2</title>
    </head>
    <body>
        <table border="1" width="400px">
        <th width="300px">Selected Attributes </th>
        <c:forEach var="attr" items="${attributes.selected}">
            <td width="100px"><c:out value="${attr}"/></td>
        </c:forEach>
  
</table>
    </body>
</html>


<script>
    $(document).ready(function(){
       
    });
        
</script>

