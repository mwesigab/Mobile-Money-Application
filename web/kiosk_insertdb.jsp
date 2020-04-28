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
        <title>mobile money</title>
    </head>
    <body>
           <sql:setDataSource 
       var="dbsource" 
       driver="com.mysql.jdbc.Driver"
       url="jdbc:mysql://localhost/mobile_money"
       user="root"  password=""/>
   
        <sql:update dataSource="${dbsource}" var="result">
            INSERT INTO kiosk(Kiosk_name, kiosk_phone_number,airtel_float,MTN_float,airtel_cash,MTN_cash,attendant_username) VALUES (?,?,?,?,?,?,?);
            <sql:param value="${param.Kiosk_name}" />
            <sql:param value="${param.kiosk_phone_number}" />
            <sql:param value="${param.airtel_float}" />
            <sql:param value="${param.MTN_float}" />
            <sql:param value="${param.airtel_cash}" />
            <sql:param value="${param.MTN_cash}" />
            <sql:param value="${param.attendant_username}" />
        </sql:update>
            
        <c:if test="${result>=1}">
            <font size="5" color='green'> Congratulations ! Data inserted
            successfully.</font>
 
            <c:redirect url="kiosks_display.jsp" >
                <c:param name="susMsg" value="Congratulations ! Data inserted
            successfully." />
            </c:redirect>
        </c:if> 
     </center>
    </body>
</html>