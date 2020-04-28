<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost/mobile_money"
                           user="root"  password=""/>
        
        <sql:update dataSource="${dbsource}" var="count">
            UPDATE kiosk_attendant SET username = ?, agent_number=?, kiosk_name=?
            WHERE attendant_id='${param.attendant_id}'
            <sql:param value="${param.username}" />
            <sql:param value="${param.agent_number}" />
            <sql:param value="${param.kiosk_name}" />
        </sql:update>
        <c:if test="${count>=1}">
            <font size="5" color='green'> Congratulations ! Data updated
            successfully.</font>
              <a href="attendant_display.jsp">Updated Attendant list</a>          
        </c:if>
    </body>
</html>
