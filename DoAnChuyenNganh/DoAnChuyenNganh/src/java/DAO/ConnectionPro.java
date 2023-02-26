/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.*;

public class ConnectionPro {

    private static String jdbcURL = "jdbc:mysql://localhost:3306/quanlydethi?characterEncoding=UTF8";
    private static String dbUser = "root";
    private static String dbPassword = "";

    private static Connection con;

    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }
}
