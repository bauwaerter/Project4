<%@include file="top.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

    <hr>
    <div class="row">
        <div class="col-md-offset-1 col-md-10">
            <div class="panel panel-info">
                <div class="panel-heading" style="font-weight: bold; color: black;">
                    Kaplan Meyer Survival Table
                </div>
                <sql:query dataSource="${snapshot}" var="kaplan">
                select * from t4 where discharge_status=2 order by pat_therapy asc, days_of_death_after_admission asc
                </sql:query>
                <sql:query dataSource="${snapshot}" var="a">
                select * from t4 where discharge_status=2 AND pat_therapy='a' order by pat_therapy asc, days_of_death_after_admission asc
                </sql:query>
                <sql:query dataSource="${snapshot}" var="b">
                select * from t4 where discharge_status=2 AND pat_therapy='b' order by pat_therapy asc, days_of_death_after_admission asc
                </sql:query>
                <c:set var="totala" value="${0}" />
                <c:set var="totalb" value="${0}" />
                
                <c:forEach var="row" items="${a.rows}">
                    <c:set var="totala" value="${totala+1}" />
                </c:forEach>
                
                <c:forEach var="row" items="${b.rows}">
                    <c:set var="totalb" value="${totalb+1}" />
                </c:forEach>
                <c:set var="aperc" value="${100}" />
                <c:set var="bperc" value="${100}" />

                <c:set var="totala"><fmt:formatNumber type="number" minFractionDigits="1" maxFractionDigits="1" value="${100/totala}" /></c:set> 
                <c:set var="totalb" value="${100/totalb}" />
                
                <div class="row">
                    <div class="col-md-offset-2 col-md-8">
                        <br>
                     <table class="table table-hover table-bordered table-condensed" width="400px">
                         <tr style="background-color: #d9edf7;">
                             <th>pat_id</th><th>pat_therapy</th><th>discharge_status</th><th>days_of_death_after_admission</th><th>percent_remaining</th>
                         </tr>
                         <c:forEach var="row" items="${kaplan.rows}">
                             <tr>
                                 <td><c:out value="${row.pat_id}"/></td>
                                 <td><c:out value="${row.pat_therapy}"/></td>
                                 <c:if test="${row.pat_therapy == 'a'}">
                                 <c:set var="aperc" value="${aperc-totala}"  />
                                 <td><c:out value="${row.discharge_status}"/></td>
                                 <td><c:out value="${row.days_of_death_after_admission}"/></td>
                                 <c:set var="aperc"><fmt:formatNumber type="number" minFractionDigits="1" maxFractionDigits="1" value="${aperc}" /></c:set>
                                 <td><c:out value="${aperc}" /></td>
                                 </c:if>
                                 <c:if test="${row.pat_therapy == 'b'}">
                                 <c:set var="bperc" value="${bperc-totalb}" />
                                 <td><c:out value="${row.discharge_status}"/></td>
                                 <td><c:out value="${row.days_of_death_after_admission}"/></td>
                                 <td><c:out value="${bperc}"/></td>
                                 </c:if>

                             </tr>
                         </c:forEach>
                     </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
       
    <br/>
    <div class="row">
        <div class="col-md-offset-1 col-md-10">
            <div class="panel panel-info">
                <div class="panel-heading" style="font-weight: bold; color: black;">
                    Kaplan Meyer Survival Function Graph
                </div>
                <div class="panel-body center-block">
                    <div class="col-sm-offset-3">
                        <img src="images/t4graph.png">
                    </div>
                    
                </div>   
            </div>
        </div>
    </div>
<%@include file="footer.jsp" %>

