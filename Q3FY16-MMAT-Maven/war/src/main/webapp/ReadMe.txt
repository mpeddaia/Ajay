This war file gives examples of CAMP API. 
1.To deploy this just put the devpack.war in the Tomcat/webapps directory and 
  add the following to your server.xml and restart Tomcat for the CSS, images, and javascript to work.

        <Context path="/apps-ui/generic"
			docBase="devPack/resources"
	                 crossContext="true"
	                 debug="0"
	                 reloadable="true" />

        <Context path="/swa"
			docBase="devPack/resources"
	                 crossContext="true"
	                 debug="0"
	                 reloadable="true" />

2.Modify the data/PageComposer.properties to map to set RootPath and path to 
AppNavProperties file.

ROOTPATH=<TOMCAT HOME>/webapps/devPack/WEB-INF/templates/
APPNAV.CONFIG.FILE=<TOMCAT HOME>/webapps/devPack/WEB-INF/data/AppNav.properties

replace <TOMCAT HOME> with the path where u have installed tomcat in your machine

3.Restart tomcat server and browse the sample servlets by using the following url:
http://localhost:8080/devPack/Samples/servlets/RootPage

4. To view the sample jsps using taglib use the following url:
http://localhost:8080/devPack/Samples/jsps/camp_root_page.jsp

*********************************************************************************************************
                 
The resource included are:

sample JSPs
 - devPack/Samples/jsps/camp_root_page.jsp

sample Servlets
 - devPack/Samples/servlets/RootPage

Camp API
 - devPack/WEB-INF/lib/CampCore.jar

CAMP JSP Custom tag library descriptor
 - devPack/WEB-INF/camp.tld

CAMP API Java Docs
 - devPack/docs/PageComposer.html

Compiled Class files for servlets
 - devPack/WEB-INF/classes

CAMP images, javascript, and css files
 - devPack/resources/*

properties files for PageComposer and navigation
 - devPack/WEB-INF/data/*

CAMP Templates
 - devPack/WEB-INF/templates/*