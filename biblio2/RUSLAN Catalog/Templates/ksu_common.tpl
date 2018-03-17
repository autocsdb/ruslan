define function isnumber(value)
{
 return isdigit(value)
}

define function loadfile()
{
 var plainpath = %APPDIR% + "\docs\ksutemplates\ksu_plain.xls"
 var talkpath = %APPDIR% + "\docs\ksutemplates\ksu_talk.xls"
 var rdfpath = %APPDIR% + "\docs\ksutemplates\ksu_rdf.xls"
 var cdpath = %APPDIR% + "\docs\ksutemplates\ksu_cdrom.xls"
 var rgppath = %APPDIR% + "\docs\ksutemplates\ksu_rgp.xls"

 var bases = loadfromfile("ksu.ini", "Bases")
 var type = ""
 for(var i = 0; ; i = i + 1)
 {
  if(!sizeof(baselist))
   break;
  
  var cpos = pos(baselist, ",")
  var curval
  if(cpos >= 0)
  {
   curval = substring(baselist, symbol, 1, cpos - 1)
   baselist = trim(substring(baselist, symbol, cpos + 1, -1))
  }
  else
  {
   curval = baselist
   baselist = ""
  }
  
  var res = selectfrom(bases, startwith(bases[%row%], curval + "="))
  var curtype
  
  if(!sizeof(res))
   continue
  else
  {
   curtype = res[0]
   var s = pos(curtype, "=")
   if(s >= 0)
    curtype = substring(curtype, symbol, s + 1, -1)
   else
    curtype = ''
'   substring(res[0], word, 2, -1)
  }
   
  if(sizeof(type) == 0)
   type = curtype
  else
  {
   if(sizeof(curtype))
   {
    if(type != curtype)
    {
     if(messagebox("Указанный набор баз данных соответствует различным типам КСУ. Продолжить формирование?", "Формирование КСУ", 4) == 7)
     {
      return ""
     }
    }
   }
  }
 }
 if(!sizeof(type))
 {
  messagebox("Указанный набор баз данных не соответствует ни одному из известных типов КСУ.", "Ошибка", 0)
  return ""
 }
 
 var FullName = doc.getfilename()
 var needopen = 1
 if(!doc.isempty())
 {
  var NeedPath = ""
   
  if(type == "PLAIN")
    NeedPath = plainpath
  if(type == "TALK")
    NeedPath = talkpath
  if(type == "RDF")
    NeedPath = rdfpath
  if(type == "CDROM")
   NeedPath = cdpath
  if(type == "RGP")
    NeedPath = rgppath
    
  if(compareci(tostr(Fullname), needpath) == 0)
   needopen = 0
 }
 
 if(needopen)
 {
  if(!doc.isempty())
  {
   var s = messagebox("Будет открыта другая книга. Сохранить изменения в отрытой КСУ?", "Формирование инвентарной книги", 4131)
   if(s == 3)
    return ""
   if(s == 6)
   {
    if(sizeof(trim(Fullname)) <= 0)
    {
     fullname = savedialog("Word файлы (*.doc)|*.doc", "doc")
     if(sizeof(trim(Fullname)) <= 0)
      return ""
    }
    doc.save(tostr(Fullname))
   }
  }
  
  if(type == "PLAIN")
   doc.open(plainpath)
  if(type == "TALK")
   doc.open(talkpath)
  if(type == "RDF")
   doc.open(rdfpath)
  if(type == "CDROM")
   doc.open(cdpath)
  if(type == "RGP")
   doc.open(rgppath)
 }
 return type
}


define function run_test(grsmass, ksudesc)
{
 var baseCell = doc.getlast() + 1
 var startcell = baseCell
 var curaddress = ""
 var lastcellindex = 0
 for(var i = 0; i < sizeof(ksudesc); i = i + 1)
 {
  var kds = sizeof(ksudesc[i])
  if(kds > lastcellindex)
   lastcellindex = kds

  for(var j = kds - 1; j >= 0; j = j - 1)
  {
   if(sizeof(ksudesc[i][j]) > 0)
   {
    if(j >= 26)
     curaddress = "a" + char(j + 97 - 26)
    else
     curaddress = char(j + 97)
     
    var outvalue = ""     
    var curteg = ksudesc[i][j]
    for(;sizeof(curteg)>0;)
    {
     outvalue = outvalue + substring(curteg, word, 1, 1) + ";"
     curteg = substring(curteg, word, 2, -1)
    }
    doc.out(tostr(outvalue), curaddress + tostr(basecell))
   }
  }
  basecell = basecell + 1
 }

 if(basecell > startcell) 
 {
  if(lastcellindex >= 26)
   curaddress = "a" + char(lastcellindex + 96 - 26)
  else
   curaddress = char(lastcellindex + 96)
  doc.drawborder("a" + tostr(startcell) + ":"+ curaddress + tostr(basecell - 1), 1, 2, 63)
 }
}

