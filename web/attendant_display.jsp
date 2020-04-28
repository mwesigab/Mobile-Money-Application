<%@ include file="header.jsp" %>  
    <body>
       <div class="container">

        <div class="row">
            <div class="box">
                
                <div class="col-lg-12">
                    <hr>
                    <h2 class="intro-text text-center">THE
                        <strong>ATTENDANT LIST</strong>
                    </h2>
                    <hr>
                </div>
     <sql:setDataSource 
       var="dbsource" 
       driver="com.mysql.jdbc.Driver"
       url="jdbc:mysql://localhost/mobile_money"
       user="root"  password=""/>
 
   <sql:query dataSource="${dbsource}" var="result"> SELECT * from kiosk_attendant; </sql:query> 

    <a href="add_attendant.jsp"  class="btn btn-primary" role="button">Add Attendant</a>
    <a href="admin_profile.jsp"  class="btn btn-success" role="button">Main menu</a>
    <br/><br/>
    
   <table border="1" width="100%" class="table table-striped"> 
       <tr> 
           <th>attendant ID</th>
           <th>Username</th> 
           <th>Agent number</th> 
           <th>Kiosk name</th> 
           <th>Edit</th>
       </tr> 
   
   <c:forEach var="row" items="${result.rows}"> 
       <tr> 
           <td><c:out value="${row.attendant_id}"/></td> 
           <td><c:out value="${row.username}"/></td> 
           <td><c:out value="${row.agent_number}"/></td> 
           <td><c:out value="${row.kiosk_name}"/></td> 
           <td><a href="attendant_update.jsp?attendant_id=<c:out value="${row.attendant_id}"/>">Update</a></td>
       </tr>
    </c:forEach>
       </table
     </center>
            </div>
        </div>
       </div>
   
<%@ include file="footer.jsp" %>  
