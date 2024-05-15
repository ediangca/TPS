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
public class Branch {
    public int BranchNo;
    public String Branch;
    public String Address;
    public String DateCreated;
    public String DateUpdated;
    public int AccNo;

    public Branch(int BranchNo, String Branch, String Address, String DateCreated, String DateUpdated, int AccNo) {
        this.BranchNo = BranchNo;
        this.Branch = Branch;
        this.Address = Address;
        this.DateCreated = DateCreated;
        this.DateUpdated = DateUpdated;
        this.AccNo = AccNo;
    }
    
    
}
