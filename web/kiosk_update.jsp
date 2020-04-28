<%@ include file="header.jsp" %>  
    <body>
 
        <sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost/mobile_money"
                           user="root"  password=""/>
 
        <sql:query dataSource="${dbsource}" var="result">
            SELECT * from kiosk where Kiosk_id=?;
            <sql:param value="${param.Kiosk_id}" />
        </sql:query>
            
        <form action="kiosk_updatedb.jsp" method="post">
            <table border="0" width="40%">
                <caption>Update Info</caption>
                <tr>
                    <th>Id</th>
                    <th>Kiosk name</th>
                    <th>Kiosk Phone Number</th>
                    <th>airtel float</th>
                    <th>MTN float</th>
                    <th>airtel cash</th>
                    <th>MTN cash</th>
                    <th>Attendant Username</th>
                </tr>
                <c:forEach var="row" items="${result.rows}">
                    <tr>
                        <td><input type="hidden" value="${param.Kiosk_id}" name="attendant_id"/></td>
                        <td><input type="text" value="${row.kiosk_name}" name="kiosk_name"/></td>
                        <td><input type="text" value="${row.kiosk_phone_number}" name="kiosk_phone_number"/></td>
                        <td><input type="text" value="${row.airtel_float}" name="airtel_float"/></td>
                        <td><input type="text" value="${row.MTN_float}" name="MTN_float"/></td>
                        <td><input type="text" value="${row.airtel_cash}" name="airtel_cash"/></td>
                        <td><input type="text" value="${row.MTN_cash}" name="MTN_cash"/></td>
                        <td><input type="text" value="${row.attendant_username}" name="attendant_username"/></td>
                        <td><input type="submit" value="Update"/></td>
                    </tr>
                </c:forEach>
            </table>
            <br/>
            <br/>
            <a href="kiosks_display.jsp"  class="btn btn-success" role="button">View Kiosks</a>
                <a href="admin_profile.jsp"  class="btn btn-success" role="button">Main menu</a>
        </form>
            <br/>
            <br/>
            
<%@ include file="footer.jsp" %>