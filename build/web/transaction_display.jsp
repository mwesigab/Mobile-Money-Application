<%@include file="header.jsp"%>

        
       <div class="container">

        <div class="row">
            <div class="box">
                
                <div class="col-lg-12">
                    <hr>
                    <h2 class="intro-text text-center">THE
                        <strong>TRANSACTIONS</strong>
                    </h2>
                    <hr>
                </div>
                
              <form action="transaction_search.jsp" method="post" class="navbar-form navbar-left" name="form1">
	     <input type="text" name="search" class="form-control" id="search" placeholder="search by kiosk attendant" size="50"/>
	    <input type="submit" name="submit" class="btn btn-default" id="search" value="search"/>
	    </form>
                
           <sql:setDataSource 
       var="dbsource" 
       driver="com.mysql.jdbc.Driver"
       url="jdbc:mysql://localhost/mobile_money"
       user="root"  password=""/>
            
   <sql:query dataSource="${dbsource}" var="result"> SELECT * from transaction; </sql:query> 

    <a href="admin_profile.jsp"  class="btn btn-success" role="button">Main menu</a>
    <br/><br/>
    
   <table border="1" width="100%" class="table table-striped"> 
       <tr> 
           <th>TRANSACTIONS</th>
           <th>Transaction Type</th> 
           <th>Date And Time</th> 
           <th>Amount</th> 
           <th>Kiosk Phone Number</th> 
           <th>Customer phone Number</th> 
           <th>Carrier Network</th> 
           <th>Commited By</th> 
       </tr> 
   
   <c:forEach var="row" items="${result.rows}"> 
       <tr> 
           <td><c:out value="${row.transaction_id}"/></td> 
           <td><c:out value="${row.transaction_type}"/></td> 
           <td><c:out value="${row.date_and_time}"/></td> 
           <td><c:out value="${row.amount}"/></td> 
           <td><c:out value="${row.kiosk_phone_number}"/></td> 
           <td><c:out value="${row.customer_phone_number}"/></td> 
           <td><c:out value="${row.carrier_network}"/></td> 
           <td><c:out value="${row.comitted_by}"/></td> 
       </tr>
    </c:forEach>
       </table
     </center>
     
   
<%@include file="footer.jsp"%>