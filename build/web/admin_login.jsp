
<%@ include file="index.jsp" %>  
<hr/>  
  
    <%  
    String profile_msg=(String)request.getAttribute("profile_msg");  
    if(profile_msg!=null){  
    out.print(profile_msg);  
            }  

    String login_msg=(String)request.getAttribute("login_msg");  
    if(login_msg!=null){  
    out.print(login_msg);  
        }  
 %>  
 <br/> 
 <center
     
        <div class="container" id="container">
     <div class="row">
          <div class="col-lg-4 col-sm-4 well">
        <form action="Login1" method="post">
            <fieldset>
            
                <legend><h3>Administrator Login</h3></legend>
                <div class="form-group">
		<label for="Kiosk name">Username</label>
		<input type="text" name="Username" placeholder="username" size="30" class="form-control" class="username-field"/>
		</div>
                    
                <div class="form-group">
		<label for="Kiosk name">Password</label>
		<input type="password" name="password" placeholder="password" size="30" class="form-control" class="username-field"/>
		</div>

                <button type="submit" name="submit" class="btn btn-primary">login</button>
       </fieldset>
		</form>
		</div>
		</div>
		</div> 

     </center>
 <%@ include file="footer.jsp" %>

