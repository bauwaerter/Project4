/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sean;

import static java.lang.System.out;
import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Sean
 */
public class MakeRules {

    ArrayList<Rules> ruleList = new ArrayList<Rules>();
    ArrayList<String> columnList = new ArrayList<String>();
    public ArrayList<RuleTo> FinalRules = new ArrayList<RuleTo>();

    public MakeRules(String query, String support, String confidence) { //ResultSet items
        try {

            String connectionURL = "jdbc:mysql://216.70.85.35/hw";
            Connection connection = null;
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            connection = DriverManager.getConnection(connectionURL, "class", "healthcare");
            if (!connection.isClosed()) {
                out.println("Successfully connected to " + "MySQL server using TCP/IP...");
            }
            Statement st = connection.createStatement();
            ResultSet items = st.executeQuery("SELECT " + query + "  FROM hw");

            ResultSetMetaData rsmd = items.getMetaData();
            int numOfRecords = 0;
            int count = rsmd.getColumnCount();
            for (int i = 1; i <= count; i++) {
                String colName = rsmd.getColumnName(i);
                columnList.add(colName);
                ruleList.add(new Rules(rsmd.getColumnName(i), i)); // creates Rules for each column
            }
            while (items.next()) {  // loops through the Result set
                numOfRecords++; // count for the support calc
                for (Rules r : ruleList) // loops through the Rules for each column
                {
                    String val = items.getString(r.index);
                    ArrayList<RuleTo> checkRules = new ArrayList<RuleTo>();
                    for (String to : columnList) // for each column make a rule from our test column to all the other columns 
                    {
                        if (!to.equals(r.Attribute)) {
                            checkRules.add(new RuleTo(to, val, items.getString(to))); // get list of rules to check
                        }
                    }
                    for (RuleTo check : checkRules) // loop through the rules just made and check if they have already been added
                    {
                        boolean found = false;
                        for (RuleTo realRules : r.RulesTo) { //checking if we already have these rules
                            if (realRules.AttributeTo.equals(check.AttributeTo)
                                    && realRules.AttributeVal1.equals(check.AttributeVal1)
                                    && realRules.AttributeVal2.equals(check.AttributeVal2)) {
                                found = true; //indicating that we have found the rule and not to add it
                                realRules.count++; // adding to the count if we found the rules again
                            }

                            if (realRules.AttributeVal1.equals(check.AttributeVal1)) {
                                realRules.numTimesHadValue++; // count for the confidence calc
                            }
                        }
                        if (!found) {
                            r.RulesTo.add(check); // add rule
                        }
                    }
                }
            }

            float supp = Float.valueOf(support);
            float conf = Float.valueOf(confidence);
            for (Rules r : ruleList) {
                for (RuleTo rls : r.RulesTo) {
                    rls.AttributeFrom = r.Attribute;
                    rls.numOfRecords = numOfRecords;
                    rls.calcMetrics(); //uses the numOfRecords and numTimesHadValue to calculate the metrics
                    if (rls.support >= supp && rls.confidence >= conf) {
                        FinalRules.add(rls);//final rules
                        System.out.println("Rule " + rls.AttributeFrom + " = " + rls.AttributeVal1 + " => "
                                + rls.AttributeTo + " = " + rls.AttributeVal2);
                        System.out.println("Support: " + rls.support);
                        System.out.println("Confidence: " + rls.confidence);
                    }
                }
            }
            connection.close();
        } catch (Exception ex) {
            Logger.getLogger(MakeRules.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
