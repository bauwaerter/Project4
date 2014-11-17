/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author Brandon Auwaerter
 */
public class Task5CuSum {
    private int day;
    private int district1;
    private int district2;
    
    public Task5CuSum(int day, int district1, int district2){
        this.day = day;
        this.district1 = district1;
        this.district2 = district2;
    }
    
    public int getDay(){
        return this.day;
    }
    public int getDistrict1(){
        return this.district1;
    }
    public int getDistrict2(){
        return this.district2;
    }
}
