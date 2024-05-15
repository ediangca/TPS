/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

/**
 *
 * @author edian
 */
public class Particular {

    public int PNo;
    public String item;
    public String unit;
    public double qty;
    public double cost;
    public double total;
    public String DateCreated;
    public String DateUpdated;
    public int AccNo;
    public boolean voidflag;
    public boolean postflag;

    public Particular(int PNo, String item, String unit, double qty, double cost, double total, String DateCreated, String DateUpdated, int AccNo, boolean voidflag, boolean postflag) {
        this.PNo = PNo;
        this.item = item;
        this.unit = unit;
        this.qty = qty;
        this.cost = cost;
        this.total = total;
        this.DateCreated = DateCreated;
        this.DateUpdated = DateUpdated;
        this.AccNo = AccNo;
        this.voidflag = voidflag;
        this.postflag = postflag;
    }
    
    
}
