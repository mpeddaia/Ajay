import com.cisco.appsui.core.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

/*
 * Generates CISCO.COM Embedded framework using Application Migration API.
 * This example shows how to generate a help window.
 */
public class  CampHelpSample extends javax.servlet.http.HttpServlet{
	public void doGet(javax.servlet.http.HttpServletRequest req,
			  javax.servlet.http.HttpServletResponse res)
	throws ServletException, IOException{
		try {
			PrintWriter out = res.getWriter();

			System.setProperty("com.cisco.appsui.rootPath", this.getServletContext().getRealPath("/") +
							"/WEB-INF/templates/");
			String appTemplatesDir="FooTemplates1.0";

			// setting the body string
			StringBuffer bodySb;
			bodySb = new StringBuffer();
			bodySb.append("<br><P align=center>APPLICATION CONTENT CELL<br>");

			bodySb.append("<BR><BR>");
			bodySb.append("<span class=\"contentbold\"> Hello Cisco Systems </span>");
			bodySb.append("<BR><BR>");
			bodySb.append("<span class=\"content\"> This example shows how to generate a help window</span>");
			bodySb.append("<BR><BR>");


			//creates an instance of PageComposer
			PageComposer myPage = new PageComposer(this.getServletContext().getRealPath("/") +
                	"/WEB-INF/data/PageComposer.properties",true);

			//setting the apptemplates dir
			myPage.setAppTemplatesDir(appTemplatesDir);

			//setting the entitlement level to zero.This will override the  value (guest)
			//of entitlement level set in PageComposer.properties
			myPage.setEntitlementLevel("4");

		  /* --------------       using help window	 -------------------- */

			//setting window type to email
			myPage.setWindowType("help");

		  /* --------------       using help window	 -------------------- */

			out.print(myPage.renderPage(bodySb.toString()));


		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
}
