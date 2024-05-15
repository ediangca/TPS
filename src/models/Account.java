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
public class Account {
    public int AccNo;
    public String username;
    public String password;
    public int RoleNo;
    public int BranchNo;
    public String firstname;
    public String mi;
    public String address;
    public String contactNo;
    public String email;
    public String DateCreated;
    public String DateUpdated;
    public String CreatedBy;

    public Account(int AccNo, String username, String password, int RoleNo, int BranchNo, String firstname, String mi, String address, String contactNo, String email, String DateCreated, String DateUpdated, String CreatedBy) {
        this.AccNo = AccNo;
        this.username = username;
        this.password = password;
        this.RoleNo = RoleNo;
        this.BranchNo = BranchNo;
        this.firstname = firstname;
        this.mi = mi;
        this.address = address;
        this.contactNo = contactNo;
        this.email = email;
        this.DateCreated = DateCreated;
        this.DateUpdated = DateUpdated;
        this.CreatedBy = CreatedBy;
    }
    
    
}
