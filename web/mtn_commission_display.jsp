<%@include file="header.jsp"%>

        
       <div class="container">

        <div class="row">
            <div class="box">
                
                <div class="col-lg-12">
                    <hr>
                    <h2 class="intro-text text-center">
                        <strong>MTN COMMISSIONS</strong>
                    </h2>
                    <hr>
                </div>
                
           <sql:setDataSource 
       var="dbsource" 
       driver="com.mysql.jdbc.Driver"
       url="jdbc:mysql://localhost/mobile_money"
       user="root"  password=""/>
            
   <sql:query dataSource="${dbsource}" var="result"> SELECT * from mtn_commission; </sql:query> 

   <a href="add_kiosk.jsp"  class="btn btn-primary" role="button">Add Kiosk</a>
    <a href="admin_profile.jsp"  class="btn btn-success" role="button">Main menu</a>
    <br/><br/>
    
   <table border="1" width="100%" class="table table-striped"> 
       <tr> 
           <th>MTN Commission ID</th>
           <th>Kiosk Name</th> 
           <th>Commission</th> 
           <th>Pay</th>
       </tr> 
   
   <c:forEach var="row" items="${result.rows}"> 
       <tr> 
           <td><c:out value="${row.id}"/></td> 
           <td><c:out value="${row.Kiosk_name}"/></td> 
           <td><c:out value="${row.commission}"/></td> 
            <td><a href="mtn_commission_update.jsp?id=<c:out value="${row.id}"/>">Pay Commision</a></td>
       </tr>
    </c:forEach>
       </table
     </center>

     
   
<%@include file="footer.jsp"%>