<%@include file="top.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
    .table-bordered>thead>tr>th, .table-bordered>tbody>tr>th, .table-bordered>tfoot>tr>th,
    .table-bordered>thead>tr>td, .table-bordered>tbody>tr>td, .table-bordered>tfoot>tr>td {
        border: 1px solid darkgrey;
    }
</style>
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
                             
                                 
                                 <c:if test="${row.pat_therapy == 'a'}">
                                 <c:set var="aperc" value="${aperc-totala}"  />
                                 <tr>
                                 <td><c:out value="${row.pat_id}"/></td>
                                 <td><c:out value="${row.pat_therapy}"/></td>
                                 <td><c:out value="${row.discharge_status}"/></td>
                                 <td><c:out value="${row.days_of_death_after_admission}"/></td>
                                 <c:set var="aperc"><fmt:formatNumber type="number" minFractionDigits="1" maxFractionDigits="1" value="${aperc}" /></c:set>
                                 <td><c:out value="${aperc}" /></td>
                                 </tr>
                                 </c:if>
                                 <c:if test="${row.pat_therapy == 'b'}">
                                 <c:set var="bperc" value="${bperc-totalb}" />
                                 <tr style="background-color: rgba(86,61,124,.15)">
                                 <td><c:out value="${row.pat_id}"/></td>
                                 <td><c:out value="${row.pat_therapy}"/></td>
                                 <td><c:out value="${row.discharge_status}"/></td>
                                 <td><c:out value="${row.days_of_death_after_admission}"/></td>
                                 <td><c:out value="${bperc}"/></td>
                                                              </tr>

                                 </c:if>

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
                    <div onload="loadChart();" id="kaplanHighChart"></div>
<!--                    <div class="col-sm-offset-3">
                        <img src="images/t4graph.png">
                    </div>-->
                    
                </div>   
            </div>
        </div>
    </div>
<%@include file="footer.jsp" %>

<script>
    $(document).ready(function(){
            var days_a = [];
            var days_b = [];
            var percent_remaining_a = [];
            var percent_remaining_b = [];
            
            <c:set var="aperc" value="${100}" />
            <c:set var="bperc" value="${100}" />
            <c:forEach var="row" items="${kaplan.rows}">
                <c:if test="${row.pat_therapy == 'a'}">
                    <c:set var="aperc" value="${aperc-totala}"  />
                    days_a.push(<c:out value="${row.days_of_death_after_admission}"/>);
                    percent_remaining_a.push(<c:out value="${aperc}" />);
                </c:if>
                <c:if test="${row.pat_therapy == 'b'}">
                    <c:set var="bperc" value="${bperc-totalb}" />
                    days_b.push(<c:out value="${row.days_of_death_after_admission}"/>);
                    percent_remaining_b.push(<c:out value="${bperc}"/>);
                </c:if>

            </c:forEach>
            var max_days_a = $(days_a)[0];
            var max_days_b = $(days_b)[0];
            var min_days_a = $(days_a)[0];
            var min_days_b = $(days_b)[0];
            $(days_a).each(function(index, val){
                if(max_days_a < val){
                    max_days_a = val;
                }
                if(min_days_a > val){
                    min_days_a = val;
                }
            });
            $(days_b).each(function(index, val){
                 if(max_days_b < val){
                     max_days_b = val;
                 }
                 if(min_days_b > val){
                    min_days_b = val;
                }
            });
            var max_days = Math.max(max_days_a, max_days_b);
            var x_axis = [];
            
            for(var i = 0; i < max_days; i++){
                x_axis.push(i);
            }
            
            var y_axis_a = []; //[100,100,100,100,66]
            var y_axis_b = [];
            
            for(var i = 0; i < min_days_a; i++){
                y_axis_a.push(100);
            }
            for(var i = 0; i < min_days_b; i++){
                y_axis_b.push(100);
            }
            
            var days_with_same_val = 0;
            var day_val_a = days_a.shift();
            var percent_val_a = 0;
            for(var current_day = min_days_a; current_day < max_days_a; current_day++){
                if(day_val_a === current_day){
                    percent_val_a = percent_remaining_a.shift();
                    for(var i = 0; i < days_a.length; i++){
                        if(days_a[i] === day_val_a){
                            days_with_same_val++;
                        } else {
                            break;
                        }
                    }
                    if(days_with_same_val > 0){
                        for(var i = 0; i < days_with_same_val; i++){
                            day_val_a = days_a.shift();
                            percent_val_a = percent_remaining_a.shift(); 
                        }
                        days_with_same_val = 0;
                        y_axis_a.push(percent_val_a);
                    } else{
                        y_axis_a.push(percent_val_a);
                        
                    }
                    day_val_a = days_a.shift();
                     
                } else {
                    y_axis_a.push(percent_val_a);
                }
                
            }
            y_axis_a.push(0);
            
            days_with_same_val = 0;
            var day_val_b = days_b.shift();
            var percent_val_b = 0;
            for(var current_day = min_days_b; current_day < max_days_b; current_day++){
                if(day_val_b === current_day){
                    percent_val_b = percent_remaining_b.shift();
                    for(var i = 0; i < days_b.length; i++){
                        if(days_b[i] === day_val_b){
                            days_with_same_val++;
                        } else {
                            break;
                        }
                    }
                    if(days_with_same_val > 0){
                        for(var i = 0; i < days_with_same_val; i++){
                            day_val_b = days_b.shift();
                            percent_val_b = percent_remaining_b.shift(); 
                        }
                        days_with_same_val = 0;
                        y_axis_b.push(percent_val_b);
                    } else{
                        y_axis_b.push(percent_val_b);
                        
                    }
                    day_val_b = days_b.shift();
                     
                } else {
                    y_axis_b.push(percent_val_b);
                }
                
            }
            y_axis_b.push(0);
            
            var chart = new Highcharts.Chart({
                chart: {
                    renderTo: 'kaplanHighChart'
                },
                title:{
                    text: "Survival Graph"
                },
                xAxis: {
                    categories: x_axis

                },
                tooltip: {
                    pointFormat: "{series.name}: <b>{point.y:.2f}</b><br/>",
                    shared: true
                },
                series: [{
                    name: 'Case A',
                    data: y_axis_a
                },{
                    name: 'Case B',
                    data: y_axis_b
                }]

            });
        
    });
</script>