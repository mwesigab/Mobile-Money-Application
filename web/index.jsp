<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%> 
<%@ page import="javax.servlet.http.*,javax.servlet.*,javax.servlet.ServletException" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%> 

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="shortcut icon" href="images/admin2.png"/>
         <link href="css/bootstrap.css" rel="stylesheet" >
          <link href="css/bootstrap.min.css" rel="stylesheet" >
          <link href="css/business-casual.css" rel="stylesheet" >
          <link href="css/main.css" rel="stylesheet">
        <title>mobile money</title>
        
        
        <script>
            function confirmGo(m,u) {
                if ( confirm(m) ) {
                    window.location = u;
                }
            }
        </script>
        
        <style type="text/css">
            
            #footer_left{
                background-color: lightblue;
                margin-left: 0px;
                margin-right:0px;
                
            }
            
            #container{
                margin-left: 500px;
            }
            
            body{
                background-color: lavender;
            }
          
            
              
        </style>
    </head>
  
    <body>
        
    <center> <h1>Welcome to this mobile money servlet</h1></center>
    <center><img src="images/1.jpg" width="1000px" height="200px"/></center>
    <br/>
    <center>
        <a href="admin_login.jsp">admin login</a>  
     </center>

