/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author Brandon Auwaerter
 */
public class Task1 {
    private int age_group;
    private String gender;  
    private String admDiagnosisCode;
    
    public Task1(String age_group, String gender, String admDiagCode){
        this.age_group = Integer.parseInt(age_group);
        this.gender = gender;
        this.admDiagnosisCode = admDiagCode;
    }
    
    public void setAge(int age){
        this.age_group = age;
    }
    public int getAge(){
        return this.age_group;
    }
    public void setGender(String gender){
        this.gender = gender;
    }
    public String getGender(){
        return this.gender;
    }
    public void setAdmDiagCode(String code){
        this.admDiagnosisCode = code;
    }
    public String getAdmDiagCode(){
        return this.admDiagnosisCode;
    }
}
