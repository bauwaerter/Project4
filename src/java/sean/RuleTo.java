/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sean;

/**
 *
 * @author Sean
 */
public class RuleTo {
    int count;
    int numTimesHadValue;
    int numOfRecords;
    String AttributeFrom;
    String AttributeTo;
    String AttributeVal1;
    String AttributeVal2;
    float support;
    float confidence;
    public RuleTo(String att, String val1, String val2)
    {
        AttributeTo=att;
        AttributeVal1 = val1;
        AttributeVal2= val2;
    }
    
    public void calcMetrics()
    {
        support = count / numOfRecords;
        confidence = count / numTimesHadValue;
    }
}
