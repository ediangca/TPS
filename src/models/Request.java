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
public class Request {

    public int ReqNo;
    public String udage;
    public String project;
    public String purpose;
    public String mop;
    public double total;
    public String DateCreated;
    public String DateUpdated;
    public int AccNo;
    public String status;
    public boolean voidflag;
    public boolean postflag;

    public Request(int ReqNo, String udage, String project, String purpose, String mop, double total, String DateCreated, String DateUpdated, int AccNo, String status, boolean voidflag, boolean postflag) {
        this.ReqNo = ReqNo;
        this.udage = udage;
        this.project = project;
        this.purpose = purpose;
        this.mop = mop;
        this.total = total;
        this.DateCreated = DateCreated;
        this.DateUpdated = DateUpdated;
        this.AccNo = AccNo;
        this.status = status;
        this.voidflag = voidflag;
        this.postflag = postflag;
    }
    
    
}