define function run_forming(grsmass, ksudesc)
{
 var wk = doc.oleobject()
 wk = wk.exec(propertyget, activesheet)

 var baseCell = doc.getlast() + 1
 var startcell = baseCell
 var curaddress = ""
 var lastcellindex = 0
 var errorrow
 
 for(var index = 0; index < sizeof(grsmass); index = index + 1)
 {
  if(sizeof(grs(grsmass[index], 22, "")) <= 0)
   continue

  if(sizeof(grs(grsmass[index], 1000, "")) > 0)
  {
   errorrow = basecell
   basecell = basecell + 1
  }else
   errorrow = -1

  for(var i = 0; i < sizeof(ksudesc); i = i + 1)
  {
   var kds = sizeof(ksudesc[i])
   if(kds > lastcellindex)
    lastcellindex = kds
   
   for(var j = kds - 1; j >= 0; j = j - 1)
   {
    if(sizeof(ksudesc[i][j]) > 0)
    {
     if(j >= 26)
      curaddress = "a" + char(j + 97 - 26)
     else
      curaddress = char(j + 97)
      
     var outvalue = ""
     var curteg = ksudesc[i][j]
     for(;sizeof(curteg)>0;)
     {
      var curvalue = substring(curteg, word, 1, 1)
      if(sizeof(curvalue) > 0)
      {
       if(curvalue[0] == "f")
       {
        if(curvalue == "f_date")
         curvalue = %date%
        else
        {
         if(curvalue == "f_datein")
          curvalue = f_datein(grsmass[index])
         else
         {
          if(curvalue == "f_dateout")
           curvalue = f_dateout(grsmass[index])
          else
          {
           if(curvalue == "f_getcasettes")
            curvalue = f_getcasettes(grsmass[index])
           else
           {
            if(curvalue == "f_getrolls")
             curvalue = f_getrolls(grsmass[index])
            else
            {
             if(curvalue == "f_ветхость")
              curvalue = f_ветхость(grsmass[index])
             else
             {
              if(curvalue == "f_устарелость")
               curvalue = f_устарелость(grsmass[index])
              else
              {
               if(curvalue == "f_утрата")
                curvalue = f_утрата(grsmass[index])
               else
               {
                if(curvalue == "f_другие_причины")
                 curvalue = f_другие_причины(grsmass[index])
               }
              }
             }
            }
           }
          }
         }
        }
       }else
       {
        if(isnumber(curvalue))
         curvalue = grs(grsmass[index], tonumber(curvalue))
       }
       
       if((isnumber(curvalue)) & (isnumber(outvalue)))
        outvalue = tonumber(outvalue) + tonumber(curvalue)
       else
       {
        if((sizeof(outvalue) <= 0) & (isnumber(curvalue)))
         outvalue = tostr(curvalue)
        else
         outvalue = tostr(outvalue) + tostr(curvalue)
       }
      }
      curteg = substring(curteg, word, 2, -1)
     }
     doc.out(tostr(outvalue), curaddress + tostr(basecell))
    }
   }
   basecell = basecell + 1
  }
  
  if(errorrow > = 0)
  {
   if(lastcellindex > 0)
   {
    if(lastcellindex >= 26)
     curaddress = "a" + char(lastcellindex + 96 - 26)
    else
     curaddress = char(lastcellindex + 96)
   }
   else
    curaddress = "r"
   
   var range = "a" + tostr(errorrow) + ":" + curaddress + tostr(errorrow)
   range = wk.exec(propertyget, range, range)
   range.exec(procedure, merge)
   var interior = range.exec(propertyget, Interior)
   interior.exec(propertyset, colorindex, 3)
 
   doc.out(grs(grsmass[index], 1000, ""), "a" + tostr(errorrow))
  }
 }

 if(basecell > startcell) 
 {
  if(lastcellindex >= 26)
   curaddress = "a" + char(lastcellindex + 96 - 26)
  else
   curaddress = char(lastcellindex + 96)
  doc.drawborder("a" + tostr(startcell) + ":"+ curaddress + tostr(basecell - 1), 1, 2, 63)
 }
}

