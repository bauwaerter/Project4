/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sean;

import java.util.ArrayList;

/**
 *
 * @author Sean
 */
public class Rules {
    
    public ArrayList<RuleTo> RulesTo = new ArrayList<RuleTo>();
    public String Attribute;
    public int index;
    
    public Rules(String att,int num){
        Attribute=att;
        index = num;
    }
    
    
}

