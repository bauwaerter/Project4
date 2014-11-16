
<%--<%@page import="/Task1Servlet"%>--%>
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
               
                <form action="/Task1Servlet" method="post">  
                    <div class="form-group">

                      <label for="age_group">Age Group</label>
                      <div class="col-md-offset-3 col-md-4">
                      <select id="age_group" name="age_group" class="form-control">
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
                      <select id="gender" name="gender" class="form-control">
                           <option value="M">M</option>
                            <option value="F">F</option>
                      </select>
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="admission_code">Admission Code</label>
                      <div class="col-md-offset-3 col-md-4">
                      <select id="admission_code" name="admission_code" class="form-control">
                        <option value="something">something</option>
                        <option value="else">else</option>
                       </select>
                      </div>
                    </div>
                <div class="col-md-offset-5">
                    <button type="submit" class="btn btn-success">Submit</button>
                </div>
                </form>
            </div>
        </div>
           
    </body>
</html>






