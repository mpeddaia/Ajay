import com.cisco.appsui.core.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

/*
 * Generates CISCO.COM Embedded framework using Application Migration API.
 * demonstrates the usage of ChildLeftNavGenerator.
 */
public class  CampChildLeftNavSample  extends javax.servlet.http.HttpServlet{
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
			bodySb.append("<span class=\"content\"> This example shows local navigation with groups and tabs in left column and steps across top </span>");
			bodySb.append("<BR><BR>");


			//creates an instance of PageComposer
			PageComposer myPage = new PageComposer(this.getServletContext().getRealPath("/") +
                	"/WEB-INF/data/PageComposer.properties",true);


			//setting the apptemplates dir
			myPage.setAppTemplatesDir(appTemplatesDir);

			//setting the entitlement level to zero.This will override the  value (guest)
			//of entitlement level set in PageComposer.properties
			myPage.setEntitlementLevel("4");

			/* --------------       using ChildLeftNavGenerator	 -------------------- */

			 // set ChildLeftNav properties dynamically in CCX env, since
			 // file path differs in dev, stage, and prod
				myPage.setChildLeftNavConfigFile(this.getServletContext().getRealPath("/") +
					"/WEB-INF/data/ChildLeftNav2.properties",true);

			 // Activate Child Left Nav
				myPage.activateChildLeftNavGenerator(true);

			 // Set current Group
				myPage.setChildLeftNavCurrentGroup(1);

			 // Set current Tab
				myPage.setChildLeftNavCurrentTab(2);

			 // Set current Step
				myPage.setChildLeftNavCurrentStep(1);

			 // Set window type to child
				myPage.setWindowType("child");

		  /* --------------       using ChildLeftNavGenerator	 -------------------- */

			out.print(myPage.renderPage(bodySb.toString()));


		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
}
