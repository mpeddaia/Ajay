import com.cisco.appsui.core.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

/*
 * Generates CISCO.COM Embedded framework using Application Migration API.
 * This example shows how to generate a content window.
 */
public class  CampContentSample  extends javax.servlet.http.HttpServlet{
	public void doGet(javax.servlet.http.HttpServletRequest req,
			  javax.servlet.http.HttpServletResponse res)
	throws ServletException, IOException{
		try {
			PrintWriter out = res.getWriter();

			System.setProperty("com.cisco.appsui.rootPath", this.getServletContext().getRealPath("/") +
							"/WEB-INF/templates/");

			String appTemplatesDir="FooTemplates1.0";

			//creates an instance of PageComposer
			PageComposer myPage = new PageComposer(this.getServletContext().getRealPath("/") +
		                	"/WEB-INF/data/PageComposer.properties",true);

			//Determine the Image Path and SpacerImage Name
			String lImagePath = myPage.getProperty("appImagePath");
			String lSpacerImage = myPage.getProperty("appSpacerImg");


			// setting the body string
			StringBuffer bodySb;
			bodySb = new StringBuffer();


			//Add the Content Header to the body
			bodySb.append("<!-- This piece if for the header tab in the contents -->");
			bodySb.append("<!-- Please change the text to what it should say for your Content -->");
			bodySb.append("<table border=\"0\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\">");
			bodySb.append("	<tr bgcolor=\"#FFCC66\">");
			bodySb.append("		<td bgcolor=\"#ffffff\"><img src=\""+lImagePath+"/"+lSpacerImage+"\" width=\"7\" height=\"1\" alt=\"\"></td>");
			bodySb.append("		<td><img src=\""+lImagePath+"/"+lSpacerImage+"\" width=\"6\" height=\"22\" alt=\"\"></td>");
			bodySb.append("		<!--This should be changed to your App Name -->");
			bodySb.append("		<td nowrap=\"\" width=\"100%\"><span class=\"contenttitle\">your appname here:</span>");
			bodySb.append("			<!--This should be changed to your app title-->");
			bodySb.append("			<span class=\"contenttitlesub\">your page title here</span></td>");
			bodySb.append("		<td valign=\"top\" align=\"right\"><img src=\""+lImagePath+"/corner_ur_13.gif\" width=\"13\" height=\"13\" alt=\"\"></td> ");
			bodySb.append("		<td bgcolor=\"#ffffff\"><img src=\""+lImagePath+"/"+lSpacerImage+"\" width=\"7\" height=\"1\" alt=\"\"></td>");
			bodySb.append("	</tr>");
			bodySb.append("	<tr>");
			bodySb.append("		<td colspan=\"5\"><img src=\""+lImagePath+"/"+lSpacerImage+"\" width=\"1\" height=\"1\" alt=\"\"></td>");
			bodySb.append("	</tr>");
			bodySb.append("	<tr>");
			bodySb.append("		<td><img src=\""+lImagePath+"/"+lSpacerImage+"\" width=\"7\" height=\"1\" alt=\"\"></td>");
			bodySb.append("		<td colspan=\"3\" bgcolor=\"#FFCC66\"><img src=\""+lImagePath+"/"+lSpacerImage+"\" width=\"1\" height=\"1\" alt=\"\"></td>");
			bodySb.append("		<td><img src=\""+lImagePath+"/"+lSpacerImage+"\" width=\"7\" height=\"1\" alt=\"\"></td>");
			bodySb.append("	</tr>");
			bodySb.append("	<tr>");
			bodySb.append("		<td colspan=\"5\"><img src=\""+lImagePath+"/"+lSpacerImage+"\" width=\"1\" height=\"10\" alt=\"\"></td>");
			bodySb.append("	</tr>");
			bodySb.append("</table>");

			//Add the actual body
			bodySb.append("<br><P align=center> CONTENT BODY <br>");

			bodySb.append("<BR><BR>");
			bodySb.append("<span class=\"contentbold\"> Hello Cisco Systems </span>");
			bodySb.append("<BR><BR>");
			bodySb.append("<span class=\"content\"> This example shows how to generate a content window </span>");
			bodySb.append("<BR><BR>");


			//setting the window type to help
			myPage.setWindowType("content");

			//setting swt
			myPage.setSWT("CampPrintSample","CampEmailSample",null,null,"CampFeedbackSample","CampHelpSample");
			myPage.activateApplMargin(true);

			out.print(myPage.renderPage(bodySb.toString()));


		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
}
