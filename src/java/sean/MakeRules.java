/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sean;

import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Sean
 */
public class MakeRules {
    
    ArrayList<Rules> ruleList;
    
    public MakeRules(ResultSet items)
    {
        try {
            while (items.next()) {
                String firstName = items.getString("FirstName");
                String lastName = items.getString("LastName");
                System.out.println("   " + firstName + " " + lastName);
            }
        } catch (Exception ex) {
        }
    }

}
