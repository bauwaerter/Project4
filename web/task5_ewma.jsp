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
            double stdDev1 = 0.0;
            double[] dataSet1 = new double[20];
            int sumD2 = 0;
            double avgD2 = 0.0;
            double stdDev2 = 0.0;
            double[] dataSet2 = new double[20];
            double temp1 = 0.0;
            double temp2 = 0.0;
            double variance1 = 0.0;
            double variance2 = 0.0;
             
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
            
            for(int row = 0; row < 20; row++){
                dataSet1[row] = dataSet[row][1];
                dataSet2[row] = dataSet[row][2];
            }
            
        %>
        <div id="errorMessage" class="modal fade">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                  <h4 class="modal-title">Error</h4>
                </div>
                <div class="modal-body">
                  <p style="color:red;">Please enter a lambda value between 0 and 1.</p>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-default" data-dismiss="modal">Ok</button>
                </div>
              </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
      </div><!-- /.modal -->
        <div class="row">
            <div class="col-md-6">
                <label for="lambda_val">Lambda</label>
                <div class="col-md-offset-3 col-md-5">
                    <input id="lambda_val" class="form-control">
                </div>
                &nbsp;&nbsp;
                <button id="calcEWMA" type="button" class="btn btn-success btn-md">Submit</button>
            </div>           
        </div>
        <br/>
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
       </div>
       <div class="row">
<!--            <div class="col-md-6">
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
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                            <% } %>
                        </table>
                    </div>
                </div>
            </div>-->
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
        var std1 = <%=stdDev1%>;
        var std2 = <%=stdDev2%>;
        var avg1 = <%=avgD1%>;
        var avg2 = <%=avgD2%>;
        var dataSet1 = [];
        var dataSet2 = [];
        var z1 = [0];
        var z2 = [0];
        var ewma1 = [];
        var ewma2 = [];
        var sdEwma1 = 0;
        var sdEwma2 = 0;
        var lambda_val = 0;
        var num_clicks = false;
        
        <% for(int i = 0; i < 20; i+=1) { %>
                dataSet1.push(<%=dataSet1[i]%>);
                dataSet2.push(<%=dataSet2[i]%>);
        <% } %>
        
        $('#calcEWMA').click(function(){
            z1 = [0];
            z2 = [0];
            ewma1 = [];
            ewma2 = [];
            sdEwma1 = 0;
            sdEwma2 = 0;
        
            lambda_val = $('#lambda_val').val();
            if(lambda_val <= 0 || lambda_val > 1)
                $('#errorMessage').modal('show');
            sdEwma1 = Math.sqrt((lambda_val/(2-lambda_val))*Math.pow(std1, 2));
            sdEwma2 = Math.sqrt((lambda_val/(2-lambda_val))*Math.pow(std2, 2));
            $(dataSet1).each(function(index, val){
                if(index === 0){
                    ewma1.push((lambda_val*val) + ((1-lambda_val) * avg1));
                } else {
                    ewma1.push((lambda_val*val) + ((1-lambda_val) * ewma1[index-1]));
                }
            });
            $(dataSet2).each(function(index, val){
                if(index === 0){
                    ewma2.push((lambda_val*val) + ((1-lambda_val) * avg2));
                } else {
                    ewma2.push((lambda_val*val) + ((1-lambda_val) * ewma2[index-1]));
                }
            });
            $(ewma1).each(function(index, val){
                z1.push((val-avg1) / sdEwma1);
            });
            $(ewma2).each(function(index, val){
                z2.push((val-avg1) / sdEwma2);
            });
            
//            if(num_clicks)
//                $('#highChartsDiv').highcharts().destroy();
            $('#highChartsDiv').empty();
            var chart = new Highcharts.Chart({
                    chart: {
                        renderTo: 'highChartsDiv'
                    },
                    title:{
                        text: "Cases of Asthma in Arlington EWMA"
                    },
                    xAxis: {
                        categories: [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]

                    },
                    tooltip: {
                        pointFormat: "{series.name}: <b>{point.y:.2f}</b><br/>",
                        shared: true
                    },
                    series: [{
                        name: 'z1',
                        data: z1
                    },{
                        name: 'z2',
                        data: z2
                    }]

            });
            
        num_clicks = true;
        });
        
              
        
    });
        
</script>