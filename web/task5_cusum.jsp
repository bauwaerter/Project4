<%-- 
    Document   : task5_cusum
    Created on : Nov 14, 2014, 8:20:23 PM
    Author     : Brandon Auwaerter
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="top.jsp" %>
    
        <%
            
            //ArrayList<Task5CuSum> cuSumList = new ArrayList();
            int sumD1 = 0;
            double avgD1 = 0.0;
            double[] cuSum1 = new double[20];
            int sumD2 = 0;
            double avgD2 = 0.0;
            double temp1 = 0.0;
            double temp2 = 0.0;
            double variance1 = 0.0;
            double variance2 = 0.0;
            double stdDev1 = 0.0;
            double stdDev2 = 0.0;            
            double[] cuSum2 = new double[20];
             
            int [][] dataSet = {{1,2,3},{2,3,2},{3,2,2},{4,4,1},{5,3,2},
                                {6,2,3},{7,4,3},{8,5,3},{9,3,2},{10,2,3},
                                {11,1,4},{12,2,3},{13,3,2},{14,2,3},{15,2,4},
                                {16,4,3},{17,5,4},{18,6,3},{19,2,4},{20,1,3}};
            
            for(int row = 0; row < 20; row++){
                sumD1 += dataSet[row][1];
                sumD2 += dataSet[row][2];
                //Task5CuSum cuSum = new Task5CuSum(dataSet[row][0], dataSet[row][1], dataSet[row][2]);
                //cuSumList.add(cuSum);
            }
            
            avgD1 = sumD1 / 20.0;
            avgD2 = sumD2 / 20.0;
            
            for(int i = 0; i < 20; i++){
                temp1 += (avgD1 - dataSet[i][1])*(avgD1 - dataSet[i][1]);
                temp2 += (avgD2 - dataSet[i][2])*(avgD2 - dataSet[i][2]);
            }
            variance1 = temp1 / 20;
            variance2 = temp2 / 20;
            
            stdDev1 = Math.sqrt(variance1);
            stdDev2 = Math.sqrt(variance2);
            
            cuSum1[0] = dataSet[0][1] - avgD1;
            cuSum2[0] = dataSet[0][2] - avgD2;
            for(int row = 1; row < 20; row++){
                cuSum1[row] = cuSum1[row-1] + (dataSet[row][1] - avgD1);
                cuSum2[row] = cuSum2[row-1] + (dataSet[row][2] - avgD2);
            }
            
        %>
        <div id="highChartsDiv">
            
        </div>
        
        <div class="row">
        <div class="col-md-6">
            <div class="panel panel-info">
                <div class="panel-heading" style="font-weight: bold; color: black;">
                    Averages for Districts
                </div>
                <div class="panel-body">
                    <table class="table table-hover">
                        <tr>
                            <th>District</th>
                            <th>Average</th>
                        </tr>
                        <tr>
                            <td>District 1</td>
                            <td><%=avgD1%></td>
                        </tr>
                        <tr>
                            <td>District 2</td>
                            <td><%=avgD2%></td>
                        </tr>
                    </table>
                </div>
                </div>
       </div>
                                    <div class="col-md-6">
            <div class="panel panel-info">
                <div class="panel-heading" style="font-weight: bold; color: black;">
                    Standard Deviation for Districts
                </div>
                <div class="panel-body">
                    <table class="table table-hover">
                        <tr>
                            <th>District</th>
                            <th>Standard Deviation</th>
                        </tr>
                        <tr>
                            <td>District 1</td>
                            <td><%=stdDev1%></td>
                        </tr>
                        <tr>
                            <td>District 2</td>
                            <td><%=stdDev2%></td>
                        </tr>
                    </table>
                </div>
                </div>
       </div>
       </div>
       <div class="row">
            <div class="col-md-6">
                <div class="panel panel-info">
                    <div class="panel-heading" style="font-weight: bold; color: black;">
                        Cumulative Sums
                    </div>
                    <div class="panel-body">
                        <table class="table table-condensed table-hover">
                            <tr>
                                <th>Day</th>
                                <th>S1</th>
                                <th>S2</th>
                            </tr>
                            <% for(int i = 0; i < 20; i+=1) { %>
                                <tr>
                                    <td><%=i+1%></td>
                                    <td><%=cuSum1[i]%></td>
                                    <td><%=cuSum2[i]%></td>
                                </tr>
                            <% } %>
                        </table>
                    </div>
                </div>
            </div>
                        
            <div class="col-md-6">
                <div class="panel panel-info">
                    <div class="panel-heading" style="font-weight: bold; color: black;">
                        Cases of Asthma in Arlington
                    </div>
                    <div class="panel-body">
                        <table class="table table-condensed table-hover">
                            <tr>
                                <th>Day</th>
                                <th>District 1 (new cases)</th>
                                <th>District 2 (new cases)</th>
                            </tr>
                            <tr><td>1</td><td>2</td><td>3</td></tr>
                            <tr><td>2</td><td>3</td><td>2</td></tr>
                            <tr><td>3</td><td>2</td><td>2</td></tr>
                            <tr><td>4</td><td>4</td><td>1</td></tr>
                            <tr><td>5</td><td>3</td><td>2</td></tr>
                            <tr><td>6</td><td>2</td><td>3</td></tr>
                            <tr><td>7</td><td>4</td><td>3</td></tr>
                            <tr><td>8</td><td>5</td><td>3</td></tr>
                            <tr><td>9</td><td>3</td><td>2</td></tr>
                            <tr><td>10</td><td>2</td><td>3</td></tr>
                            <tr><td>11</td><td>1</td><td>4</td></tr>
                            <tr><td>12</td><td>2</td><td>3</td></tr>
                            <tr><td>13</td><td>3</td><td>2</td></tr>
                            <tr><td>14</td><td>2</td><td>3</td></tr>
                            <tr><td>15</td><td>2</td><td>4</td></tr>
                            <tr><td>16</td><td>4</td><td>3</td></tr>
                            <tr><td>17</td><td>5</td><td>4</td></tr>
                            <tr><td>18</td><td>6</td><td>3</td></tr>
                            <tr><td>19</td><td>2</td><td>4</td></tr>
                            <tr><td>20</td><td>1</td><td>3</td></tr>

                        </table>
                    </div>
                </div>
            </div>
        </div>
   <%@include file="footer.jsp" %>
 
