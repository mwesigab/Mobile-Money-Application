
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Login1 extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
          String userid=request.getParameter("Username");
           String pswd=request.getParameter("password");
             if(pswd.equals("admin") && userid.equals("admin")){
              RequestDispatcher rd=request.getRequestDispatcher("admin_profile.jsp"); 
               rd.forward(request, response);  
             
             }else{
                

                out.println("<h5 style='color:red;'>Sorry UserName or Password Error!</h5>");
                out.println("Username is <b style='color:green;'>admin</b> and Password is <b style='color:green;'>admin</b>");
                //rd.include(request, response);
             
             
             
             }
     
    }
    }


