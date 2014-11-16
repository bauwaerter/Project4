<%-- 
    Document   : welcome
    Created on : Nov 14, 2014, 9:13:47 PM
    Author     : Brandon Auwaerter
--%>



<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>

<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet"/>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
    try {
            String connectionURL = "jdbc:mysql://216.70.85.35";
            Connection connection = null; 
            Class.forName("com.mysql.jdbc.Driver").newInstance(); 
            connection = DriverManager.getConnection(connectionURL, "class", "healthcare");
            if(!connection.isClosed())
                 out.println("Successfully connected to " + "MySQL server using TCP/IP...");
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery("Select * from hw.hw limit 50;");
            while (rs.next()) {
                String coffeeName = rs.getString("AGE");
                System.out.println(coffeeName);
            }
            connection.close();
        }catch(Exception ex){
            out.println("Unable to connect to database"+ex);
        }  
    %>
    <nav class="navbar navbar-default" role="navigation">
        <div class="container-fluid">
          <div class="navbar-header">
              
            <!--<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">-->
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="index.jsp">Project 4</a>
          </div>
          <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
              <li><a href="task1.jsp">Task 1</a></li>
              <li><a href="task2.jsp">Task 2</a></li>
              <li><a href="task3.jsp">Task 3</a></li>
              <li><a href="task4.jsp">Task 4</a></li>
              <li><a href="task5.jsp">Task 5</a></li>
              <li><a href="testconnection.jsp">Test Connection</a></li>
            </ul>
          </div><!--/.nav-collapse -->
        </div><!--/.container-fluid -->
      </nav>
</html>

<script type="text/javascript">
    $(document).ready(function(){
       var selector = '.nav li';

        $(selector).on('click', function(){
            $(selector).removeClass('active');
            $(this).addClass('active');
        });
    });
        
</script>