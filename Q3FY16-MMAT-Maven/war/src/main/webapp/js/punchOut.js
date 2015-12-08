/*### This Java Script was added as part of B2BPunchout during Q3FY13 release ###*/

	
//Begin Q3FY13 - 2TNG Changes - B2B Punchout: Exit Session - nshakya
function exitSession(){

	//clear the cookies
	
	var expDate = new Date();
	expDate.setTime(expDate.getTime() - 1);
    var cookies = document.cookie.split(";")
    for (var i = 0;i < cookies.length;i++)
   	 {
    	//clear the cookies
    	document.cookie = cookies[i] + "; expires ="+ expDate.toGMTString();

     }

	
	//code to close window.
	window.open('','_self','');
	window.close();
 }// End exit Session()

//End Q3FY13 - 2TNG Changes - B2B Punchout: Exit Session - nshakya


/*Use below function for showing MASK,Effects and Align popover to center*/
/*Added by jibjohn as part of B2BPunchout during Q3FY13 release*/
function showPopoverByMasking(divID){
	
	var id=divID;
	
	var maskHeight = $(document).height();
	var maskWidth = $(window).width();
	 
	//Set heigth and width to mask to fill up the whole screen
	$('#mask').css({'width':maskWidth,'height':maskHeight});
	  
	//transition effect  
	$('#mask').fadeIn(1000); 
	$('#mask').fadeTo("slow",0.8); 
	 
	//Get the window height and width
	var winH = $(window).height();
	var winW = $(window).width();
	              
	//Set the popup window to center
	$(id).css('top',  winH/2-$(id).height()/2);
	$(id).css('left', winW/2-$(id).width()/2);
	 
	//transition effect
	$(id).fadeIn(2000);
	window.scrollTo('top','left' );
}