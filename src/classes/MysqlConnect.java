/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

/**
 *
 * @author Administrator
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

public class MysqlConnect {

    // init database constants
//    private static final String DATABASE_DRIVER = "com.mysql.cj.jdbc.Driver";
    private static String DATABASE_DRIVER = "com.mysql.jdbc.Driver";
    private static String DATABASE_URL = "jdbc:mysql://localhost:3306/tps";
    private static String USERNAME = "root";
    private static String PASSWORD = "";
    private static String MAX_POOL = "250";

    // init connection object
    private Connection connection = null;
    // init properties object
    private Properties properties = null;

    public MysqlConnect(String host, String db, String username, String password) {
        this.DATABASE_URL = "jdbc:mysql://" + host + "/" + db;
        this.USERNAME = username;
        this.PASSWORD = password;
    }

// create properties
    private Properties getProperties() {
        if (properties == null) {
            properties = new Properties();
            properties.setProperty("user", USERNAME);
            properties.setProperty("password", PASSWORD);
            properties.setProperty("MaxPooledStatements", MAX_POOL);
        }
        return properties;
    }

    // connect database
    public Connection connect() {
        if (connection == null) {
            try {
                Class.forName(DATABASE_DRIVER).newInstance();
//                System.out.println("Connecting . . Remote Database \n URL >>> " + DATABASE_URL);
                connection = DriverManager.getConnection(DATABASE_URL, getProperties());
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return connection;
    }

    // disconnect database
    public void disconnect() {
        if (connection != null) {
            try {
                connection.close();
                connection = null;
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public static void main(String[] args) {
        MysqlConnect mysqlConnect = new MysqlConnect("108.179.232.53", "suites_sales_inventory", "sgsuites_dtech", "Dt3ch$olutions");
        if (!(mysqlConnect.connect() == null)) {
            System.out.println("Remote Database successfully connected!!! ");
        } else {
            System.out.println("Remote Database failed to connect!!! ");
        }

    }
}
