<%@include file="header.jsp"%>

        
       <div class="container">

        <div class="row">
            <div class="box">
                
                <div class="col-lg-12">
                    <hr>
                    <h2 class="intro-text text-center">THE
                        <strong>KIOSK LIST</strong>
                    </h2>
                    <hr>
                </div>
                
            <form action="kiosk_search.jsp" method="post" class="navbar-form navbar-left" name="form1">
	     <input type="text" name="search" class="form-control" id="search" placeholder="search by kiosk name" size="50"/>
	    <input type="submit" name="submit" class="btn btn-default" id="search" value="search"/>
	    </form>
                
           <sql:setDataSource 
       var="dbsource" 
       driver="com.mysql.jdbc.Driver"
       url="jdbc:mysql://localhost/mobile_money"
       user="root"  password=""/>
            
   <sql:query dataSource="${dbsource}" var="result"> SELECT * from kiosk; </sql:query> 

   <a href="add_kiosk.jsp"  class="btn btn-primary" role="button">Add Kiosk</a>
    <a href="admin_profile.jsp"  class="btn btn-success" role="button">Main menu</a>
    <br/><br/>
    
   <table border="1" width="100%" class="table table-striped"> 
       <tr> 
           <th>KIOSK ID</th>
           <th>Kiosk Name</th> 
           <th>Kiosk Phone Number</th> 
           <th>Airtel Float</th> 
           <th>MTN float</th> 
           <th>Airtel Cash</th> 
           <th>MTN Cash</th> 
           <th>Attendant Username</th> 
           <th>Edit</th>
       </tr> 
   
   <c:forEach var="row" items="${result.rows}"> 
       <tr> 
           <td><c:out value="${row.Kiosk_id}"/></td> 
           <td><c:out value="${row.Kiosk_name}"/></td> 
           <td><c:out value="${row.kiosk_phone_number}"/></td> 
           <td><c:out value="${row.airtel_float}"/></td> 
           <td><c:out value="${row.MTN_float}"/></td> 
           <td><c:out value="${row.airtel_cash}"/></td> 
           <td><c:out value="${row.MTN_cash}"/></td> 
           <td><c:out value="${row.attendant_username}"/></td> 
            <td><a href="kiosk_update.jsp?Kiosk_id=<c:out value="${row.Kiosk_id}"/>">Update</a></td>
       </tr>
    </c:forEach>
       </table
     </center>
     
   
<%@include file="footer.jsp"%>