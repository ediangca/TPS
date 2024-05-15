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
public class Role {

    public int RoleNo;
    public String Role;
    public String DateCreated;
    public String DateUpdated;
    public int AccNo;

    public Role(int RoleNo, String Role, String DateCreated, String DateUpdated, int AccNo) {
        this.RoleNo = RoleNo;
        this.Role = Role;
        this.DateCreated = DateCreated;
        this.DateUpdated = DateUpdated;
        this.AccNo = AccNo;
    }
    
    
}
