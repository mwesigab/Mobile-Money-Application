<%@ include file="header.jsp" %>  
    <body>
         <div class="container" id="container">
     <div class="row">
          <div class="col-lg-4 col-sm-4 well">
              <a href="attendant_display.jsp"  class="btn btn-success" role="button">View Attendants</a>
              <a href="admin_profile.jsp"  class="btn btn-success" role="button">Main menu</a>
              <form action="attendant_insertdb.jsp" method="post">
		<fieldset>
		<legend><h1>Add Attendant</h1></legend>
                
                 <div class="form-group">
		<div class="error"><?php echo form_error('username'); ?></div>
		<label for="Kiosk name">Username</label>
		<input type="text" name="username" placeholder="username" size="30" class="form-control" class="username-field"/>
		</div>
                
                 <div class="form-group">
		<div class="error"><?php echo form_error('username'); ?></div>
		<label for="Kiosk name">Agent Number</label>
		<input type="text" name="agent_number" placeholder="agent number" size="30" class="form-control" class="username-field"/>
		</div>
                
                 <div class="form-group">
		<div class="error"><?php echo form_error('username'); ?></div>
		<label for="Kiosk name">Kiosk Name</label>
		<input  type="text" name="kiosk_name" placeholder="kiosk name" size="30" class="form-control" class="username-field"/>
		</div>
                
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
            <a href="attendant_display.jsp"  class="btn btn-success" role="button">View Attendants</a>
        </c:if></font
        
       
<%@ include file="footer.jsp" %>