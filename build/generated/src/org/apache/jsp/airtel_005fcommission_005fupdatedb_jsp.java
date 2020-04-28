package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.io.*;
import java.util.*;
import java.sql.*;
import javax.servlet.http.*;
import javax.servlet.*;
import javax.servlet.ServletException;
import javax.swing.*;

public final class airtel_005fcommission_005fupdatedb_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(2);
    _jspx_dependants.add("/header.jsp");
    _jspx_dependants.add("/footer.jsp");
  }

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write(" \n");
      out.write("\n");
      out.write("\n");
      out.write(" \n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("         <link rel=\"shortcut icon\" href=\"images/admin2.png\"/>\n");
      out.write("         <link href=\"css/bootstrap.css\" rel=\"stylesheet\" >\n");
      out.write("          <link href=\"css/bootstrap.min.css\" rel=\"stylesheet\" >\n");
      out.write("          <link href=\"css/business-casual.css\" rel=\"stylesheet\" >\n");
      out.write("          <link href=\"css/main.css\" rel=\"stylesheet\">\n");
      out.write("        <title>mobile money</title>\n");
      out.write("        \n");
      out.write("        \n");
      out.write("        <style type=\"text/css\">\n");
      out.write("            p{\n");
      out.write("                color:white;\n");
      out.write("                background-color:red;\n");
      out.write("                margin-left: 100px;\n");
      out.write("                margin-right:100px;\n");
      out.write("                padding-left:200px;\n");
      out.write("            }\n");
      out.write("            \n");
      out.write("            #footer_left{\n");
      out.write("                background-color: lightblue;\n");
      out.write("                margin-left: 0px;\n");
      out.write("                margin-right:0px;\n");
      out.write("                \n");
      out.write("            }\n");
      out.write("            \n");
      out.write("            #container{\n");
      out.write("                margin-left: 500px;\n");
      out.write("            }\n");
      out.write("            \n");
      out.write("            body{\n");
      out.write("                \n");
      out.write("              \n");
      out.write("                background-color: lavender;\n");
      out.write("            }\n");
      out.write("          \n");
      out.write("            \n");
      out.write("              \n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("  \n");
      out.write("    <div class=\"brand\">\n");
      out.write("        <p>\n");
      out.write("        MOBILE MONEY APP\n");
      out.write("        </p>\n");
      out.write("    </div>");
      out.write("\n");
      out.write("\n");
      out.write("<center>\n");
      out.write("        <h5>Commission:\n");
      out.write("        ");
      out.print( request.getParameter("id"));
      out.write("<br/>\n");
      out.write("        </h5>\n");
      out.write("        <h5>\n");
      out.write("        Payment:\n");
      out.write("        ");
      out.print(request.getParameter("payment") );
      out.write("<br/>\n");
      out.write("        </h5>\n");
      out.write("        <h5>\n");
      out.write("        Id:\n");
      out.write("        ");
      out.print(request.getParameter("commission") );
      out.write("\n");
      out.write("        </h5>\n");
      out.write("       \n");
      out.write("        <form action=\"airtel_commission_updatedb2.jsp\" method=\"POST\">\n");
      out.write("       \n");
      out.write("          The ID is  <input type=\"text\" size=\"30\" name=\"id\" value=\"\n");
      out.write("                   ");

                 int y=Integer.parseInt(request.getParameter("commission"));
                 out.println(y);
                   
      out.write("\n");
      out.write("                   \"/><br/>\n");
      out.write("Your Balance <input type=\"text\" size=\"30\" name=\"balance\" value=\"\n");

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

      out.write("\n");
      out.write("\" />\n");
      out.write("\n");
      out.write("<input type=\"text\" value=\"");

         String kiosk_name= request.getParameter("name");
         out.println(kiosk_name);
       
      out.write("\"\n");
      out.write("       size=\"30\" name=\"kioskName\"/>\n");
      out.write("\n");
      out.write("<input type=\"submit\" value=\"update commission value\"/>\n");
      out.write("        </form>\n");
      out.write("\n");
      out.write("</center>    \n");
      out.write("   \n");
      out.write("    </div>\n");
      out.write("<footer id=\"x\">\n");
      out.write("        <div class=\"container\">\n");
      out.write("            <div class=\"row\">\n");
      out.write("                <div class=\"col-lg-12 text-center\">\n");
      out.write("\n");
      out.write("            <div id=\"footer_left\">\n");
      out.write("\t\t\t\t <div class=\"address-bar\">BSE 2205 | COCIS MAKERERE, CA 90210 | NETWORK APPLICATION DEV'PT\n");
      out.write("                                 <br/>\n");
      out.write("                                 LUBANGA EMMANUEL OLEGA, MWESIGA BENJAMIN, JJUUKO HENRY, TWEBAZE JOSHUA\n");
      out.write("                                 </div>\n");
      out.write("            \tCopyright © 2017 <a href=\"#\">  Your name</a><br />\n");
      out.write("         \n");
      out.write("                \n");
      out.write("            </div>\n");
      out.write("\t\t\t\n");
      out.write("            <div class=\"cleaner\"></div>\n");
      out.write(" \t\t\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("   \n");
      out.write("    </footer>\n");
      out.write("    </body>\n");
      out.write("</html>");
      out.write('\n');
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
