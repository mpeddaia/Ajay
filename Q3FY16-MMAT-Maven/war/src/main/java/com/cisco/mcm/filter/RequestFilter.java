package com.cisco.mcm.filter;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;

import com.cisco.mcm.action.McmIndexAction;

public class RequestFilter implements Filter
{
  public FilterConfig filterConfig;
  private static Logger logger = Logger.getLogger(RequestFilter.class);


  public void init(FilterConfig f){
	  logger.info("testfilter:");
	  
	  this.filterConfig = f;
  
  }
  public void destroy(){
	  
	  
  }

  public void doFilter (ServletRequest request,
              ServletResponse response,
              FilterChain chain) throws java.io.IOException, javax.servlet.ServletException 
  {

	try
    {
		  boolean flag = checkInvalidChars((HttpServletRequest)request);
		  if(!flag)
		  {
			  flag=checkCookies((HttpServletRequest)request);
			  logger.info("check cookie flag = "+flag);
		  }
		  
		  logger.info("Invalid Character flag = "+flag);
		  
		  if(!flag){	  		
			  chain.doFilter(request, response);
		  }
		  else{
			  response.setContentType("text/html");
		      PrintWriter out = response.getWriter();
		      out.println("<html><head></head><body>");
		      out.println("<h2>Characters such as [ ; \' <  > '\" { } | < > \" ; `~ : ? @] are not allowed </h2>");
		      out.println("</body></html>");
		      out.close();
		  }  // check to see if elements are empty
    }     

    catch (IOException io)
    {
      System.err.println("IOException raised");
    }
    catch (ServletException se)
    {
      System.err.println("ServletException raised");
    }
  }
  
  public boolean checkInvalidChars(HttpServletRequest request){
	  boolean flag = false;
	  Enumeration initParams = request.getParameterNames();
	  String nullCheck="";
	 
	  logger.info("calling checkInvalidChars ");
	  while (initParams.hasMoreElements()) {
			String paramName = initParams.nextElement().toString();
			try{
				String value = request.getParameter(paramName);
				logger.info("Name = "+value);
				nullCheck = value;
				int isNull = nullCheck.indexOf('\0',0);
				  logger.info("null character  "+isNull);
					if(isNull != -1)
					{
						flag=true;
						logger.info("null character flag is true");
						}
				if(value != null && value.matches(".*[;\'<>'\"{}|<>'\";`~:?].*")){
					logger.info("Invalid character found in:"+paramName+":"+value);
					flag = true;
				}
			}catch(Exception e){
				String value[] = request.getParameterValues(paramName);
				if(value != null){
					for(int i=0;i<value.length;i++){
						if(flag){
							break;
						}
						if(value[i] != null)
						{
							logger.info("reqName in catch  = "+value[i]);
						}
						else
						{
							logger.info("reqName in catch is null ");
						}
						
						if(value[i] != null && value[i].matches(".*[;\'<>'\"{}|<>'\";`~:?].*")){
							logger.info("Invalid character found in:"+paramName+":"+value[i]);
							flag = true;
						}
					}
				}
				
			}
	  }
	  
	  
	 return flag;
  }

  
  public boolean checkCookies(HttpServletRequest request){
	  boolean flag = false;
	  logger.info("called check Cookies"); 
	  Cookie []cookies = request.getCookies();
	  for(int i=0;i<cookies.length;i++)
	  {
		  String cName = cookies[i].getName();
		  String cValue = cookies[i].getValue();
		  if(cValue != null && cValue.matches(".*[;\'<>'\"{}|<>'\";`~?].*")){
				logger.info("Invalid character found in cookie : "+cName+" value = "+cValue);
				flag = true;
			}
	  }
	  
	  return flag;
  }
  public FilterConfig getFilterConfig()
  {
    return this.filterConfig;
  }

  public void setFilterConfig (FilterConfig filterConfig)
  {
    this.filterConfig = filterConfig;
  }
}
 