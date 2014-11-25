<%@page import="sean.RuleTo"%>
<%@page import="sean.MakeRules"%>
<%@include file="top.jsp" %>


<%
    //MakeRules test = new MakeRules();
%>
<div class="row">
    <div class="col-md-offset-1 col-md-10">
        <div class="panel panel-info">
            <div class="panel-heading" style="font-weight: bold; color: black;">
                Task 3 - Association Rule Mining
            </div>
            <div class="panel-body">
                <hr>
                <form action="task3.jsp" method="POST" role="form">

                    <div class="form-group">
                        <label for="age_group">Confidence Level</label>
                        <div class="col-md-offset-3 col-md-3">
                            <input name="confidence" id="age_group">
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-md-offset-3 col-md-3">
                            <input name="support" id="age_group">
                        </div>
                        <label for="age_group">Support Level</label>

                    </div>

                    <div class="form-group">
                        <label for="age_group">Features to be included:</label>
                        <div class="col-md-offset-3 col-md-3">
                            <input type="checkbox" name="attributes" value="AGE">AGE<br>
                            <input type="checkbox" name="attributes" value="SEX">SEX<br>
                            <input type="checkbox" name="attributes" value="RACE">RACE<br>
                            <input type="checkbox" name="attributes" value="DAY_OF_ADMISSION">DAY_OF_ADMISSION<br>
                            <input type="checkbox" name="attributes" value="DISCHARGE_STATUS">DISCHARGE_STATUS<br>
                            <input type="checkbox" name="attributes" value="STAY_INDICATOR">STAY_INDICATOR<br>
                            <input type="checkbox" name="attributes" value="DRG_CODE">DRG_CODE<br>
                            <input type="checkbox" name="attributes" value="LENGTH_OF_STAY">LENGTH_OF_STAY<br>
                            <input type="checkbox" name="attributes" value="DRG_PRICE">DRG_PRICE<br>
                            <input type="checkbox" name="attributes" value="TOTAL_CHARGES">TOTAL_CHARGES<br>
                            <input type="checkbox" name="attributes" value="COVERED_CHARGES">COVERED_CHARGES<br>
                            <input type="checkbox" name="attributes" value="POA_DIAGNOSIS_INDICATOR_1">POA_DIAGNOSIS_INDICATOR_1<br>
                            <input type="checkbox" name="attributes" value="POA_DIAGNOSIS_INDICATOR_2">POA_DIAGNOSIS_INDICATOR_2<br>
                            <input type="checkbox" name="attributes" value="DIAGNOSIS_CODE_1">DIAGNOSIS_CODE_1<br>
                            <input type="checkbox" name="attributes" value="DIAGNOSIS_CODE_2">DIAGNOSIS_CODE_2<br>
                            <input type="checkbox" name="attributes" value="PROCEDURE_CODE_1">PROCEDURE_CODE_1<br>
                            <input type="checkbox" name="attributes" value="PROCEDURE_CODE_2">PROCEDURE_CODE_2<br>
                            <input type="checkbox" name="attributes" value="DISCHARGE_DESTINATION">DISCHARGE_DESTINATION<br>
                            <input type="checkbox" name="attributes" value="SOURCE_OF_ADMISSION">SOURCE_OF_ADMISSION<br>
                            <input type="checkbox" name="attributes" value="TYPE_OF_ADMISSION">TYPE_OF_ADMISSION<br>
                            <input type="checkbox" name="attributes" value="ADMITTING_DIAGNOSIS_CODE">ADMITTING_DIAGNOSIS_CODE<br>
                        </div>  
                    </div>

                    <br><br><br>
                    <div class="col-md-offset-5">
                        <button type="submit" class="btn btn-success btn-lg">Submit</button>
                    </div>

                </form> 
            </div>
            <div class="panel-body">
                <hr>  
                <%
                    if ("POST".equalsIgnoreCase(request.getMethod())) {
                        String[] attributes;
                        String confidence = request.getParameter("confidence");
                        String support = request.getParameter("support");
                %>
                <center>You have selected: 
                    <%
                        String query = "";
                        attributes = request.getParameterValues("attributes");
                        if (attributes != null) {
                            for (int i = 0; i < attributes.length; i++) {
                                out.println("<b>" + attributes[i] + "<b>,");
                                if (i == attributes.length - 1) {
                                    query += attributes[i];
                                } else {
                                    query += attributes[i] + ",";
                                }

                            }
                        } else {
                            out.println("<b>none<b>");
                        }
                        %><br/>
                        <textarea  style="width: 600px; height: 400px"> <%
                        int c=1;
                        MakeRules rls = new MakeRules(query,support,confidence);
                        for (RuleTo r : rls.FinalRules) {
                            out.println("Rule "+c+" " + r.AttributeFrom + " = " + r.AttributeVal1 + " --> "
                                    + r.AttributeTo + " = " + r.AttributeVal2 );
                            out.println("Support: " + r.support );
                            out.println("Confidence: " + r.confidence+ "\n");
                            c++;
                        }
                    %>
                        </textarea>
                </center>    
                <%                    } else {
                        // It may be a GET request.
                    }
                
                %>
            </div>   
        </div>
    </div>
</div>
<%@include file="footer.jsp" %>

<script>
    $(document).ready(function () {
        $('select').select2({
            width: '100%',
        });
    });
</script>

