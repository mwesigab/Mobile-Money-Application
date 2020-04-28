
import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;


public class payment extends HttpServlet {

    public void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
          String pay=request.getParameter("payment");
          String com=request.getParameter("commission");
          String The_id=request.getParameter("id");
          
        int payment = Integer.parseInt(pay);
          int com_id = Integer.parseInt(The_id);
          int commission = Integer.parseInt(com);
          int balance = com_id - payment;
          
          out.println("<h1> Payment is "+ payment +"</h1><br/>");
          out.println("<h1> Commission "+ com_id +"</h1><br/>");
          out.println("<h1> Commission id "+ commission +"</h1><br/>");
          out.println("<h1> Balance is "+ balance +"</h1>");
          
                    try{
        // Register JDBC driver
        Class.forName("com.mysql.jdbc.Driver");
        // Open a connection
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/mobile_money","root","");
        // Execute SQL query

        Statement stmt = conn.createStatement();
        //String sql = "INSERT INTO mtn_commission VALUES('"+balance+"') WHERE id= '" + commission+"'";
        String sql = "SELECT * FROM mtn_commission";
        ResultSet rs = stmt.executeQuery(sql);
        
        while(rs.next()){
    //Retrieve by column name
        int id = rs.getInt("id");
        int age = rs.getInt("mtn_commission");
        String first = rs.getString("kiosk_name");

//Display values
        System.out.print("ID: " + id);
        System.out.print(", Age: " + age);
        System.out.print(", First: " + first);


        }
        RequestDispatcher rd=request.getRequestDispatcher("mtn_commission_display.jsp"); 

    }
    catch(Exception e){
              e.printStackTrace();        
          }
          
    }
}

 
