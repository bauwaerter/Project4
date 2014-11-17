<%-- 
    Document   : task5
    Created on : Nov 14, 2014, 8:20:23 PM
    Author     : Brandon Auwaerter
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.FileNotFoundException"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="navbar.jsp"/>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Task 5</title>
    </head>
    <body>
        <h1>Task 5</h1>
        <%
            String csvFile = "task5cusum.csv";
            BufferedReader br = null;
            String line = "";
            String cvsSplitBy = ",";
            ArrayList<Task5CuSum> cuSumList = new ArrayList();
 
            try {

                    br = new BufferedReader(new FileReader(csvFile));
                    while ((line = br.readLine()) != null) {

                            // use comma as separator
                            String[] row = line.split(cvsSplitBy);
                            int day = Integer.parseInt(row[0]);
                            int district1 = Integer.parseInt(row[1]);
                            int district2 = Integer.parseInt(row[2]);
                            Task5CuSum cuSum = new Task5CuSum(day, district1, district2);
                            cuSumList.add(cuSum);

                    }

                    } catch (FileNotFoundException e) {
                            e.printStackTrace();
                    } catch (IOException e) {
                            e.printStackTrace();
                    } finally {
                            if (br != null) {
                                    try {
                                            br.close();
                                    } catch (IOException e) {
                                            e.printStackTrace();
                                    }
                            }
                    }
            Task5CuSum cuSum = new Task5CuSum(5,1,2);
        %>
        <div id="container">
            
        </div>
        <div class="col-md-offset-3 col-md-4">
        <div class="panel-info">
            <div class="panel-heading">
                Cases of Asthma in Arlington
            </div>
            <div class="panel-body">
                <table class="table table-striped">
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
    </body>
    
</html>

<script>
    $(document).ready(function(){
       
    });
        
</script>