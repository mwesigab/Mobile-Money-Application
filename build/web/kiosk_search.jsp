<%@include file="header.jsp"%>

        
       <div class="container">

        <div class="row">
            <div class="box">
                
                                
            <form action="kiosk_search.jsp" method="post" class="navbar-form navbar-left" name="form1">
	     <input type="text" name="search" class="form-control" id="search" placeholder="search by kiosk name" size="50"/>
	    <input type="submit" name="submit" class="btn btn-default" id="search" value="search"/>
	    </form>
                  
           <sql:setDataSource 
       var="dbsource" 
       driver="com.mysql.jdbc.Driver"
       url="jdbc:mysql://localhost/mobile_money"
       user="root"  password=""/>
           
   
      <sql:query dataSource="${dbsource}" var="result">
       
       SELECT * FROM kiosk WHERE kiosk_name LIKE ? 
            <sql:param value="${param.search}" />
        </sql:query>
       
         <sql:query dataSource="${dbsource}" var="result2">
       
       SELECT kiosk.Kiosk_id, kiosk.kiosk_name, kiosk.kiosk_phone_number, kiosk.airtel_float, kiosk.airtel_cash, kiosk.MTN_float, kiosk.MTN_cash,
       kiosk.attendant_username, kiosk_attendant.agent_number, kiosk_attendant.kiosk_name,
       airtel_commission.kiosk_name, airtel_commission.commission,
       mtn_commission.kiosk_name, mtn_commission.commission
       
       FROM kiosk, kiosk_attendant, airtel_commission, mtn_commission
       WHERE kiosk.kiosk_name LIKE ?
       AND kiosk.kiosk_name = kiosk_attendant.kiosk_name
       AND kiosk.kiosk_name = airtel_commission.kiosk_name
       AND kiosk.kiosk_name  = mtn_commission.kiosk_name
       ORDER BY kiosk.Kiosk_id
            <sql:param value="${param.search}" />
        </sql:query>
       
       <sql:query dataSource="${dbsource}" var="result3">
       
       SELECT kiosk.Kiosk_id, kiosk.kiosk_name, kiosk.kiosk_phone_number, kiosk.airtel_float, kiosk.airtel_cash, kiosk.MTN_float, kiosk.MTN_cash,
       transaction.comitted_by,transaction.transaction_type, transaction.date_and_time, transaction.customer_phone_number, transaction.carrier_network, transaction.amount
       
       FROM kiosk,transaction
       WHERE kiosk.kiosk_name LIKE ?
       AND kiosk.attendant_username = transaction.comitted_by
       AND transaction.carrier_network = 'mtn'
       ORDER BY kiosk.Kiosk_id
            <sql:param value="${param.search}" />
        </sql:query>
       
       <sql:query dataSource="${dbsource}" var="result4">
       
       SELECT kiosk.Kiosk_id, kiosk.kiosk_name, kiosk.kiosk_phone_number, kiosk.airtel_float, kiosk.airtel_cash, kiosk.MTN_float, kiosk.MTN_cash,
       transaction.comitted_by,transaction.transaction_type, transaction.date_and_time, transaction.customer_phone_number, transaction.carrier_network, transaction.amount
       
       FROM kiosk,transaction
       WHERE kiosk.kiosk_name LIKE ?
       AND kiosk.attendant_username = transaction.comitted_by
       AND transaction.carrier_network = 'airtel'
       ORDER BY kiosk.Kiosk_id
            <sql:param value="${param.search}" />
        </sql:query>


   <a href="add_kiosk.jsp"  class="btn btn-primary" role="button">Add Kiosk</a>
    <a href="admin_profile.jsp"  class="btn btn-success" role="button">Main menu</a>
    <a href="kiosks_display.jsp"  class="btn btn-success" role="button">Kiosk List</a>
    <br/><br/>
  
   <c:forEach var="row" items="${result2.rows}"> 
                       <div class="col-lg-12">
                    <hr>
                    <h2 class="intro-text text-center">KIOSK: 
                        <strong><c:out value="${row.Kiosk_name}"/></strong>
                    </h2>
                    <hr>
                </div>
                    <center>
                        <table border="1">
                            
          Attendant Username: <b><c:out value="${row.attendant_username}"/></b><br/>
          Agent Number: <c:out value="${row.agent_number}"/><br/>
          Kiosk Simcard Number: <c:out value="${row.kiosk_phone_number}"/></b><br/><br/>
          MTN Cash Available: <b style="color:red;"><c:out value="${row.MTN_cash}"/></b> ||
          MTN Float Available: <b style="color:blue;"><c:out value="${row.MTN_float}"/></b><br/>
          Airtel Cash Available:<b style="color:red;"> <c:out value="${row.airtel_cash}"/></b>||
          Airtel Float Available: <b style="color:blue;"><c:out value="${row.airtel_float}"/></b><br/><br/>
          Airtel Commission:<b style="color:purple;"> <c:out value="${row.airtel_commission}"/></b>||
          MTN Commission: <b style="color:purple;"><c:out value="${row.mtn_commission}"/></b><br/>
                    </center>
   </table>
       
    </c:forEach>
                                            <hr>
                    <h2 class="intro-text text-center">THE
                        <strong> MTN TRANSACTIONS</strong>
                    </h2>
                    <hr>
                        
              <table border="1" width="100%" class="table table-striped"> 
       <tr> 
           <th>Kiosk Name</th>
           <th>Amount</th>
           <th>Carrier Network</th> 
            <th>Customer Number</th> 
             <th>Date & Time</th> 
             <th>Attendant</th>
       </tr> 
   
   <c:forEach var="row" items="${result3.rows}"> 
       <tr> 
           <td><c:out value="${row.Kiosk_name}"/></td> 
           <td><c:out value="${row.amount}"/></td> 
           <td><c:out value="${row.carrier_network}"/></td> 
           <td><c:out value="${row.customer_phone_number}"/></td> 
            <td><c:out value="${row.date_and_time}"/></td> 
            <td><c:out value="${row.comitted_by}"/></td> 
           
       </tr>
    </c:forEach>
              </table>
                    
                                                                <hr>
                    <h2 class="intro-text text-center">THE
                        <strong> AIRTEL TRANSACTIONS</strong>
                    </h2>
                    <hr>
                        
              <table border="1" width="100%" class="table table-striped"> 
       <tr> 
           <th>Kiosk Name</th>
           <th>Amount</th>
           <th>Carrier Network</th> 
            <th>Customer Number</th> 
             <th>Date & Time</th> 
             <th>Attendant</th>
       </tr> 
   
   <c:forEach var="row" items="${result4.rows}"> 
       <tr> 
           <td><c:out value="${row.Kiosk_name}"/></td> 
           <td><c:out value="${row.amount}"/></td> 
           <td><c:out value="${row.carrier_network}"/></td> 
           <td><c:out value="${row.customer_phone_number}"/></td> 
            <td><c:out value="${row.date_and_time}"/></td> 
            <td><c:out value="${row.comitted_by}"/></td> 
           
       </tr>
    </c:forEach>
              </table>
   
     
 <%@include file="footer.jsp" %>
