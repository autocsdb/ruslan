include "templates\com_bul.tpl"
define function main()
{
 doc.NewFile("list.dot")
 if(sizeof(filename) == 0)
  filename = savedialog("Word файлы (*.doc)|*.doc", "doc")
 doc.Save(FileName)
 var objword = doc.oleobject()
 var app = objword.exec(propertyget, application)
 var options = app.propertyget(options)
 var CheckSpellingAsYouType = options.propertyget(CheckSpellingAsYouType)
 var CheckGrammarAsYouType = options.propertyget(CheckGrammarAsYouType)
 options.propertyset(CheckSpellingAsYouType, 0)
 options.propertyset(CheckGrammarAsYouType, 0)

 var splitter[2]
 splitter[0] = ":"
 splitter[1] = "("
 var udk = loadfromfile("UDK_BBK.txt")
 var sourcesize = sizeof(source)
 var sizeudk = sizeof(udk)
 var k
 var i
 var i1
 var j
 var j1
 var Error
 var udkmass = newmass(0)
 var bbkmass = newmass(0)
 var udksource = newmass(0)
 var bbksource = newmass(0)
 var nobbk = newmass(0)
 var errbbk = newmass(0)
 var errudk = newmass(0)
 var errbbkname = newmass(0)
 var errudkname = newmass(0)
 var splitterplace
 var temstring
 var k1
 var curudk
 var Curudkname
 var class
 var curudkmass
 var e
 var minusflg
 var localcurudkname
 for(i = 0; i < sizeof(source); i = i + 1)
 {
  k = marccount(source[i], 999)
  minusflg = 0
  for(i1 = 0; i1 < k; i1 = i1 + 1)
  {
   temstring = marc(source[i], 999, i1, $e)
   if(pos(temstring, "-") == 1)
    minusflg = 1
  }

  if(minusflg != 1)
  {
   k = marccount(source[i], 686)
   for(i1 = 0; i1 < k; i1 = i1 + 1)
   {
    temstring = marc(source[i], 686, i1, $a)
    splitterplace = pos(temstring, splitter)
    if(splitterplace > 0)
    {
     splitterplace = splitterplace - 1
     add(bbkmass, substring(temstring, symbol, 1, splitterplace))
     add(errbbkname, substring(temstring, symbol, 1, splitterplace))
    }
    else
    {
     add(bbkmass, temstring)
     add(errbbkname, temstring)
    }
    add(bbksource, source[i])
    add(errbbk, source[i])
   }
   k1 = marccount(source[i], 675)
   for(i1 = 0; i1 < k1; i1 = i1 + 1)
   {
    temstring = marc(source[i], 675, i1, $a)
    splitterplace = pos(temstring, splitter)
    if(splitterplace > 0)
    {
     splitterplace = splitterplace - 1
     add(udkmass, substring(temstring, symbol, 1, splitterplace))
     add(errudkname, substring(temstring, symbol, 1, splitterplace))
    }
    else
    {
     add(udkmass, temstring)
     add(errudkname, temstring)
    }
    add(udksource, source[i])
    add(errudk, source[i])
   }
   if((k < 1) & (k1 < 1))
    add(nobbk, source[i])
  }
 }
 var currec
 var savestatus = 0
 for(curudk = 0; curudk < sizeudk; curudk = curudk + 1)
 {
  status(curudk/sizeudk)
 
  Curudkname = substring(udk[curudk], word, 2, -1)
  curudkmass = newmass(0)
  class = substring(udk[curudk], word, 1, 1)
  if(class == "rubbk")
  {
   i = pos(Curudkname, ",")
   if(i == 0)
   {
    i = pos(Curudkname, " ")
    var startsmb = substring(Curudkname, symbol, 1, i - 1)
    curudkmass = selectfrom(bbksource, startwith(bbkmass[%Row%], startsmb))
    errbbk = selectfrom(errbbk, !startwith(errbbkname[%Row%], startsmb))
    errbbkname = selectfrom(errbbkname, !startwith(errbbkname[%Row%], startsmb))
   }
   else
   {
    for(;i > 0;)
    {
     localcurudkname = substring(curudkname, symbol, 1, i - 1)
     var temp = selectfrom(bbksource, startwith(bbkmass[%Row%], localcurudkname))
     combine(curudkmass, temp)
     errbbk = selectfrom(errbbk, !startwith(errbbkname[%Row%], localcurudkname))
     errbbkname = selectfrom(errbbkname, !startwith(errbbkname[%Row%], localcurudkname))
     curudkname = substring(curudkname, symbol, i + 1, -1)
     i = pos(Curudkname, ",")
    }
    var temp = selectfrom(bbksource, startwith(bbkmass[%Row%], curudkname))
    combine(curudkmass, temp)
    errbbk = selectfrom(errbbk, !startwith(errbbkname[%Row%], curudkname))
    errbbkname = selectfrom(errbbkname, !startwith(errbbkname[%Row%], curudkname))
   }
  } 
  if(class == "udk")
  {
   i = pos(Curudkname, ",")
   if(i == 0)
   {
    k = pos(curudkname, "*")
    if(k > 0)
    {
     k = k - 1
     curudkname = substring(curudkname, symbol, 1, k)
     curudkmass = selectfrom(udksource, startwith(udkmass[%Row%], Curudkname))
     errudk = selectfrom(errudk, !startwith(errudkname[%Row%], Curudkname))
     errudkname = selectfrom(errudkname, !startwith(errudkname[%Row%], Curudkname))
    }
    else
    {
     curudkmass = selectfrom(udksource, udkmass[%Row%] == Curudkname)
     errudk = selectfrom(errudk, errudkname[%Row%] != Curudkname)
     errudkname = selectfrom(errudkname, errudkname[%Row%] != Curudkname)
    }
   }
   else
   {
    for(;i > 0;)
    {
     localcurudkname = substring(curudkname, symbol, 1, i - 1)
     k = pos(localcurudkname, "*")
     if(k > 0)
     {
      k = k - 1
      localcurudkname = substring(localcurudkname, symbol, 1, k)
      var temp = selectfrom(udksource, startwith(udkmass[%Row%], localCurudkname))
      combine(curudkmass, temp)
      errudk = selectfrom(errudk, !startwith(errudkname[%Row%], localCurudkname))
      errudkname = selectfrom(errudkname, !startwith(errudkname[%Row%], localCurudkname))
     }
     else
     {
      var temp = selectfrom(udksource, udkmass[%Row%] == localCurudkname)
      combine(curudkmass, temp)
      errudk = selectfrom(errudk, errudkname[%Row%] != localCurudkname)
      errudkname = selectfrom(errudkname, errudkname[%Row%] != localCurudkname)
     }
     curudkname = substring(curudkname, symbol, i + 1, -1)
     i = pos(Curudkname, ",")
    }
 
    k = pos(curudkname, "*")
    if(k > 0)
    {
     k = k - 1
     curudkname = substring(curudkname, symbol, 1, k)
     var temp = selectfrom(udksource, startwith(udkmass[%Row%], Curudkname))
     combine(curudkmass, temp)
     errudk = selectfrom(errudk, !startwith(errudkname[%Row%], Curudkname))
     errudkname = selectfrom(errudkname, !startwith(errudkname[%Row%], Curudkname))
    }
    else
    {
     var temp = selectfrom(udksource, udkmass[%Row%] == Curudkname)
     combine(curudkmass, temp)
     errudk = selectfrom(errudk, errudkname[%Row%] != Curudkname)
     errudkname = selectfrom(errudkname, errudkname[%Row%] != Curudkname)
    }
   }
  } 
  if(sizeof(curudkmass) != 0)
  {
   doc.out("\n\n", Side1, Обычный)
   var name = trim(substring(udk[curudk], word, 2, -1))
   var splpos= pos(name, " ")
   doc.out("\n" + substring(name, symbol, splpos, -1), side1, "Заголовок 1")
   var name1
   name = newmass(0)
   name1 = newmass(0)
   for(var t =0; t < sizeof(curudkmass); t = t + 1)
   {
    var newname = ""

    if(curudkmass[t].exist(461, 0))
    {
     if((curudkmass[t].exist(461, 0, 700)) | (curudkmass[t].exist(461, 0, 710)))
    {
      if((curudkmass[t].count(461, 0, 700) + curudkmass[t].count(461, 0, 701)) < 5)
      {
       if(curudkmass[t].exist(461,0, 700, 0))
        newname = curudkmass[t].value(461, 0, 700, 0, $a" "$b)
       else
       {
        if(curudkmass[t].exist(461,0, 710, 0))
         newname = curudkmass[t].value(461, 0, 710, 0, $a". "$b)
       }
      }
     }
     else
     {
      if(curudkmass[t].exist(461, 0, 200, 0, $a))
       newname = curudkmass[t].value(461, 0, 200, 0, $a)
      else
       newname = curudkmass[t].value(200, 0, $a)
     }
    }
    else
    {
     if((curudkmass[t].exist(700)) | (curudkmass[t].exist(710)))
     {
       if((curudkmass[t].count(700) + curudkmass[t].count(701)) < 5)
       {
       if(curudkmass[t].exist(700, 0))
        newname = curudkmass[t].value(700, 0, $a" "$b)
       else
       {
        if(curudkmass[t].exist(710, 0))
         newname = curudkmass[t].value(710, 0, $a". "$b)
       }
      }    
     }
     else
     {
      if(curudkmass[t].exist(461, 0, 200, 0, $a))
       newname = curudkmass[t].value(461, 0, 200, 0, $a)
      else
       newname = curudkmass[t].value(200, 0, $a)
      }
    }
    add(name, newname) 	
    if(curudkmass[t].exist(461, 0, 200, 0, $a))
     add(name1, curudkmass[t].value(461, 0, 200, 0, $a)) 	
    else
     add(name1, curudkmass[t].value(200, 0, $a)) 	
   }
   sort(curudkmass, name[%row%], name1[%row%])
   currec = newmass(0)
   for(e =0; e < sizeof(curudkmass); e = e + 1)
   {
    savestatus = savestatus + 1
    if(savestatus > 10)
    {
     doc.Save()
     savestatus = 0
    }
    var currecnumb = marc(curudkmass[e], 1)
    var currec1 = selectfrom(currec, currec[%row%] == currecnumb)
    if(sizeof(currec1) == 0)
    {
     add(currec, currecnumb)
     common(curudkmass[e])
     k = MARCCOUNT(curudkmass[e], 999)
     if(k > 0)
     {
      var siglmas = newmass(0)
      var numbmas = newmass(0)
      for(i = 0; i < k; i = i + 1)
      {
       if(Pos(MARC(curudkmass[e], 999,i, $e), "-") != 1)
       {		
        add(siglmas, MARC(curudkmass[e], 999,i,$b))
        add(numbmas, MARC(curudkmass[e], 999,i,$p))
       }
      }
      for(;sizeof(siglmas) > 0;)
      {
       var currentsigle = siglmas[0]
       var curnumbmass = selectfrom(numbmas, siglmas[%ROW%] == currentsigle)
       numbmas = selectfrom(numbmas, siglmas[%ROW%] != currentsigle)
       siglmas = selectfrom(siglmas, siglmas[%ROW%] != currentsigle)
       k1 = sizeof(curnumbmass) - 1
       if(k1 > -1)
       {
        doc.out("\n" + currentsigle + ": ", side1, Примечание)
        for(;sizeof(curnumbmass) > 0;)
        {
         var curnumbsingle = curnumbmass[0]
         curnumbmass = selectfrom(curnumbmass, curnumbmass[%ROW%] != curnumbsingle)
         if(sizeof(curnumbmass) > 0)
          doc.out(curnumbsingle + ", ", side1, Примечание)
         else
         doc.out(curnumbsingle, side1, Примечание)
	}
       }     
      }
     }
' doc.out("\n", Side1, Обычный)
    }
   }
  }
 }
 if(sizeof(nobbk) > 0)
 {
  doc.out("\nБез УДК и ББК\n", side1, "Заголовок 1")
  for(i = 0; i < sizeof(nobbk); i = i + 1)
  {
   doc.out("\nНомер " + marc(nobbk[i], 999, 0, $p), side1, Обычный)
   
' ---------------------------- вставка ---------------------------------
' k1 = sizeof(curnumbmass) - 1
'       if(k1 > -1)
'       {
'        doc.out("\n" + currentsigle + ": ", side1, Примечание)
'        for(;sizeof(curnumbmass) > 0;)
'        {
'         var curnumbsingle = curnumbmass[0]
'         curnumbmass = selectfrom(curnumbmass, curnumbmass[%ROW%] != curnumbsingle)
'         if(sizeof(curnumbmass) > 0)
'          doc.out(curnumbsingle + ", ", side1, Примечание)
'         else
'         doc.out(curnumbsingle, side1, Примечание)
'        }
'       }  
' ---------------------------- вставка ---------------------------------

   doc.out("\n" + marc(nobbk[i], 200, 0, $f), side1, Обычный)
   doc.out("\n" + marc(nobbk[i], 200, 0, $a) + "\n", side1, Обычный)
  }
 }
 if(sizeof(errbbk) > 0)
 {
  doc.out("\nНеизвестный ББК\n", side1, "Заголовок 1")
  for(i = 0; i < sizeof(errbbk); i = i + 1)
  {
   doc.out("\nББК: " + errbbkname[i], side1, Обычный)
   doc.out("\nНомер " + marc(errbbk[i], 999, 0, $p), side1, Обычный)
   doc.out("\n" + marc(errbbk[i], 200, 0, $f), side1, Обычный)
   doc.out("\n" + marc(errbbk[i], 200, 0, $a) + "\n", side1, Обычный)

  }
 }
 if(sizeof(errudk) > 0)
 {
  doc.out("\nНеизвестный УДК\n", side1, "Заголовок 1")
  for(i = 0; i < sizeof(errudk); i = i + 1)
  {
   doc.out("\nУДК: " + errudkname[i], side1, Обычный)
   doc.out("\nНомер " + marc(errudk[i], 999, 0, $p), side1, Обычный)
   doc.out("\n" + marc(errudk[i], 200, 0, $f), side1, Обычный)
   doc.out("\n" + marc(errudk[i], 200, 0, $a) + "\n", side1, Обычный)
   doc.out("\n", side1, Обычный)
  }
 }

 options.propertyset(CheckSpellingAsYouType, CheckSpellingAsYouType)
 options.propertyset(CheckGrammarAsYouType, CheckSpellingAsYouType)

 doc.Save()
 app.exec(procedure, run, "final")
}