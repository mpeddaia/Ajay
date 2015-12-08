/**
 * xmlDataLoader object will load the xml from the given URL 
 * and after parsing it set all the item node value to a Array 
 * it throw an event name onLoadFinish with that result Array as param 
 * 
 * @param   u  URL to be called for loading XML
 * @param   k  String value which user has typed in the Input box
 * @param   t  timeout value for the request
 * @param   m  maximum number of results to be displayed at one time
 * 
 * "onLoadFinish" Trigger this event with result Array after loading and
 * parsing the XML file. 
 * 
 * "onError" Trigger this even if xml file is not loaded successfuly
 * 
 */
xmlDataLoader = function (u, k, t, m)
{
	//	Constructing the final URL with all the parameter
	var url = u + 'token=' + k + '&max=' + m + '&timeout=' + t
	
	this.requester
	this.url = url
	var se = this
	this.loadData = function ()
	{
		/* Check for running connections */
		try
		{
			se.requester = new XMLHttpRequest (); 
		}
		catch (error)
		{
			try
			{
				se.requester = new ActiveXObject ("Microsoft.XMLHTTP");
			}
			catch (error)
			{
				se.requester = null;
				return false;
			}
		}
		// setting method for readyStateChange
		se.requester.onreadystatechange = se.onreadystateCheck;
		se.requester.open ("GET", se.url);
		se.requester.send (null);
		
		return true;
	}
	
	this.onreadystateCheck = function ()
	{
		/* If XMLHR object has finished retrieving the data */
		if (se.requester.readyState == 4)
		{
			/* If the data was retrieved successfully */
			if (se.requester.status == 200)
			{
				se.writeResult ();
			}
			/* IE returns a status code of 0 on some occasions, so ignore this case */
			else if (se.requester.status != 0)
			{
				se.callEvent("onError");
			}
		}
		return true;
	}
	
	
	/* once the xml data is loaded writeResult will parse the item values 
	 * and set them in result Array 
	 */
	this.writeResult = function ()
	{
		if (se.requester.responseText.charAt (0) == "<")
		{
			var x1 = se.requester.responseXML.getElementsByTagName ("item");
			var rArr = new Array ()
			if (x1.length > m)
			{
				var c = m
			} else
			{
				var c = x1.length;
			}
			for (var i = 0; i < c; i ++)
			{
				rArr.push (x1 [i].firstChild.nodeValue);
			}
			se.callEvent ("onLoadFinish", rArr); 
		} else
		{
			se.callEvent ("onError");
		}
	}
	
	this.callEvent = function (e)
	{
		this [e] && this [e].apply (this, [].slice.call (arguments, 1 ));
	};
	
	this.loadData ();
}
