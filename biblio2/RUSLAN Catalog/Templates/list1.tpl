include "templates\common.tpl"
define function main()
{
if(sizeof(filename) == 0)
 filename = savedialog("Word файлы (*.doc)|*.doc", "doc")
doc.NewFile()
doc.Save(FileName)
var name = newmass(0)
var name1 = newmass(0)
var i
var i1
var k
var k1
var e
var masssource = newmass(0)
var l = sizeof(source)
for(e = 0; e < l; e = e + 1)
{
  k = marccount(source[e], 999)
  for(i = 0; i < k; i= i + 1)
  {	
   if((marc(source[e], 999, i, $b) == "ОУЛ") & (startwith(marc(source[e], 999, i, $e), "-11")))
   {
     add(masssource, source[e])
     break		
   }	
  }
}

l = sizeof(masssource)
var currec = newmass(0)

for(e = 0; e < l; e = e + 1)
{
 add(name, "")	
 if(marcexist(masssource[e], 461, 0))
 {
   if((masssource[e].count(461, 0, 710) + masssource[e].count(461, 0, 700) + masssource[e].count(461, 0, 701)) < 5)
   {
    if(marcexist(masssource[e], 461,0, 700, 0))
     name[e] = name[e] + MARC(masssource[e], 461, 0, 700, 0, $a" "$b)
    else
     name[e] = name[e] + MARC(masssource[e], 461, 0, 710, 0, $a)
   }
 }
 else
 {
  if((masssource[e].count(710) + masssource[e].count(700) + masssource[e].count(701)) < 5)
  {
   if(marcexist(masssource[e], 700, 0))
    name[e] = name[e] + MARC(masssource[e], 700, 0, $a" "$b)
   else
    name[e] = name[e] + MARC(masssource[e], 710, 0, $a)
  }
 }
 if(masssource[e].exist(200, 0, $a))
  add(name1, MARC(masssource[e], 200, 0, $a))
 else
  add(name1, MARC(461, 0, masssource[e], 200, 0, $a))
}
sort(masssource, name[%row%], name1[%row%])
l = sizeof(masssource)
for(e =0; e < l; e = e + 1)
{
 status(e/l)	
 var currecnumb = marc(masssource[e], 1)
 var currec1 = selectfrom(currec, currec[%row%] == currecnumb)
 if(sizeof(currec1) == 0)
 {
  add(currec, currecnumb)
  doc.out("\n", Side1, Автор)
  common(masssource[e])

  doc.out("\nОУЛ: ", Side1, Обычный)
  k = MARCCOUNT(masssource[e], 999)
  for(i1 = 0; i1 < k; i1 = i1 + 1)
  {
   if(marc(masssource[e], 999, i1, $b) == "ОУЛ")
   {
    if((startwith(marc(masssource[e], 999, i1, $p), "Б/У")) & (startwith(marc(source[e], 999, i, $e), "-11")))
    {
     doc.out(marc(masssource[e], 999, i1, $p"   "$v"    "), Side1, Обычный)
    }
   }  	   
  }
  for(i1 = 0; i1 < k; i1 = i1 + 1)
  {
   if(marc(masssource[e], 999, i1, $b) == "ОУЛ")
   {
    if((!(startwith(marc(masssource[e], 999, i1, $p), "Б/У"))) & (startwith(marc(source[e], 999, i, $e), "-11")))
    {
     doc.out(marc(masssource[e], 999, i1, $p"   "$v"    "), Side1,  Обычный)
    }
   }  	   
  }
 }
 doc.out("\nОНЛ: ", Side1, Обычный)
 doc.out("\nОЧЗ: ", Side1, Обычный)
}

doc.out("\nВсего наименований:" + ToStr(l), Side1, Обычный)
}