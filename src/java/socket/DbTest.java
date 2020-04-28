/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package socket;

/**
 *
 * @author BENNY
 */
import java.sql.*;
import java.io.*;
import java.util.*;


public class DbTest {
    public static void main(String args[]){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/trial","root","");
            Statement stmt = con.createStatement();
            String selectstr ="select * from users";
            
            ResultSet rs=stmt.executeQuery(selectstr);
            
            while(rs.next()){
                int id=rs.getInt(1);
                String name=rs.getString(2);
                String pass= rs.getString(3);
                System.out.println(id+"     "+name+"    "+pass);
            }

        }catch(Exception e){
            System.out.println(e);
        }
    }
}