<script>
    $(document).ready(function(){
        var stdDev1High_a = 2*<%=stdDev1%>;
        var stdDev1Low_a = stdDev1High_a * -1;
        var stdDev2High_b = 2*<%=stdDev2%>;
        var stdDev1Low_b = stdDev2High_b * -1;
        var cumSum1 = [];
        var cumSum2 = [];
        <% for(int i = 0; i < 20; i+=1) { %>
                cumSum1.push(<%=cuSum1[i]%>);
                cumSum2.push(<%=cuSum2[i]%>);
        <% } %>
        
        var chart = new Highcharts.Chart({
            chart: {
                renderTo: 'highChartsDiv'
            },
            title:{
                text: "Cases of Asthma in Arlington Cumulative Sum"
            },
            xAxis: {
                categories: [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
                
            },
            yAxis : {
                title : {
                    text : 'CuSum'
                },
                plotLines : [{
                    value : stdDev1High_a,
                    color : 'green',
                    dashStyle : 'shortdash',
                    width : 1,
                    label : {
                        text : 'District 1 Threshold (std * 2)'
                    }
                }, {
                    value : stdDev1Low_a,
                    color : 'green',
                    dashStyle : 'shortdash',
                    width : 1,
                    
                },{
                    value : stdDev2High_b,
                    color : 'red',
                    dashStyle : 'shortdash',
                    width : 1,
                    label : {
                        text : 'District 2 Threshold (std * 2)'
                    }
                },{
                    value : stdDev1Low_b,
                    color : 'red',
                    dashStyle : 'shortdash',
                    width : 1,
                    
                }
                
            ]
            },
            tooltip: {
                pointFormat: "{series.name}: <b>{point.y:.2f}</b><br/>",
                shared: true
            },
            series: [{
                name: 'CumSumD1',
                data: cumSum1
            },{
                name: 'CumSumD2',
                data: cumSum2
            }]

        });
    });
        
</script>