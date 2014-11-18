<%@include file="top.jsp" %>
        <div class="panel panel-info">
            <div class="panel-heading">
                Task 1.2
            </div>
         <div class="panel-body">   
<font size="3"><b>RESULTS:</b></font><br>

  
<sql:query dataSource="${snapshot}" var="deathondisc">
select ADMITTING_DIAGNOSIS_CODE, COUNT(DISCHARGE_STATUS)as count from hw where DISCHARGE_STATUS = 'b' GROUP BY ADMITTING_DIAGNOSIS_CODE ORDER BY COUNT(DISCHARGE_STATUS) desc LIMIT 10
</sql:query>

<sql:query dataSource="${snapshot}" var="mostexp">
select ADMITTING_DIAGNOSIS_CODE, AVG(TOTAL_CHARGES) as charges from hw where DISCHARGE_STATUS = 'b' GROUP BY ADMITTING_DIAGNOSIS_CODE ORDER BY AVG(TOTAL_CHARGES) desc LIMIT 10
</sql:query>

<sql:query dataSource="${snapshot}" var="longest">
select ADMITTING_DIAGNOSIS_CODE, AVG(LENGTH_OF_STAY) as los from hw where DISCHARGE_STATUS = 'b' GROUP BY ADMITTING_DIAGNOSIS_CODE ORDER BY AVG(LENGTH_OF_STAY) desc LIMIT 10
</sql:query>

 <br>
TOP 10 Death On Discharge ADMITTING_DIAGNOSIS_CODES <br>
        <c:forEach var="row" items="${deathondisc.rows}">
            Count: <c:out value="${row.count}"/> | Code: <c:out value="${row.ADMITTING_DIAGNOSIS_CODE}"/><br>
            
        </c:forEach> 
<br><br>
TOP 10 Most Expensive ADMITTING_DIAGNOSIS_CODES <br>
        <c:forEach var="row" items="${mostexp.rows}">
            Cost: $<c:out value="${row.charges}"/> | Code: <c:out value="${row.ADMITTING_DIAGNOSIS_CODE}"/><br>
            
        </c:forEach> 
<br><br>
TOP 10 Longest Length Of Stay ADMITTING_DIAGNOSIS_CODES <br>
        <c:forEach var="row" items="${longest.rows}">
            Days: <c:out value="${row.los}"/> | Code: <c:out value="${row.ADMITTING_DIAGNOSIS_CODE}"/><br>
            
        </c:forEach> 
<br>
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





