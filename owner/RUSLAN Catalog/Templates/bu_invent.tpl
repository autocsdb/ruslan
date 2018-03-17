define function main()
{
 var buident = "бу"
 var mass = newmass(0)
 for(var i = sizeof(source) - 1; i >= 0; i = i - 1)
 {
  for(var j = source[i].count(999) - 1; j >= 0; j = j - 1)
  {
   if(compareci(source[i].value(999, j, $p), buident, sizeof(buident)) == 0)
   {
    var number = substring(source[i].value(999, j, $p), symbol, sizeof(buident) + 1, -1)
'    if((isdigit(number)) & (tonumber(number) > tonumber(startbody)) & ((sizeof(endbody) == 0) | (tonumber(number) <= tonumber(endbody))))
    if(isdigit(number))
    {  
     var cur[3]
     cur[0] = tonumber(number)
     cur[1] = source[i]
     cur[2] = j
     add(mass, cur)
    }
   }
  }
 }

 sort(mass, mass[%ROW%][0], mass[%ROW%][2])
 doc.newfile()
 
 var currentfile = -1
 var masssize = sizeof(mass)
 for(var i = 0; i < masssize; i = i + 1)
 {
  status(i / masssize)
'  if(currentfile != -1)
'  {
'   for(;mass[i][0] > currentfile * 500 + 500;)
'   {
'    currentfile = currentfile + 500
'    doc.open("БУ" + tostr(currentfile) + ".xls", 1, 0)
'   }
'  }else
'  {
'   var s = tostr(mass[i][0] / 500)
'   s = substring(s, word, 0, 1)
'   currentfile = tonumber(s)
'   doc.open("БУ" + tostr(currentfile) + ".xls", 1, 0)
'  }
  if(doc.openpage("БУ" + tostr(mass[i][0]), open))
  {
   doc.clear()
  } 
  else
  {
   doc.openpage("БУ" + tostr(mass[i][0]), new)
  }

  var resulmass = newmass(0) 
  var count999 = mass[i][1].count(999) 
  for(var j = 0; j < count999; j = j + 1)
  {
   if(compareci(mass[i][1].value(999, j, $p), buident, sizeof(buident)) != 0)
    continue

   var currentelement[5]
   var longnum = mass[i][1].value(999, j, $e)
   var pos = pos(longnum, "/")
   var billnum = substring(longnum, symbol,1, pos - 1)
   var billdate = ""
   if(pos > 0)
    billdate = substring(longnum, symbol, pos + 1, -1)
   
   'Дата
   currentelement[0] = billdate
   'Номер счета
   currentelement[1] = billnum
   'Кол-во
   currentelement[2] = mass[i][1].value(999, j, $v)
   'Цена
   currentelement[3] = mass[i][1].value(999, j, $u)
   'Выбыло
   currentelement[4] = ""
   
   add(resulmass, currentelement)
  }
  for(var j = 0; j < mass[i][1].count(989); j = j + 1)
  {
   if(compareci(mass[i][1].value(989, j, $p), buident, sizeof(buident)) != 0)
    continue

   var currentelement[5]
   
   var longnum = mass[i][1].value(989, j, $e)
   var pos = pos(longnum, "/")
   var billnum = substring(longnum, symbol,1, pos - 1)
   var billdate = ""
   if(pos > 0)
    billdate = substring(longnum, symbol, pos + 1, -1)
   
   'Дата
   currentelement[0] = billdate
   'Номер счета
   currentelement[1] = billnum
   'Кол-во
   currentelement[2] = ""
   'Цена
   currentelement[3] = ""
   'Выбыло
   currentelement[4] = mass[i][1].value(989, j, $v)

   add(resulmass, currentelement)
  }
  
  sort(resulmass, resulmass[%row%][0])

  var basecell = 0
  var startchar = 0
  var oldbasecell = 0
  var pagestart = 0
  var maxpagesize = 50
  var tablestart = 0
  var lastsummcell = ""

  var excel = doc.oleobject()
  var activesheet = excel.propertyget(activesheet)
  var range
 

  for(var j = 0; j < sizeof(resulmass); j = j + 1)
  {
   if((basecell == 0) | (basecell - pagestart > maxpagesize))
   {
    if(tablestart != 0)
    {
     doc.drawborder(char(startchar) + tostr(tablestart) + ":" + char(startchar + 6) + tostr(basecell - 1), 1, 2, 63)
     range = activesheet.propertyget(range, "a" + tostr(basecell + 1))
     var HPageBreaks = activesheet.sexec(propertyget, HPageBreaks)
     HPageBreaks.sexec(procedure, add, range)
    }

    if(startchar != 97)
    {
     pagestart = basecell
     startchar = 97

     basecell = basecell + 1
     range = activesheet.propertyget(range, "a" + tostr(basecell) + ":l" + tostr(basecell))
     range.procedure(merge)
     doc.out("№ инв. БУ" + tostr(mass[i][0]) + "       Автор " + mass[i][1].value(700, 0, $a" "$b), "a" + tostr(basecell))
   
     basecell = basecell + 1
     range = activesheet.propertyget(range, "a" + tostr(basecell) + ":l" + tostr(basecell))
     range.procedure(merge)
     doc.out("Заглавие " + mass[i][1].value(200, 0, $a), "a" + tostr(basecell))
   
     basecell = basecell + 1
     range = activesheet.propertyget(range, "a" + tostr(basecell) + ":l" + tostr(basecell))
     range.procedure(merge)
     doc.out("Изд. " + mass[i][1].value(210, 0, $c) + "       Место " + mass[i][1].value(210, 0, $a) + "       Год " + mass[i][1].value(210, 0, $d) + "       Цена " + mass[i][1].value(999, mass[i][2], $u), "a" + tostr(basecell))
    
     oldbasecell = basecell
    }else
    {
     basecell = oldbasecell
     startchar = 104
    }

    basecell = basecell + 2

    var col = activesheet.propertyget(Columns, startchar - 96)
    col.propertyset(columnwidth, 10)

    tablestart = basecell
    range = activesheet.propertyget(range, char(startchar) + tostr(basecell) + ":" + char(startchar) + tostr(basecell + 2))
    range.procedure(merge)
    range.exec(propertyset, wraptext, 1)
    range.exec(propertyset, HorizontalAlignment, -4108)
    range.exec(propertyset, VerticalAlignment, -4108)
    doc.out("Дата поступления", char(startchar) + tostr(basecell))

    col = activesheet.propertyget(Columns, startchar - 95)
    col.propertyset(columnwidth, 4)

    range = activesheet.propertyget(range, char(startchar + 1) + tostr(basecell) + ":" + char(startchar + 1) + tostr(basecell + 2))
    range.procedure(merge)
    range.exec(propertyset, wraptext, 1)
    range.exec(propertyset, HorizontalAlignment, -4108)
    range.exec(propertyset, VerticalAlignment, -4108)
    doc.out("№ записи сум. учета", char(startchar + 1) + tostr(basecell))

    col = activesheet.propertyget(Columns, startchar - 94)
    col.propertyset(columnwidth, 3)
  
    range = activesheet.propertyget(range, char(startchar + 2) + tostr(basecell) + ":" + char(startchar + 4) + tostr(basecell))
    range.procedure(merge)
    range.exec(propertyset, wraptext, 1)
    range.exec(propertyset, HorizontalAlignment, -4108)
    range.exec(propertyset, VerticalAlignment, -4108)
    doc.out("Поступило", char(startchar + 2) + tostr(basecell))

    col = activesheet.propertyget(Columns, startchar - 93)
    col.propertyset(columnwidth, 4)
  
    range = activesheet.propertyget(range, char(startchar + 2) + tostr(basecell + 1) + ":" + char(startchar + 2) + tostr(basecell + 2))
    range.procedure(merge)
    range.exec(propertyset, wraptext, 1)
    range.exec(propertyset, HorizontalAlignment, -4108)
    range.exec(propertyset, VerticalAlignment, -4108)
    doc.out("Кол-во", char(startchar + 2) + tostr(basecell + 1))
  
    col = activesheet.propertyget(Columns, startchar - 92)
    col.propertyset(columnwidth, 2)
    col.propertyset(NumberFormat, "@")
  
    range = activesheet.propertyget(range, char(startchar + 3) + tostr(basecell + 1) + ":" + char(startchar + 4) + tostr(basecell + 1))
    range.procedure(merge)
    range.exec(propertyset, wraptext, 1)
    range.exec(propertyset, HorizontalAlignment, -4108)
    range.exec(propertyset, VerticalAlignment, -4108)
    doc.out("Сумма", char(startchar + 3) + tostr(basecell + 1))

 
    range = activesheet.propertyget(range, char(startchar + 3) + tostr(basecell + 2))
    range.procedure(merge)
    range.exec(propertyset, wraptext, 1)
    range.exec(propertyset, HorizontalAlignment, -4108)
    range.exec(propertyset, VerticalAlignment, -4108)
    doc.out("р.", char(startchar + 3) + tostr(basecell + 2))
  
    range = activesheet.propertyget(range, char(startchar + 4) + tostr(basecell + 1))
    range.procedure(merge)
    range.exec(propertyset, wraptext, 1)
    range.exec(propertyset, HorizontalAlignment, -4108)
    range.exec(propertyset, VerticalAlignment, -4108)

    doc.out("к.", char(startchar + 4) + tostr(basecell + 2))

    col = activesheet.propertyget(Columns, startchar - 91)
    col.propertyset(columnwidth, 4)
    
    range = activesheet.propertyget(range, char(startchar + 5) + tostr(basecell))
    range.procedure(merge)
    range.exec(propertyset, wraptext, 1)
    range.exec(propertyset, HorizontalAlignment, -4108)
    range.exec(propertyset, VerticalAlignment, -4108)
    doc.out("Выбыло", char(startchar + 5) + tostr(basecell))
    
    range = activesheet.propertyget(range, char(startchar + 5) + tostr(basecell + 1) + ":" + char(startchar + 5) + tostr(basecell + 2))
    range.procedure(merge)
    range.exec(propertyset, wraptext, 1)
    range.exec(propertyset, HorizontalAlignment, -4108)
    range.exec(propertyset, VerticalAlignment, -4108)
    doc.out("к-во", char(startchar + 5) + tostr(basecell + 1))

    range = activesheet.propertyget(range, char(startchar + 6) + tostr(basecell))
    range.procedure(merge)
    range.exec(propertyset, wraptext, 1)
    range.exec(propertyset, HorizontalAlignment, -4108)
    range.exec(propertyset, VerticalAlignment, -4108)
    doc.out("Состоит", char(startchar + 6) + tostr(basecell))
 
    range = activesheet.propertyget(range, char(startchar + 6) + tostr(basecell + 1) + ":" + char(startchar + 6) + tostr(basecell + 2))
    range.procedure(merge)
    range.exec(propertyset, wraptext, 1)
    range.exec(propertyset, HorizontalAlignment, -4108)
    range.exec(propertyset, VerticalAlignment, -4108)
    doc.out("к-во", char(startchar + 6) + tostr(basecell + 1))
 
    basecell = basecell + 3
   }

   
   doc.out(substring(resulmass[j][0], symbol, 7, 2) + "." + substring(resulmass[j][0], symbol, 5, 2) + "." + substring(resulmass[j][0], symbol, 1, 4), char(startchar) + tostr(basecell))
   
   doc.out(resulmass[j][1], char(startchar + 1) + tostr(basecell))
'Поступление
   doc.out(resulmass[j][2], char(startchar + 2) + tostr(basecell))
'Выбытие
   doc.out(resulmass[j][4], char(startchar + 5) + tostr(basecell))
   
   if(sizeof(lastsummcell) > 0)
   {
    if(sizeof(resulmass[j][2]) > 0)
     doc.out("=" + lastsummcell + "+" + char(startchar + 2) + tostr(basecell), char(startchar + 6) + tostr(basecell))
    else
    {
     if(sizeof(resulmass[j][4]) > 0)
      doc.out("=" + lastsummcell + "-" + char(startchar + 5) + tostr(basecell), char(startchar + 6) + tostr(basecell))
     else
      doc.out("=" + lastsummcell, char(startchar + 6) + tostr(basecell))
    }
   }
   else
    doc.out(resulmass[j][2], char(startchar + 6) + tostr(basecell))

   lastsummcell = char(startchar + 6) + tostr(basecell)
   
   doc.out(substring(resulmass[j][3], word, 1, 1), char(startchar + 3) + tostr(basecell))
   
   var cop = substring(resulmass[j][3], word, 2, 1)
   if(sizeof(cop) < 2)
    cop = cop + "0"
   if(sizeof(cop) < 2)
    cop = cop + "0"
   doc.out(cop, char(startchar + 4) + tostr(basecell))
 
   basecell = basecell + 1
  }
  if(tablestart != 0)
   doc.drawborder(char(startchar) + tostr(tablestart) + ":" + char(startchar + 6) + tostr(basecell - 1), 0, 2, 63)
 }
}