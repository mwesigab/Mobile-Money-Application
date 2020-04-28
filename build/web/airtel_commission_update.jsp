

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
            SELECT * from airtel_commission where id=?;
            <sql:param value="${param.id}" />
        </sql:query>
                  
    <center>    
         <c:forEach var="row" items="${result.rows}">
            <form action="airtel_commission_updatedb.jsp" method="post">
                <center>
                Enter Your payment here <input type='text' name='payment' size='30'/><input type='submit' value='submit payment'/><br/><br/>
                Commission id <input type='text' name='commission' value='${row.id}' size='30'/>
                Current Commission <input type='text' name='id' value='${row.commission}' size='30'/>
                Kiosk Name <input type='text' name='name' value='${row.Kiosk_name}' size='30'/>
                 </center>
                
            </form>
           </c:forEach>
                            
    </center>


            
 <%@ include file="footer.jsp" %>