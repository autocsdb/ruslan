include "templates\common.tpl"
define function main()
{
 if(sizeof(filename) == 0)
  filename = savedialog("Word ����� (*.doc)|*.doc", "doc")
 doc.newfile()
 var name = newmass(0)
 var name1 = newmass(0)
 var i
 var k
 var k1
 var e
 var l = sizeof(source)
 var currec = newmass(0)
 for(e = 0; e < l; e = e + 1)
 {
  var newname = ""

  if(source[e].exist(461, 0))
  {
   if((source[e].exist(461, 0, 700)) | (source[e].exist(461, 0, 710)))
   {
    if((source[e].count(461, 0, 700) + source[e].count(461, 0, 701)) < 5)
    {
     if(source[e].exist(461,0, 700, 0))
      newname = source[e].value(461, 0, 700, 0, $a" "$b)
     else
     {
      if(source[e].exist(461,0, 710, 0))
       newname = source[e].value(461, 0, 710, 0, $a". "$b)
     }
    }
   }
   else
   {
    if(source[e].exist(461, 0, 200, 0, $a))
     newname = source[e].value(461, 0, 200, 0, $a)
    else
     newname = source[e].value(200, 0, $a)
   }
  }
  else
  {
   if((source[e].exist(700)) | (source[e].exist(710)))
   {
    if((source[e].count(700) + source[e].count(701)) < 5)
    {
     if(source[e].exist(700, 0))
      newname = source[e].value(700, 0, $a" "$b)
     else
     {
      if(source[e].exist(710, 0))
       newname = source[e].value(710, 0, $a". "$b)
     }
    }    
   }
   else
   {
    if(source[e].exist(461, 0, 200, 0, $a))
     newname = source[e].value(461, 0, 200, 0, $a)
    else
     newname = source[e].value(200, 0, $a)
   }
  }
  
  add(name, newname) 	
  if(source[e].exist(461, 0, 200, 0, $a))
   add(name1, source[e].value(461, 0, 200, 0, $a)) 	
  else
   add(name1, source[e].value(200, 0, $a)) 	
 }
 sort(source, name[%row%], name1[%row%])
 l = sizeof(source)
 for(e =0; e < l; e = e + 1)
 {
  status(e/l)	
  var currecnumb = marc(source[e], 1)
  var currec1 = selectfrom(currec, currec[%row%] == currecnumb)
  if(sizeof(currec1) == 0)
  {
   add(currec, currecnumb)
   doc.out("\n", Side1, �������)
   common(source[e])
  }
  doc.out("\n", Side1, �������)
 }
 doc.Save(FileName)
}