define function run_forming_total(grsmass, ksudesc)
{
 if(sizeof(grsmass) < 1)
  return
  
 var baseCell = doc.getlast() + 1
 var startcell = baseCell
 var curaddress = ""
 var lastcellindex = 0
 
 for(var index = 0; index < 2; index = index + 1)
 {
  if(index >= sizeof(grsmass))
  {
  }
  else
  {
   var kds = sizeof(ksudesc[0])
   if(kds > lastcellindex)
    lastcellindex = kds
 
   for(var j = kds - 1; j >= 0; j = j - 1)
   {
    if(sizeof(ksudesc[0][j]) > 0)
    {
     if(j >= 26)
      curaddress = "a" + char(j + 97 - 26)
     else
      curaddress = char(j + 97)
      
     var outvalue = ""
     var curteg = ksudesc[0][j]
     for(;sizeof(curteg)>0;)
     {
      var curvalue = substring(curteg, word, 1, 1)
      if(sizeof(curvalue) > 0)
      {
       if(curvalue[0] == "f")
       {
        if(curvalue == "f_getcasettes")
         curvalue = f_getcasettes(grsmass[index])
        else
        {
         if(curvalue == "f_getrolls")
          curvalue = f_getrolls(grsmass[index])
        }
       }else
       {
        if(curvalue == %date%)
         curvalue = %date%
        else
        {
         if(isnumber(curvalue))
          curvalue = grs(grsmass[index], tonumber(curvalue), "0")
        }
       }
       
       if((isnumber(curvalue)) & (isnumber(outvalue)))
        outvalue = tonumber(outvalue) + tonumber(curvalue)
       else
       {
        if((sizeof(outvalue) <= 0) & (isnumber(curvalue)))
         outvalue = tostr(curvalue)
        else
         outvalue = tostr(outvalue) + tostr(curvalue)
       }
      }
      curteg = substring(curteg, word, 2, -1)
     }
     doc.out(tostr(outvalue), curaddress + tostr(basecell))
    }
   }
   basecell = basecell + 1
  }
 }

 var kds = sizeof(ksudesc[0])
 for(var j = kds - 1; j >= 1; j = j - 1)
 {
  if(j >= 26)
   curaddress = "a" + char(j + 97 - 26)
  else
   curaddress = char(j + 97)
  doc.out("=" + curaddress + tostr(basecell - 3) + "+" + curaddress + tostr(basecell - 2) + "-" + curaddress + tostr(basecell - 1), curaddress + tostr(basecell))
 }

'подсчет суммы для рублей
 curaddress = char(97 + 3)
 var nextaddress = char(97 + 4)
 doc.out("=" + curaddress + ToStr(baseCell - 3) + "+" + curaddress + ToStr(baseCell - 2) + "-" + curaddress + ToStr(baseCell - 1) + " + int((" + nextaddress + ToStr(baseCell - 3) + "+" + nextaddress + ToStr(baseCell - 2) + "-" + nextaddress + ToStr(baseCell - 1) + ")/100)", curaddress + ToStr(baseCell))

'подсчет суммы для копеек 
 doc.out("=((" + nextaddress + ToStr(baseCell - 3) + "+" + nextaddress + ToStr(baseCell - 2) + "-" + nextaddress + ToStr(baseCell - 1) + ")/100 - int((" + nextaddress + ToStr(baseCell - 3) + "+" + nextaddress + ToStr(baseCell - 2) + "-" + nextaddress + ToStr(baseCell - 1) + ")/100))*100", nextaddress + ToStr(baseCell))
 
 doc.out("Поступило за " + tostr(quarter) + " кв. " + tostr(year) + "г.", "a" + ToStr(baseCell - 2))
 doc.out("Выбыло за " + tostr(quarter) + " кв. " + tostr(year) + "г.", "a" + ToStr(baseCell - 1))

 var monthstring
 if(quarter == "I")
  monthstring = "01.04." 	
 if(quarter == "II")
  monthstring = "01.07." 	
 if(quarter == "III")
  monthstring = "01.10." 	
 if(quarter == "IV")
 {
  monthstring = "01.01." 	
   year = year + 1
 }
 
 doc.out("Состоит на " + monthstring + tostr(year), "a" + ToStr(baseCell))

 if(basecell > startcell) 
 {
  if(lastcellindex >= 26)
   curaddress = "a" + char(lastcellindex + 96 - 26)
  else
   curaddress = char(lastcellindex + 96)
  doc.drawborder("a" + tostr(startcell) + ":"+ curaddress + tostr(basecell), 1, 2, 63)
 }
}