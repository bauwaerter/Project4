<%@include file="top.jsp" %>
<div class="panel panel-info">
    <div class="panel-heading">
        Task 1.1
    </div>
    <div class="panel-body">
    <hr>
    <sql:query dataSource="${snapshot}" var="codes">
        SELECT DISTINCT ADMITTING_DIAGNOSIS_CODE FROM hw;
    </sql:query>
    <form action="task1.jsp" method="POST" role="form">
        <div class="form-group">

          <label for="age_group">Age Group</label>
          <div class="col-md-offset-3 col-md-4">
          <select name="age_group" id="age_group">
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            <option selected=selected value="5">5</option>
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
          <select name="gender" id="gender">
               <option value="1">M</option>
                <option value="2">F</option>
          </select>
          </div>
        </div>
        <div class="form-group">
          <label for="admission_code">Admission Code</label> (TRY 5, 1, 78605)
          <div class="col-md-offset-3 col-md-4">
              <select name="admission_code" id="admission_code">
                <c:forEach var="row" items="${codes.rows}">
                    <option value="${row.ADMITTING_DIAGNOSIS_CODE}"><c:out value="${row.ADMITTING_DIAGNOSIS_CODE}"/></option>
                </c:forEach> 
              </select>
          </div>
        </div>
        <div class="col-md-offset-5">
        <button type="submit" class="btn btn-success">Submit</button>
        </div>
    </form> 
    <hr>  
    <%
    if ("POST".equalsIgnoreCase(request.getMethod())) 
    {
        String age_group = request.getParameter("age_group");
        String gender = request.getParameter("gender");
        String admission_code = request.getParameter("admission_code");
        %> 
        <font size="3"><b>RESULTS:</b></font><br>
        Age: <b><%= age_group %></b> | Gender: <b><%= gender %></b> | Admission Code: <b><%= admission_code %></b><br><br>



        <sql:query dataSource="${snapshot}" var="length">
          SELECT AVG(length_of_stay) as avg FROM hw where age=<%= age_group %> and sex=<%= gender %> and ADMITTING_DIAGNOSIS_CODE=<%= admission_code %>;
        </sql:query>

        <sql:query dataSource="${snapshot}" var="lengthALL">
          SELECT AVG(length_of_stay) as avg FROM hw where age=<%= age_group %> and sex=<%= gender %>;
        </sql:query>

        <sql:query dataSource="${snapshot}" var="disc">
          select DISCHARGE_STATUS, (count(*)/(select count(*) from hw))*100 as result from hw where age=<%= age_group %> and sex=<%= gender %> and ADMITTING_DIAGNOSIS_CODE=<%= admission_code %>  group by DISCHARGE_STATUS;
        </sql:query>

        <sql:query dataSource="${snapshot}" var="discALL">
          select DISCHARGE_STATUS, (count(*)/(select count(*) from hw))*100 as result from hw where age=<%= age_group %> and sex=<%= gender %> group by DISCHARGE_STATUS;
        </sql:query>

        <sql:query dataSource="${snapshot}" var="totalcharges">
          SELECT AVG(TOTAL_CHARGES) as total FROM hw where age=<%= age_group %> and sex=<%= gender %> and ADMITTING_DIAGNOSIS_CODE=<%= admission_code %> 
        </sql:query>

        <sql:query dataSource="${snapshot}" var="totalchargesALL">
          SELECT AVG(TOTAL_CHARGES) as total FROM hw where age=<%= age_group %> and sex=<%= gender %>;
        </sql:query>

        <b>Task 1.1.1</b>  
        <table class="table" border="1" width="400px">
                <th width="300px">Average Length Of Stay for Code <%= admission_code %>: </th>
                <c:forEach var="row" items="${length.rows}">
                    <td width="100px"><c:out value="${row.avg}"/></td>
                    <c:set var="avglen" value="${row.avg}" />
                </c:forEach> 
        </table>
               
        <table class="table" border="1" width="400px">
                <th width="300px">Average Length Of Stay for ALL: </th>
                <c:forEach var="row" items="${lengthALL.rows}">
                    <td width="100px"><c:out value="${row.avg}"/></td>
                    <c:set var="alllen" value="${row.avg}" />
                </c:forEach>
        </table>
                
        <table class="table" border="1" width="400px">
                <th width="300px">Deviation Ratio: </th>
                    <td width="100px">${alllen/avglen}</td>
        </table>
        <table class="table" border="1" width="400px">
                <th width="300px">Absolute Difference: </th>
                    <td width="100px">${alllen-avglen}</td>
        </table>
                 

        <br><br>

        <b>Task 1.1.2</b>  
        <table class="table" border="1" width="400px">
                <th width="300px">Discharge Status for Code <%= admission_code %>: </th>
                <c:forEach var="row" items="${disc.rows}">
                    <td width="100px">
                        <c:if test="${row.DISCHARGE_STATUS == 'A'}">
                            <c:set var="adisccode" value="${row.result}" />
                            <c:set var="hasa" value="yes" />
                        </c:if>
                        <c:if test="${row.DISCHARGE_STATUS == 'B'}">
                            <c:set var="bdisccode" value="${row.result}" />
                            <c:set var="hasb" value="yes" />
                        </c:if>
                        <c:out value="${row.DISCHARGE_STATUS}"/>: <c:out value="${row.result}"/>
                    </td>
                </c:forEach> 
        </table>
                
        <table class="table" border="1" width="400px">
                <th width="300px">Discharge Status for ALL</th>
                <c:forEach var="row" items="${discALL.rows}">
                        <c:if test="${row.DISCHARGE_STATUS == 'A'}">
                            <c:if test="${hasa == 'yes'}">
                                <c:set var="adiscall" value="${row.result}" />
                                    <td width="100px">
                                        <c:out value="${row.DISCHARGE_STATUS}"/>: <c:out value="${row.result}"/>
                                    </td>
                            </c:if>
                        </c:if>
                        <c:if test="${row.DISCHARGE_STATUS == 'B'}">
                            <c:if test="${hasb == 'yes'}">
                                <c:set var="bdiscall" value="${row.result}" />
                                    <td width="100px">
                                        <c:out value="${row.DISCHARGE_STATUS}"/>: <c:out value="${row.result}"/>
                                    </td>
                            </c:if>
                        </c:if>
                </c:forEach> 
        </table>

        <table class="table" border="1" width="400px">
                <th width="300px">Deviation Ratio: </th>
                    <c:if test="${adisccode  > 0}">
                        <td width="100px">A: ${adiscall/adisccode}</td>
                    </c:if>
                    <c:if test="${bdisccode >  0}">
                    <td width="100px">B: ${bdiscall/bdisccode}</td>
                    </c:if>
        </table>
        <table class="table" border="1" width="400px">
                <th width="300px">Absolute Difference: </th>
                    <c:if test="${adiscall > 0}">
                    <td width="100px">A: ${adiscall-adisccode}</td>
                    </c:if>
                    <c:if test="${bdiscall > 0}">
                    <td width="100px">B: ${bdiscall-bdisccode}</td>
                    </c:if>
        </table>

        <br><br>

        <b>Task 1.1.3</b>  
        <table class="table" border="1" width="400px">
                <th width="300px">Average Total Cost for Code <%= admission_code %>: </th>
                <c:forEach var="row" items="${totalcharges.rows}">
                    <td width="100px"><c:out value="${row.total}"/></td>
                    <c:set var="totalcharges" value="${row.total}" />
                </c:forEach> 
        </table>
        <table class="table" border="1" width="400px">
                <th width="300px">Average Total Cost for ALL</th>
                <c:forEach var="row" items="${totalchargesALL.rows}">
                    <td width="100px"><c:out value="${row.total}"/></td>
                    <c:set var="totalchargesall" value="${row.total}" />
                </c:forEach> 
        </table>
                
        <table class="table" border="1" width="400px">
                <th width="300px">Deviation Ratio: </th>
                    <td width="100px">${totalchargesall/totalcharges}</td>
        </table>
        <table class="table" border="1" width="400px">
                <th width="300px">Absolute Difference: </th>
                    <td width="100px">${totalchargesall-totalcharges}</td>
        </table>
        
        <br><br>
        <%        
    } 
    else 
    {
        // It may be a GET request.
    }
    %>
    <a href="task12.jsp">Click Here for Task 1.2</a>
    </div>   
</div>
<%@include file="footer.jsp" %>

<script>
    $(document).ready(function(){
       $('select').select2({
           width: '100%',
       }); 
    });
</script>

