function addVal(obj, v)
{
   if(!containsVal(obj, v))
   {
      var addObj = [v];
      obj = obj.concat(addObj);
   }
   return obj;
}


function deleteVal(obj, v)
{
   if(containsVal(obj, v))
   {
      for(var b=0;b<obj.length;b++)
      {
         if(obj[b]==v)
         {
            obj.splice(b,1);
            return obj;
         }
      }
   }

}

function printVal(obj)
{
   var outStr = '';
   for(var c=0; c<obj.length; c++)
   {
      outStr += obj[c]+'\n';
   }
   alert('Number of elements : '+obj.length+'\n'+outStr);
}

function modifyContent(obj, v)
{
   if(containsVal(obj, v))
   {
      obj = deleteVal(obj, v);
   }
   else
   {
      obj = addVal(obj, v);
   }
   return obj;
}

function modifyRadioContent(obj, v)
{

      obj = addVal(obj, v);
 	  return obj;
}

function containsVal(obj, v)
{
   for(var b=0;b<obj.length;b++)
   {
      if(obj[b]==v)
         return true;
   }
   return false;
}


