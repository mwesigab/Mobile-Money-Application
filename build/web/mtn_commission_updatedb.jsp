<%@include file="header.jsp"%>

<center>
        <h5>Commission:
        <%= request.getParameter("id")%><br/>
        </h5>
        <h5>
        Payment:
        <%=request.getParameter("payment") %><br/>
        </h5>
        <h5>
        Id:
        <%=request.getParameter("commission") %>
        </h5>
       
        <form action="mtn_commission_updatedb2.jsp" method="POST">
       
          The ID is  <input type="text" size="30" name="id" value="
                   <%
                 int y=Integer.parseInt(request.getParameter("commission"));
                 out.println(y);
                   %>
                   "/><br/>
Your Balance <input type="text" size="30" name="balance" value="
<%
    try{
    int x=Integer.parseInt(request.getParameter("payment"));
    int z=Integer.parseInt(request.getParameter("id"));

    
    int balance = z - x;
    
    out.println(balance);

        }
    catch(Exception e)
        {
        out.println("You entered invalid number");
}
%>
" />
<input type="text" value="<%
         String kiosk_name= request.getParameter("name");
         out.println(kiosk_name);
       %>"
       size="30" name="kioskName"/>
<input type="submit" value="update commission value"/>
        </form>

</center>    
   
<%@include file="footer.jsp"%>
