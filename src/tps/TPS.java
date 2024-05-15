/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tps;

import classes.MysqlConnect;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import views.Login;

/**
 *
 * @author edian
 */
public class TPS {

    /**
     * @param args the command line arguments
     */
    static MysqlConnect db;
    static Statement statement;
    static Connection connection;
    static ResultSet result;

    public static void main(String[] args) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(Login.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(Login.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(Login.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(Login.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {

                try {
                    System.out.println("Database Connecting..");
                    db = new MysqlConnect("localhost", "tps", "wb2c0", "parrot");
                    connection = db.connect();
                      System.out.println("Database Connecting..");
                    if (!(connection == null)) {
                        System.out.println("Database Successfully establish..");
                        statement = connection.createStatement();
                        System.err.println("SELECT Host, Port, Username, AES_DECRYPT(`Password`,9)as password, `Database` from host where isActive = 1;");
                        result = statement.executeQuery("SELECT Host, Port, Username, AES_DECRYPT(`Password`,9)as password, `Database` from host where isActive = 1;");
                        if (result.next()) {
                        
                            System.out.println("Connecting Default Connection >>> " + result.getString(1) + " ..");
                            db = new MysqlConnect(result.getString(1), result.getString(5), result.getString(3), result.getString(4));
                            connection = db.connect();
                            System.out.println("Default Connection establish ..");

                            new Login(connection).setVisible(true);
                        }
                    }
                } catch (Exception e) {
                    JOptionPane.showConfirmDialog(new JFrame(), e.getMessage(), "D-TECH DB CONFIG ERROR", JOptionPane.OK_OPTION, JOptionPane.WARNING_MESSAGE);
//                    System.err.println(e.getMessage());
                    e.printStackTrace();
                    return;
                }

            }
        });
    }

}
