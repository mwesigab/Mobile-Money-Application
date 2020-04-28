 <%@ include file="header.jsp"%>
    <body>
       
   <div class="container" id="container">
     <div class="row">
          <div class="col-lg-4 col-sm-4 well">
                <a href="kiosks_display.jsp"  class="btn btn-success" role="button">View Kiosks</a>
                <a href="admin_profile.jsp"  class="btn btn-success" role="button">Main menu</a>
        <form action="kiosk_insertdb.jsp" method="post">
            <fieldset>
            
                <legend><h1>Add Kiosk</h1></legend>
                <table border="0">
                <tbody>
                    <tr>
                        <td><label>Kiosk Name</label></td>
                        <td><input type="text" name="Kiosk_name" placeholder="kiosk name"/></td>
                    </tr>
                    
                    <tr>
                        <td><label>Kiosk Phone Number</label></td>
                        <td><input type="text" name="kiosk_phone_number" placeholder="Kiosk phone number"/></td>
                    </tr>
                    <tr>
                        <td><label>Airtel Float</label></td>
                        <td><input type="text" name="airtel_float" placeholder="airtel float"/></td>
                    </tr>
                    <tr>
                        <td><label>MTN float</label></td>
                        <td><input type="text" name="MTN_float" placeholder="MTN float"/></td>
                    </tr>
                     <tr>
                        <td><label>Airtel Cash</label></td>
                        <td><input type="text" name="airtel_cash" placeholder="airtel cash"/></td>
                    </tr>
                     <tr>
                        <td><label>MTN Cash</label></td>
                        <td><input type="text" name="MTN_cash" placeholder="MTN cash"/></td>
                    </tr>
                    <tr>
                        <td><label>Attendant Username</label></td>
                        <td><input type="text" name="attendant_username" placeholder="Attendant Username"/></td>
                    </tr>
                    
                </table>
                <button type="submit" name="submit" class="btn btn-primary">Add</button>
       </fieldset>
		</form>
		</div>
		</div>
		</div> 
        <font color="red"><c:if test="${not empty param.errMsg}">
            <c:out value="${param.errMsg}" />
            <a href="admin_profile.jsp">Go Back</a>
        </c:if></font>
        <font color="green"><c:if test="${not empty param.susMsg}">
            <c:out value="${param.susMsg}" />
            <a href="admin_profile.jsp">Go Back</a>
        </c:if></font
        
 <%@ include file="footer.jsp"%>