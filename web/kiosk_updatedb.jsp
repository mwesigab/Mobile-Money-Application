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
            UPDATE kiosk SET kiosk_name = ?, kiosk_phone_number=?, airtel_float=?, MTN_float=?, airtel_cash=?, MTN_cash=?, attendant_username=?
            WHERE Kiosk_id='${param.attendant_id}'
            <sql:param value="${param.kiosk_name}" />
            <sql:param value="${param.kiosk_phone_number}" />
            <sql:param value="${param.airtel_float}" />
            <sql:param value="${param.MTN_float}" />
            <sql:param value="${param.airtel_cash}" />
            <sql:param value="${param.MTN_cash}" />
            <sql:param value="${param.attendant_username}" />
        </sql:update>
  
        <c:if test="${count>=1}">
            <font size="5" color='green'> Congratulations ! Data updated
            successfully.</font>
              <a href="kiosks_display.jsp">Updated Kiosk list</a>          
        </c:if>
    </body>
</html>
