define function main()
{
 var pagestart = 0
 doc.clear()
 
 var ole = doc.oleobject()
 ole = ole.propertyget(activesheet)

 var cols = ole.exec(function, columns)
 var col = cols.exec(propertyget, item, 1)
 col.exec(propertyset, columnwidth, 7)
 var range

 col = cols.exec(propertyget, item, 2)
 col.exec(propertyset, columnwidth, 25)

 col = cols.exec(propertyget, item, 3)
 col.exec(propertyset, columnwidth, 6)

 col = cols.exec(propertyget, item, 4)
 col.exec(propertyset, columnwidth, 3)

 col = cols.exec(propertyget, item, 5)
 col.exec(propertyset, columnwidth, 7)

 col = cols.exec(propertyget, item, 6)
 col.exec(propertyset, columnwidth, 25)

 col = cols.exec(propertyget, item, 7)
 col.exec(propertyset, columnwidth, 6)

 'var billmass = newmass(0)
 var billnumber = grs(grsrec, 22, 0)
 var opendate = grs(grsrec, 23, 0)
 
 var siglmass = newmass(0)
 var invmass = newmass(0)
 var invcountmass = newmass(0)
 var countmass = newmass(0)
 
 for(var i = sizeof(source) - 1; i >= 0; i = i - 1)
 {
  for(var j = source[i].count(999) - 1; j >= 0; j = j - 1)
  {
   if(source[i].value(999, j, $e) == billnumber + "/" + opendate)
   {
    var sigla = source[i].value(999, j, $b)
    var curindex = indexof(siglmass, sigla)
    if(curindex < 0)
    {
     add(siglmass, sigla)
     add(invmass, newmass(0))
     add(invcountmass, newmass(0))
     add(invmass[sizeof(invmass) - 1], source[i].value(999, j, $p))
     add(invcountmass[sizeof(invmass) - 1], tonumber(source[i].value(999, j, $v)))
     add(countmass, tonumber(source[i].value(999, j, $v)))
    }
    else
    {
     var k = indexof(invmass[curindex], source[i].value(999, j, $p))
     if(k < 0)
     {
      add(invmass[curindex], source[i].value(999, j, $p))
      add(invcountmass[curindex], tonumber(source[i].value(999, j, $v)))
     }
     else
     {
      invcountmass[curindex][k] = invcountmass[curindex][k] + tonumber(source[i].value(999, j, $v))
     }
     
     countmass[curindex] = countmass[curindex] + tonumber(source[i].value(999, j, $v))
    }
   }
  } 
 }
 var basecell = 1
 var shift = 0
 var startcurrent
 var maxcell = 0


 for(var i = sizeof(siglmass) - 1; i >= 0; i = i - 1)
 {
  startcurrent = basecell
  var currsigla = siglmass[i]
  
  doc.out("Путевка на книги фонда " + siglmass[i], char(97 + shift) + tostr(basecell))
  range = ole.propertyget(range, char(97 + shift) + tostr(basecell) + ":" + char(97 + shift + 2) + tostr(basecell))
  range.procedure(merge)
  range.propertyset(WrapText, 1)
  
  basecell = basecell + 1
  doc.out("Дата поступления книг " + "       ", char(97 + shift) + tostr(basecell))
  range = ole.propertyget(range, char(97 + shift) + tostr(basecell) + ":" + char(97 + shift + 2) + tostr(basecell))
  range.procedure(merge)
  range.propertyset(WrapText, 1)

  basecell = basecell + 1
  doc.out("Счет № " + billnumber + " от " + billopendate, char(97 + shift) + tostr(basecell))
  range = ole.propertyget(range, char(97 + shift) + tostr(basecell) + ":" + char(97 + shift + 2) + tostr(basecell))
  range.procedure(merge)
  range.propertyset(WrapText, 1)

  basecell = basecell + 1
  doc.out("Общее количество книг " + tostr(countmass[i]) + " экземпляров", char(97 + shift) + tostr(basecell))
  range = ole.propertyget(range, char(97 + shift) + tostr(basecell) + ":" + char(97 + shift + 2) + tostr(basecell))
  range.procedure(merge)
  range.propertyset(WrapText, 1)

  basecell = basecell + 2
  
  var startcell = basecell
  
  var siglashift = 0
  if(!isoul(currsigla))
   doc.out("Формат", char(97 + shift) + tostr(basecell))
  else
  {
   range = ole.propertyget(range, char(97 + shift) + tostr(basecell) + ":" + char(97 + shift + 1) + tostr(basecell))   	
   range.procedure(merge)
   siglashift = -1
  }
   
  doc.out("Инвентарные №", char(97 + shift + 1 + siglashift) + tostr(basecell))
  doc.out("Кол-во", char(97 + shift + 2) + tostr(basecell))
  
  basecell = basecell + 1

  var FormNumbMass = newmass(0)
  var FormValueMass = newmass(0)
  var FormCountMass = newmass(0)
  for(var j = sizeof(invmass[i]) - 1; j >= 0; j = j - 1)
  {
   var s
   if(isdigit(invmass[i][j]) & sizeof(invmass[i][j]) == 7)
    s = invmass[i][j][6]
   else
   {
    if(compareci(substring(invmass[i][j], symbol, 1, 2), "БУ") == 0)
     s = "БУ"
    else
    {
     if(compareci(substring(invmass[i][j], symbol, 1, 1), "Б") == 0)
      s = "Брош."
     else
      s = ""
     
    }
   }
    
   var k = indexof(FormNumbMass, s)
   if(k < 0)
   {
    add(FormNumbMass, s)
    add(FormValueMass, newmass(0))
    if(invcountmass[i][j] > 1)
     add(FormValueMass[sizeof(FormValueMass) - 1], invmass[i][j] + "(" + tostr(invcountmass[i][j]) + ")")
    else
     add(FormValueMass[sizeof(FormValueMass) - 1], invmass[i][j])
     
    add(FormCountMass, invcountmass[i][j])
   }
   else
   {
    if(invcountmass[i][j] > 1)
     add(FormValueMass[k], invmass[i][j] + "(" + tostr(invcountmass[i][j]) + ")")
    else
     add(FormValueMass[k], invmass[i][j])
    FormCountMass[k] = FormCountMass[k] + invcountmass[i][j]
   }
  }
  
  for(var i = sizeof(FormNumbMass) - 1; i >= 0; i = i - 1)
  {
   if(!isoul(currsigla))
    doc.out(FormNumbMass[i], char(97 + shift) + tostr(basecell))

   var outmas = groupranges(FormValueMass[i])
   var outmassize = sizeof(outmas)
   
   var outstring = ""
   var outpart = ""
   var linecount = 0
   for(var j = 0; j < outmassize; j  = j + 1)
   {
    if(sizeof(outpart) + sizeof(outmas[j]) > 25)
    {
     linecount = linecount + 1
     if(sizeof(outstring) > 0)
      outstring = outstring + ",\n" + outpart
     else
      outstring = outpart
     outpart = outmas[j]
    }
    else
    {
     if(sizeof(outpart) > 0)
      outpart = outpart + ", " + outmas[j]
     else
      outpart = outmas[j]
    }
   }

   linecount = linecount + 1

   if(linecount > 1)
   {
    if(isoul(currsigla))
    {
     range = ole.propertyget(range, char(97 + shift) + tostr(basecell) + ":" + char(97 + shift + 1) + tostr(basecell + linecount - 1))
     range.propertyset(VerticalAlignment, -4160)
     range.procedure(merge)
    }
    else
    {
     range = ole.propertyget(range, char(97 + shift) + tostr(basecell) + ":" + char(97 + shift) + tostr(basecell + linecount - 1))
     range.propertyset(VerticalAlignment, -4160)
     range.procedure(merge)

     range = ole.propertyget(range, char(97 + shift + 1) + tostr(basecell) + ":" + char(97 + shift + 1) + tostr(basecell + linecount - 1))
     range.propertyset(VerticalAlignment, -4160)
     range.procedure(merge)
    }

    range = ole.propertyget(range, char(97 + shift + 2) + tostr(basecell) + ":" + char(97 + shift + 2) + tostr(basecell + linecount - 1))
    range.propertyset(VerticalAlignment, -4160)
    range.procedure(merge)
   }
   else
   {
    if(isoul(currsigla))
    {
     range = ole.propertyget(range, char(97 + shift) + tostr(basecell) + ":" + char(97 + shift + 1) + tostr(basecell + linecount - 1))
     range.propertyset(VerticalAlignment, -4160)
     range.procedure(merge)
    }
   }
   
   
   if((sizeof(outstring) > 0) & (sizeof(outstring) + sizeof(outpart) > 20))
    doc.out(outstring + ", \n" + outpart, char(97 + shift + 1 + siglashift) + tostr(basecell))
   else
   {
    if(sizeof(outstring) > 0)
     doc.out(outstring + ", " + outpart, char(97 + shift + 1 + siglashift) + tostr(basecell))
    else
     doc.out(outpart, char(97 + shift + 1 + siglashift) + tostr(basecell))
   }
  

   doc.out(tostr(FormCountMass[i]), char(97 + shift + 2) + tostr(basecell))
   basecell = basecell + linecount 
  }
  doc.out("Примеч.", char(97 + shift) + tostr(basecell))
  
  doc.drawborder(char(97 + shift) + tostr(startcell) + ":" + char(97 + shift + 2) + tostr(basecell))
  
  range = ole.propertyget(range, char(97 + shift) + tostr(startcell) + ":" + char(97 + shift + 2) + tostr(basecell))
  var line = range.propertyget(Borders, 11)
  line.propertyset(LineStyle, 1)
  line.propertyset(Weight, 2)
  line = range.propertyget(Borders, 12)
  line.propertyset(LineStyle, 1)
  line.propertyset(Weight, 2)
  
  
  range = ole.propertyget(range, char(97 + shift) + tostr(startcurrent) + ":" + char(97 + shift + 2) + tostr(basecell))
  range.propertyset(horizontalalignment, -4108)

  basecell = basecell + 2
 
  doc.out("Дата передачи каталогизатору", char(97 + shift + 1) + tostr(basecell))
  range = ole.propertyget(range, char(97 + shift + 1) + tostr(basecell) + ":" + char(97 + shift + 2) + tostr(basecell))
  range.procedure(merge)
  range.propertyset(WrapText, 1)
  basecell = basecell + 1 
  doc.out("\"__\"___________200_г. Подпись_____________", char(97 + shift) + tostr(basecell))
  range = ole.propertyget(range, char(97 + shift) + tostr(basecell) + ":" + char(97 + shift + 2) + tostr(basecell))
  range.procedure(merge)
  range.propertyset(WrapText, 1)
  basecell = basecell + 1 
  doc.out("Дата передачи систематизатору", char(97 + shift + 1) + tostr(basecell))
  range = ole.propertyget(range, char(97 + shift + 1) + tostr(basecell) + ":" + char(97 + shift + 2) + tostr(basecell))
  range.procedure(merge)
  range.propertyset(WrapText, 1)
  basecell = basecell + 1 
  doc.out("\"__\"___________200_г. Подпись_____________", char(97 + shift) + tostr(basecell))
  range = ole.propertyget(range, char(97 + shift) + tostr(basecell) + ":" + char(97 + shift + 2) + tostr(basecell))
  range.procedure(merge)
  range.propertyset(WrapText, 1)
  basecell = basecell + 1 
  doc.out("Дата сдачи зав.отделом хранения", char(97 + shift + 1) + tostr(basecell))
  range = ole.propertyget(range, char(97 + shift + 1) + tostr(basecell) + ":" + char(97 + shift + 2) + tostr(basecell))
  range.procedure(merge)
  range.propertyset(WrapText, 1)
  basecell = basecell + 1 
  doc.out("\"__\"___________200_г. Подпись_____________", char(97 + shift) + tostr(basecell))
  range = ole.propertyget(range, char(97 + shift) + tostr(basecell) + ":" + char(97 + shift + 2) + tostr(basecell))
  range.procedure(merge)
  range.propertyset(WrapText, 1)
  
  basecell = basecell + 4 
  if(shift == 0)
  {
   shift = 4
   maxcell = basecell
   basecell = startcurrent
  }
  else
  {
   shift = 0
   if(maxcell > basecell)
    basecell = maxcell
    
   if(basecell - pagestart > 45)
   {
    range = ole.propertyget(range, "a" + tostr(startcurrent))
    var HPageBreaks = ole.sexec(propertyget, HPageBreaks)
    HPageBreaks.sexec(procedure, add, range)
   
    pagestart = startcurrent
   }
  }
 }
 if(maxcell > basecell)
  basecell = maxcell
  
 if(basecell - pagestart > 45)
 {
  range = ole.propertyget(range, "a" + tostr(startcurrent))
  var HPageBreaks = ole.sexec(propertyget, HPageBreaks)
  HPageBreaks.sexec(procedure, add, range)
 
  pagestart = startcurrent
 }

}

define function isoul(sigla)
{
 return ((compareci(sigla, "ОЧЗ") == 0) | (compareci(sigla, "ОУЛ") == 0) | (compareci(sigla, "ОНТД") == 0) | (compareci(sigla, "ИМОП") == 0))
}