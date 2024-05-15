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
public class Liquidation {
    public int LigNo;
    public int ORNo;
    public String ORType;
    public String establish;
    public double total;
    public double change;
    public String DateCreated;
    public String DateUpdated;
    public int AccNo;
    public boolean voidflag;
    public boolean postflag;
    public String remarks;
    
    

    public Liquidation(int LigNo, int ORNo, String ORType, String establish, double total, double change, String DateCreated, String DateUpdated, int AccNo, boolean voidflag, boolean postflag, String remarks) {
        this.LigNo = LigNo;
        this.ORNo = ORNo;
        this.ORType = ORType;
        this.establish = establish;
        this.total = total;
        this.change = change;
        this.DateCreated = DateCreated;
        this.DateUpdated = DateUpdated;
        this.AccNo = AccNo;
        this.voidflag = voidflag;
        this.postflag = postflag;
        this.remarks = remarks;
    }
    
    
}
