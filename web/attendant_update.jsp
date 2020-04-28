<%@ include file="header.jsp" %>  

    <body>
 
        <sql:setDataSource 
            var="dbsource" 
            driver="com.mysql.jdbc.Driver"
            url="jdbc:mysql://localhost/mobile_money"
            user="root"  
            password=""
          />
 
        <sql:query dataSource="${dbsource}" var="result">
            SELECT * from kiosk_attendant where attendant_id=?;
            <sql:param value="${param.attendant_id}" />
        </sql:query>
            
        <form action="attendant_updatedb.jsp" method="post">
            <table border="0" width="40%">
                <caption>Update Info</caption>
                <tr>
                    <th>Id</th>
                    <th>Username</th>
                    <th>Agent Number</th>
                    <th>Kiosk Name</th>
                </tr>
                <c:forEach var="row" items="${result.rows}">
                    <tr>
                        <td><input type="hidden" value="${param.attendant_id}" name="attendant_id"/></td>
                        <td><input type="text" value="${row.username}" name="username"/></td>
                        <td><input type="text" value="${row.agent_number}" name="agent_number"/></td>
                        <td><input type="text" value="${row.kiosk_name}" name="kiosk_name"/></td>
                        <td><input type="submit" value="Update"/></td>
                    </tr>
                </c:forEach>
            </table>
            <a href="attendant_display.jsp">Attendant List</a>
        </form>
            
 <%@ include file="footer.jsp" %>