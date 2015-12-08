//for header popover attributes change flag
var reminderAgreementMouseOverCtrl=false;
var reminderMouseOver=false;
var justRenderedReminder=false;

function hideReminderAgreementFlyOver(id) {
	if (!reminderMouseOver && !justRenderedReminder) {
		$(id).hide();
		$('#mask').hide();
	}
	reminderAgreementMouseOverCtrl = false;
}

function showReminderAgreementFlyOverAfter(id, imgCtrl){
	var ctrl=imgCtrl;
	var id1=id;
	var _this=this;
	reminderAgreementMouseOverCtrl = true;
	window.setTimeout( function() {
					_this.showReminderAgreementFlyOver(id1, ctrl);
					 },2000);	
}

function mouseOverReminder () {
	reminderMouseOver = true;
	justRenderedReminder = true;
}

function leaveReminder () {
	reminderMouseOver = false;
	justRenderedReminder = false;
}

function showReminderAgreementFlyOver(id, imgCtrl){

	if (reminderAgreementMouseOverCtrl) {
			var id1=id;
		
			//Code for positioning the warning flyover
			var positionLeft = $(imgCtrl).position().left;
			var positionTop = $(imgCtrl).position().top;
			
		 	//alert("height: " + $(id).height());
		
		  	//Get the screen height and width
		  	var maskHeight = $(window).height();
		  	var maskWidth = $(window).width();
		 
			//Set heigth and width to mask to fill up the whole screen
			$('#mask').css({'width':maskWidth,'height':maskHeight});
			
			//transition effect 
		//	$('#mask').fadeIn(0);
			$('#mask').fadeTo("fast",0);
			
			//Get the window height and width
			var winH = $(window).height();
			var winW = $(window).width();
		
			positionLeft -= ( $(id).width() - $(imgCtrl).width() ) / 2;
			if (positionLeft < 0) positionLeft = 0;  // floor it if position < 0
			
			//positionTop += $(imgCtrl).height() - 2;
			//Set the popup window to center
			//$(id).css('top',  (winH - 50)-$(id).height()/2);
			//$(id).css('left', winW/6-$(id).width()/2);
			$(id).css('top', positionTop);
			$(id).css('left', positionLeft);
			 // $(id).css('top',  winH/2-$(id).height()/2);
			  //$(id).css('left', winW/2-$(id).width()/2);
			//hideDropdowns();
			//transition effect
					
			$(id).fadeIn(100);
			justRenderedReminder=true;
			
			$('#mask').hover 
			(
					function () {
						$(id).hide ();
						$('#mask').hide ();
					}		
			);
	}
				
}//end function

