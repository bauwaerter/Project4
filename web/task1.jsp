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
<html>
    <jsp:include page="navbar.jsp"/>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Task 1</title>
    </head>
    
    
    <body>
        <div class="panel panel-info">
            <div class="panel-heading">
                Task 1
            </div>
            <div class="panel-body">
                <form role="form">
            <div class="form-group">
                
              <label for="age_group">Age Group</label>
              <div class="col-md-offset-3 col-md-4">
              <select id="age_group" class="form-control">
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
                <option value="6">6</option>
                <option value="7">7</option>
                <option value="8">8</option>
                <option value="9">9</option>
               </select>
                </div>
            </div>
            <div class="form-group">
              <label for="gender">Gender</label>
              <div class="col-md-offset-3 col-md-4">
              <select id="gender" class="form-control">
                   <option value="M">M</option>
                    <option value="F">F</option>
              </select>
              </div>
            </div>
            <div class="form-group">
              <label for="admission_code">Admission Code</label>
              <div class="col-md-offset-3 col-md-4">
              <select id="admission_code" class="form-control">
                <option value="something">something</option>
                <option value="else">else</option>
               </select>
              </div>
            </div>
            <div class="col-md-offset-5">
            <button type="submit" class="btn btn-success">Submit</button>
            </div>
            </div>
        </div>
        
        
        
      </form>
      
      <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
        url="jdbc:mysql://216.70.85.35" user="class"  password="healthcare"/>
                
      <sql:query dataSource="${snapshot}" var="result">
        SELECT * from hw LIMIT 50;
      </sql:query>
 
    <table border="1" width="100%">
        <tr>
        <th>AGE</th>
        
        </tr>
        <c:forEach var="row" items="${result.rows}">
        <tr>
            <td><c:out value="${row.AGE}"/></td>
        </tr>
        </c:forEach>
    </table>
        
        
        
    </body>
</html>

<script>
    $(document).ready(function(){
       
    });
        
</script>




