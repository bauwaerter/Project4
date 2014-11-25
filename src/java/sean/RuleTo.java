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
    public String AttributeFrom;
    public String AttributeTo;
    public String AttributeVal1;
    public String AttributeVal2;
    public float support;
    public float confidence;
    public RuleTo(String att, String val1, String val2)
    {
        AttributeTo=att;
        AttributeVal1 = val1;
        AttributeVal2= val2;
        count =1;
        numTimesHadValue =1;
    }
    
    public void calcMetrics()
    {
        support = (float)count / numOfRecords;
        confidence = (float)count / numTimesHadValue;
    }
}
