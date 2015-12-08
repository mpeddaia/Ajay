import com.cisco.appsui.core.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

/*
 * Generates CISCO.COM Embedded framework using Application Migration API.
 * demonstrates the usage of AppNavGenerator tabs and steps.
 */
public class  CampAppNavGeneratorSample  extends javax.servlet.http.HttpServlet{
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
			bodySb.append("<span class=\"content\"> This example shows local navigation with tabs and steps across top </span>");
			bodySb.append("<BR><BR>");


			//creates an instance of PageComposer
			PageComposer myPage = new PageComposer(this.getServletContext().getRealPath("/") +
		                	"/WEB-INF/data/PageComposer.properties",true);

			//setting the AppNav properties file
            myPage.setAppNav(this.getServletContext().getRealPath("/") +
			        		"/WEB-INF/data/AppNav.properties",true);

			//setting the apptemplates dir
			myPage.setAppTemplatesDir(appTemplatesDir);

			//setting the entitlement level to zero.This will override the  value (guest)
			//of entitlement level set in PageComposer.properties
			myPage.setEntitlementLevel("4");

			//activate the AppNav
			myPage.activateAppNavGenerator(true);

			//This method call is used to change the tab type from the default value set
			//inside the AppNav.properties file.Use either STANDARD or STEPWISE
			myPage.setAppNavTabType("STEPWISE");

			//This method call is used to change the step type of the third tab from the
			//default value set inside the AppNav.properties file.Use either STANDARD or STEPWISE
			myPage.setAppNavStepType(3,"STEPWISE");

			//This method call is used to change the name of the third tab from the
			//default value set inside the AppNav.properties file.
			myPage.setAppNavTabName(3,"Renamed Tab");

			//sets the current tab to 2
			myPage.setAppNavCurrentTab(4);

			//sets teh current step to 3
			myPage.setAppNavCurrentStep(3);

			out.print(myPage.renderPage(bodySb.toString()));


		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
}
