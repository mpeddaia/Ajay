
import com.cisco.appsui.core.PageComposer;
import java.util.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

/*
 * Generates CISCO.COM Embedded framework using Application Migration API.
 * Generates related tools, related links, and ad banners dynamically
 */
public class RootPage extends javax.servlet.http.HttpServlet{
	public void doGet(javax.servlet.http.HttpServletRequest req, javax.servlet.http.HttpServletResponse res)
	throws ServletException, IOException{
		try {

			System.setProperty("com.cisco.appsui.rootPath", this.getServletContext().getRealPath("/") +
							"/WEB-INF/templates/");

			PrintWriter out = res.getWriter();

			String appTemplatesDir = "FooTemplates1.0";

			//Create Buffer to hold body of page
			StringBuffer bodySb = new StringBuffer();

			bodySb.append("<table border=\"0\" cellspacing=\"1\" cellpadding=\"7\" width=\"100%\">");
 			bodySb.append("<tr bgcolor=\"#ffffff\">");
			bodySb.append("	<td class=\"content\">");
			bodySb.append("<span class=\"contentbold\">Embedded Application</span> - demonstrates generation of CISCO.COM Embedded framework<br>");
			bodySb.append("<a href=\"CampSample\" class=\"contentlink\">View Sample App</a> |");
			bodySb.append("<a href=\"CampSample.java\" class=\"contentlink\">View Source</a><br><br>");
			bodySb.append("<span class=\"contentbold\">Child Application</span> - demonstrates generation of CISCO.COM Child window framework<br>");
			bodySb.append("<a href=\"javascript:openChildWindow('CampChildSample','child');\" class=\"contentlink\">View Sample App</a> |");
			bodySb.append("<a href=\"CampChildSample.java\" class=\"contentlink\">View Source</a><br><br>");
			bodySb.append("<span class=\"contentbold\">AppNav Sample</span> - demonstrates local navigation with AppNav tabs and steps<br>");
			bodySb.append("<a href=\"CampAppNavSample\" class=\"contentlink\">View Sample App</a> |");
			bodySb.append("<a href=\"CampAppNavGeneratorSample.java\" class=\"contentlink\">View Source</a><br><br>");
			bodySb.append("<span class=\"contentbold\">SWT Sample</span> - demonstrates dynamic generation of sitewide toolkit<br>");
			bodySb.append("<a href=\"CampSWTSample\" class=\"contentlink\">View Sample App</a> |");
			bodySb.append("<a href=\"CampSWTSample.java\" class=\"contentlink\">View Source</a><br><br>");
			bodySb.append("<span class=\"contentbold\">ChildLeftNav Sample</span> - demonstrates local navigation in child window with groups and tabs in left column and steps across top <br>");
			bodySb.append("<a href=\"javascript:openChildWindow('CampChildLeftNavSample','child');\" class=\"contentlink\">View Sample App</a> |");
			bodySb.append("<a href=\"CampChildLeftNavSample.java\" class=\"contentlink\">View Source</a><br><br>");
			bodySb.append("<span class=\"contentbold\">Help Window</span> - demonstrates generation of CISCO.COM Help Window framework<br>");
			bodySb.append("<a href=\"javascript:sitewide_toolkit_window('CampHelpSample','help');\" class=\"contentlink\">View Sample App</a> |");
			bodySb.append("<a href=\"CampHelpSample.java\" class=\"contentlink\">View Source</a><br><br>");
			bodySb.append("<span class=\"contentbold\">Feedback Window</span> - demonstrates generation of CISCO.COM Feedback Window framework<br>");
			bodySb.append("<a href=\"javascript:sitewide_toolkit_window('CampFeedbackSample','feedback');\" class=\"contentlink\">View Sample App</a> |");
			bodySb.append("<a href=\"CampFeedbackSample.java\" class=\"contentlink\">View Source</a><br><br>");
			bodySb.append("<span class=\"contentbold\">Print Window</span> - demonstrates generation of CISCO.COM Print Window framework<br>");
			bodySb.append("<a href=\"javascript:sitewide_toolkit_window('CampPrintSample','print');\" class=\"contentlink\">View Sample App</a> |");
			bodySb.append("<a href=\"CampPrintSample.java\" class=\"contentlink\">View Source</a><br><br>");
			bodySb.append("<span class=\"contentbold\">Content Window</span> - demonstrates generation of CISCO.COM Content Window framework<br>");
			bodySb.append("<a href=\"javascript:openLargePopup('CampContentSample','content');\" class=\"contentlink\"> View Sample App </a> |");
			bodySb.append("<a href=\"CampContentSample.java\" class=\"contentlink\">View Source</a><br><br>");
          	bodySb.append("</td>");
            bodySb.append("</tr>");
            bodySb.append("</table>");


			//creates an instance of PageComposer
			PageComposer myPage = new PageComposer(this.getServletContext().getRealPath("/") +
			                	"/WEB-INF/data/PageComposer.properties",true);

			//setting the apptemplates dir
            myPage.setAppTemplatesDir(appTemplatesDir);

			//setting the entitlement level to zero.This will override the value (guest)
			//of entitlment level set in PageComposer.properties
			myPage.setEntitlementLevel("4");

			//setting the Feedback URL for the SWT
			myPage.setSWTFeedbackURL("CampFeedbackSample");

			//setting the Print URL for the SWT
			myPage.setSWTPrintURL("CampPrintSample");

			//setting the Help URL for the SWT
			myPage.setSWTHelpURL("CampHelpSample");

			//setting the value of Loggedin to override the value set in Pagecomposer.properties
			myPage.setLoggedin(true);

			//setting the page title
			myPage.setPageTitle("Sample Application");

			//Return the HTML for the full page.
			out.print(myPage.renderPage(bodySb.toString()));

		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
}
