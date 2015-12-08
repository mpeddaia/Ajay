package test;


import java.util.Collection;

import com.cisco.mcm.bo.McmUploadBO;
import com.cisco.servicesales.session.MCMUserSession;
import com.cisco.cts.util.oa.OracleApplicationSession;
import org.junit.Test;
import static org.junit.Assert.*;

public class TestLoadTemplate {
	
	@Test
	public void testFunction() throws Exception{
		McmUploadBO mcmuploadBO = new McmUploadBO();
		OracleApplicationSession o =  new OracleApplicationSession();
		MCMUserSession userSession =  new MCMUserSession(o, "sgangur");
		Collection uploadTemplates = mcmuploadBO.getDownloadTemplates(userSession,null,"sgangur","XXCSS_OPS_SUPER_USR");
		
		assertTrue(uploadTemplates.isEmpty());
	}
	
	
	

}
