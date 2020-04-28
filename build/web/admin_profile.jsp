<%@ include file="header.jsp" %>  
    <body>

        <h1><center>WELCOME TO THE SYSTEM JACK</center></h1>
    <center>
        <img src="images/mtn.jpg" height="150px" width="300px"/>
        <img src="images/kiosk.jpg" height="150px" width="300px"/>
    </center>
    <br/>
    <br/>
        <center>
            <a href="add_attendant.jsp"  class="btn btn-primary" role="button">Add Attendant</a>
            <a href="attendant_display.jsp"  class="btn btn-success" role="button">View Attendants</a>
            <a href="add_kiosk.jsp"  class="btn btn-primary" role="button">Add Kiosk</a>
            <a href="kiosks_display.jsp"  class="btn btn-success" role="button">View Kiosks</a>
        </center>
        <br/>
        <br/>
        <center>
            <a href="mtn_commission_display.jsp"  class="btn btn-warning">MTN Commission</a>
            <a href="airtel_commission_display.jsp"  class="btn btn-danger">AIRTEL Commission</a>
            <a href="transaction_display.jsp"  class="btn btn-warning">View Transactions</a>
        </center>
        
        <br/>
        <br/>
 
<%@ include file="footer.jsp" %>