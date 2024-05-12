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
public class Voucher {
     public int VoucherNo;
    public String VoucherType;
    public double amount;
    public String REFNo;
    public int AccNo;
    public double total;
    public String DateCreated;
    public String DateUpdated;
    public String status;
    public boolean voidflag;
    public boolean postflag;

    public Voucher(int VoucherNo, String VoucherType, double amount, String REFNo, int AccNo, double total, String DateCreated, String DateUpdated, String status, boolean voidflag, boolean postflag) {
        this.VoucherNo = VoucherNo;
        this.VoucherType = VoucherType;
        this.amount = amount;
        this.REFNo = REFNo;
        this.AccNo = AccNo;
        this.total = total;
        this.DateCreated = DateCreated;
        this.DateUpdated = DateUpdated;
        this.status = status;
        this.voidflag = voidflag;
        this.postflag = postflag;
    }
    
    
}
