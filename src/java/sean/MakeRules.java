/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sean;

import java.sql.Connection;
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

    ArrayList<Rules> ruleList;
    ArrayList<String> columnList;
    ArrayList<RuleTo> FinalRules;

    public MakeRules() { //ResultSet items
        try {

            Class.forName(
                    "com.mysql.jdbc.Driver");

// Obtaining a connection to SQL Server
            Properties connectionProps = new Properties();
            connectionProps.put("user", "class");
            connectionProps.put("password", "healthcare");
            
            
            
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://216.70.85.35/hw/?user=class&password=healthcare"
            );

// Looping through each row
            Statement sta = con.createStatement();
            ResultSet items = sta.executeQuery(
                    "SELECT DISCHARGE_STATUS, DISCHARGE_DESTINATION  FROM hw");

            ResultSetMetaData rsmd = items.getMetaData();
            int numOfRecords = 0;
            int count = rsmd.getColumnCount();
            for (int i = 0; i < count; i++) {
                columnList.add(rsmd.getColumnName(i));
                ruleList.add(new Rules(rsmd.getColumnName(i), i)); // creates Rules for each column
            }
            while (items.next()) {  // loops through the Result set
                numOfRecords++; // count for the support calc
                for (Rules r : ruleList) // loops through the Rules for each column
                {
                    String val = items.getNString(r.index);
                    ArrayList<RuleTo> checkRules = new ArrayList<RuleTo>();
                    for (String to : columnList) // for each column make a rule from our test column to all the other columns 
                    {
                        if (!to.equals(r.Attribute)) {
                            checkRules.add(new RuleTo(to, val, items.getNString(to))); // get list of rules to check
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

                            if (!found) {
                                r.RulesTo.add(check); // add rule
                            }
                        }
                    }
                }
            }
            for (Rules r : ruleList) {
                for (RuleTo rls : r.RulesTo) {
                    rls.AttributeFrom = r.Attribute;
                    rls.numOfRecords = numOfRecords;
                    rls.calcMetrics(); //uses the numOfRecords and numTimesHadValue to calculate the metrics
                    FinalRules.add(rls);//final rules
                    System.out.println("Rule " + rls.AttributeFrom + " = " + rls.AttributeVal1 + " => "
                            + rls.AttributeTo + " = " + rls.AttributeVal2);
                    System.out.println("Support: " + rls.support);
                    System.out.println("Support: " + rls.confidence);
                }
            }

        } catch (Exception ex) {
            Logger.getLogger(MakeRules.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
