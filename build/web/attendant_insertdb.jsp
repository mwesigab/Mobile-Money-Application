<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%> 

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
         <script>
            function confirmGo(m,u) {
                if ( confirm(m) ) {
                    window.location = u;
                }
            }
        </script>
    </head>
    <body>
             <sql:setDataSource 
       var="dbsource" 
       driver="com.mysql.jdbc.Driver"
       url="jdbc:mysql://localhost/mobile_money"
       user="root"  password=""/>
   
        <sql:update dataSource="${dbsource}" var="result">
            INSERT INTO kiosk_attendant(username, agent_number,kiosk_name) VALUES (?,?,?);
            <sql:param value="${param.username}" />
            <sql:param value="${param.agent_number}" />
            <sql:param value="${param.kiosk_name}" />
        </sql:update>
            
        <c:if test="${result>=1}">
            <font size="5" color='green'> Congratulations ! Data inserted
            successfully.</font>
 
            <c:redirect url="add_attendant.jsp" >
                <c:param name="susMsg" value="Congratulations ! Data inserted
            successfully." />
            </c:redirect>
        </c:if> 
        
    </body>
</html>
