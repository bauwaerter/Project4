<%-- 
    Document   : task2
    Created on : Nov 14, 2014, 8:19:16 PM
    Author     : Brandon Auwaerter
--%>
<%@include file='top.jsp' %>


<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<%@ page import="sean.*" %>
<%!
// load data
    int i = 0;
    AttributeSel attributes = new AttributeSel();


%>

<div class="panel panel-info">
    <div class="panel-heading" style="color:black;font-weight: bolder">Regression Analysis</div>
    <div class="panel-body" style="text-align: center">
        <textarea  style="width: 600px;height: 354px; font-weight: bold;" readonly="readonly">
            <%= attributes.output%>
        </textarea>
    </div>
</div>

<%@include file='footer.jsp' %>
<script>
    $(document).ready(function () {

    });

</script>

