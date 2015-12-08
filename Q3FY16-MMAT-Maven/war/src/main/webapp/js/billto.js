function showChild()
{  
   childwindow = window.open("billtoselect.do?methodName=onshowPopup&context=GENERIC","childWin","width=992,height=550,scrollbars");
   childwindow.creator=self;
//   alert(objs);
   return false;
}

function xtrack_billtoselector(JSONObj)
{
alert('back to aprent');
//var myObject = eval('(' + JSONObj + ')'); 

alert('Parent Page');
alert(JSONObj);
}



