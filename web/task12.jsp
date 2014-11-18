<%@include file="top.jsp" %>
<div class="row">
    <div class="col-md-offset-1 col-md-10">
<div class="panel panel-info">
    <div class="panel-heading" style="font-weight: bold; color: black;">
        Task 1.2
    </div>
    <div class="panel-body">   
        <h3>RESULTS:</h3><br/>

  
    <sql:query dataSource="${snapshot}" var="deathondisc">
    select ADMITTING_DIAGNOSIS_CODE, COUNT(DISCHARGE_STATUS)as count from hw where DISCHARGE_STATUS = 'b' GROUP BY ADMITTING_DIAGNOSIS_CODE ORDER BY COUNT(DISCHARGE_STATUS) desc LIMIT 10
    </sql:query>

    <sql:query dataSource="${snapshot}" var="mostexp">
    select ADMITTING_DIAGNOSIS_CODE, AVG(TOTAL_CHARGES) as charges from hw where DISCHARGE_STATUS = 'b' GROUP BY ADMITTING_DIAGNOSIS_CODE ORDER BY AVG(TOTAL_CHARGES) desc LIMIT 10
    </sql:query>

    <sql:query dataSource="${snapshot}" var="longest">
    select ADMITTING_DIAGNOSIS_CODE, AVG(LENGTH_OF_STAY) as los from hw where DISCHARGE_STATUS = 'b' GROUP BY ADMITTING_DIAGNOSIS_CODE ORDER BY AVG(LENGTH_OF_STAY) desc LIMIT 10
    </sql:query>
    
    <div class="row">
        <div class="col-md-offset-3">
              <h4>TOP 10 Death On Discharge ADMITTING_DIAGNOSIS_CODES</h4>
        </div>
    </div>
  
    <div class="row">
        <div class="col-md-offset-2 col-md-8">
         <table class="table table-hover table-bordered table-condensed" width="400px">
             <tr style="background-color: #d9edf7;">
                 <th>Count</th><th>Code</th>
             </tr>
             <c:forEach var="row" items="${deathondisc.rows}">
                 <tr>
                     <td><c:out value="${row.count}"/></td>
                     <td><c:out value="${row.ADMITTING_DIAGNOSIS_CODE}"/></td>
                 </tr>
             </c:forEach>
         </table>
        </div>
    </div>
    <div class="row">
        <div class="col-md-offset-3">
              <h4>TOP 10 Most Expensive ADMITTING_DIAGNOSIS_CODES</h4>
        </div>
    </div>     
    <div class="row">
        <div class="col-md-offset-2 col-md-8">
         <table class="table table-hover table-bordered table-condensed" width="400px">
             <tr style="background-color: #d9edf7;">
                 <th>Cost</th><th>Code</th>
             </tr>
             <c:forEach var="row" items="${mostexp.rows}">
                <tr>
                    <td>$<c:out value="${row.charges}"/></td>
                    <td><c:out value="${row.ADMITTING_DIAGNOSIS_CODE}"/></td>
                </tr>
            </c:forEach> 
         </table>
        </div>
    </div>            
    
    <div class="row">
        <div class="col-md-offset-3">
              <h4>TOP 10 Longest Length Of Stay ADMITTING_DIAGNOSIS_CODES</h4>
        </div>
    </div> 
    <div class="row">
        <div class="col-md-offset-2 col-md-8">
         <table class="table table-hover table-bordered table-condensed" width="400px">
             <tr style="background-color: #d9edf7;">
                 <th>Days</th><th>Code</th>
             </tr>
             <c:forEach var="row" items="${longest.rows}">
                <tr>
                    <td><c:out value="${row.los}"/></td>
                    <td><c:out value="${row.ADMITTING_DIAGNOSIS_CODE}"/></td>
                </tr>
            </c:forEach> 
         </table>
        </div>
    </div> 
    </div>   
</div>
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





