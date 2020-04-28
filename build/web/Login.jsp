<%-- 
    Document   : Login
    Created on : May 30, 2017, 2:20:56 PM
    Author     : jk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <%@ page import ="java.sql.*" %>
        <%
        
           String userid=request.getParameter("Username");
           String pswd=request.getParameter("password");
            Class.forName("com.mysql.jdbc.Driver");
            
            Connection  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mobile_money","root","");
           
           Statement st=con.createStatement();
           ResultSet rs;
           rs = st.executeQuery("select * from admin where username='" + userid + "' and password='" + pswd + "'");
          session.setAttribute("username", userid);
          session.setAttribute("password", pswd);
          
         if(rs.next()){
           session.getAttribute("userid");
           
           response.sendRedirect("admin_profile.jsp");
         
         }else {
               out.println("You are not logged in");
               out.println("<a href='admin_login.jsp'>Please Login</a>");
                   response.sendRedirect("admin_profile.jsp");  
          }
         
        
        
        
        
        
        %>
        
        
        
        
    </body>
</html>
