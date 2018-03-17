define function main()
{
param2 = uppercase(param2)
inventnum = uppercase(inventnum)
if((param2 == "Б/У") & (!startwith(inventnum, "Б/У")))
 inventnum = param2+inventnum

if(startwith(inventnum, "Б/У"))
 doc.OpenPage(substring(inventnum, symbol, 4, -1), new)
else
 doc.OpenPage(inventnum, new)
doc.clear()

if(startwith(inventnum, "Б/У"))
 var mainstring = "№ инв.:  " + substring(inventnum, symbol, 4, -1) + "  Автор:  "
else
 var mainstring = "№ инв.:  " + inventnum + "  Автор:  "
if(sizeof(source) > 0)
{
 if(marcexist(source[0], 461, 0))
 { 
  mainstring = mainstring + marc(source[0], 461, 0, 700, 0, ($a?$a($b?" "$b)))   
  if(!marcexist(source[0], 461, 0, 700))
   mainstring = mainstring + marc(source[0], 461, 0, 710, 0, ($a?$a($b?" "$b)))   
  if(!marcexist(source[0], 461, 0, 710) & !marcexist(source[0], 461, 0, 700))
   mainstring = mainstring + marc(source[0], 461, 0, 702, 0, ($a?$a($b?" "$b)))	
 }
 else
 {
  mainstring = mainstring + marc(source[0], 700, 0, ($a?$a($b?" "$b)))   
  if(!marcexist(source[0], 700))
   mainstring = mainstring + marc(source[0], 710, 0, ($a?$a($b?" "$b)))   
  if(!marcexist(source[0], 710) & !marcexist(source[0], 700))
   mainstring = mainstring + marc(source[0], 702, 0, ($a?$a($b?" "$b)))	
 }
 doc.out(mainstring, "A2")
 
 mainstring = "Заглавие:  "
 if(marcexist(source[i], 461, 0))
  mainstring = mainstring + marc(source[i], 461, 0, 200, 0, ($a?$a", ")) + marc(source[i], 200, 0, $a)
 else
  mainstring = mainstring + marc(source[i], 200, 0, $a)	

 doc.out(mainstring, "A3")

 
 if(marcexist(source[i], 461, 0))
  mainstring = "Изд.:  " + marc(source[i], 461, 0, 210, 0, $c(!$c?"____________________")) + "  Место:  " + marc(source[i], 461, 0, 210, 0, $a(!$a?"____________________")) + "  Год:  " + marc(source[i], 461, 0, 210, 0, $d(!$d?"____________________"))
 else
  mainstring = "Изд.: " + marc(source[i], 210, 0, $c(!$c?"____________________")) + "  Место:  " + marc(source[i], 210, 0, $a(!$a?"____________________")) + "  Год:  " + marc(source[i], 210, 0, $d(!$d?"____________________"))

 doc.out(mainstring, "A4")
 
 var basecell = 8
 
 
 doc.out("Дата поступления", "A" + tostr(basecell - 2))
 doc.out("№ записи сум.учета", "B" + tostr(basecell - 2))
 doc.out("Поступило", "C" + tostr(basecell - 2))
 doc.out("к-во", "C" + tostr(basecell - 1))
 doc.out("сумма", "D" + tostr(basecell - 1))
 doc.out("Выбыло", "E" + tostr(basecell - 2))
 doc.out("к-во", "E" + tostr(basecell - 1))
 doc.out("Состоит", "F" + tostr(basecell - 2))
 doc.out("к-во", "F" + tostr(basecell - 1))
 
 var sortmass = newmass(0)
 var datamass = newmass(0)
 for(var i = 0; i <marccount(source[0], 999); i= i + 1)
 {
  if(startwith(marc(source[i], 999, j, $e), "-"))
   continue

  if(Param1 != "Все")
  {
   if(marc(source[0], 999, i, $b) != Param1)   
    continue
  } 
'message(marc(source[0], 999, i, $p)+"|"+inventnum)
  if(marc(source[0], 999, i, $p) == inventnum)
  {
   var longnum = marc(source[0], 999, i, $e)
   var pos = pos(longnum, "/")
   var billnum = substring(longnum, symbol,0, pos - 1)
   if(tonumber(billnum) == -11)
    continue
   
   var billdate = ""
   if(pos > 0)
    billdate = substring(longnum, symbol, pos + 1, -1)
   
   add(sortmass, billdate)
   var record = newmass(0)
   add(record, tostr(billdate))
   add(record, billnum)
   add(record, marc(source[0], 999, i, $v))
   
   
   add(record, tostr(tonumber(marc(source[0], 999, i, $v)) * tonumber(marc(source[0], 999, i, $u))))
   add(record, "")
   add(record, "")
   add(datamass, record)
  }
 }
 for(var i = 0; i <marccount(source[0], 989); i= i + 1)
 {
  if(Param1 != "Все")
  {
   if(marc(source[0], 989, i, $b) != Param1)   
    continue
  } 
  if(marc(source[0], 989, i, $p) == inventnum)
  {
   var longnum = marc(source[0], 989, i, $e)
   var pos = pos(longnum, "/")
   var billdate = ""
   if(pos > 0)
    billdate = substring(longnum, symbol, pos + 1, -1)
   
   add(sortmass, billdate)
   var record = newmass(0)
   add(record, tostr(billdate))
   add(record, substring(longnum, symbol,0, pos - 1))
   add(record, "")
   add(record, "")
   add(record, marc(source[0], 989, i, $v))
   add(record, "")
   add(datamass, record)
  }
 }
 
 sort(datamass, sortmass[%Row%])
 
  for(var i = 0; i < sizeof(datamass); i = i + 1)
 {
  var record = datamass[i]
  var actyear = substring(record[0], symbol, 1, 4)
  var actmonth = substring(record[0], symbol, 5, 2)
  var actday = substring(record[0], symbol, 7, 2)

  doc.out(actday + "." + actmonth + "." + actyear, "A" + tostr(basecell + i))
  doc.out(record[1], "B" + tostr(basecell + i))
  doc.out(record[2], "C" + tostr(basecell + i))
  doc.out(record[3], "D" + tostr(basecell + i))
  doc.out(record[4], "E" + tostr(basecell + i))
  if(i == 0)
   doc.out("=C"+tostr(basecell + i), "F" + tostr(basecell + i))
  else
   doc.out("=F" + tostr(basecell + i - 1) + "+C" + tostr(basecell + i) +"-E" + tostr(basecell + i), "F" + tostr(basecell + i))
 }
 
 var worksheet = doc.oleobject()
 
 var range = worksheet.exec(propertyget, usedrange)
 var cols = range.exec(function, columns)
 var col = cols.exec(propertyget, item, 1)
 col.exec(propertyset, columnwidth, 15)

 col = cols.exec(propertyget, item, 2)
 col.exec(propertyset, columnwidth, 12)
 col = cols.exec(propertyget, item, 3)
 col.exec(propertyset, columnwidth, 12)
 col = cols.exec(propertyget, item, 4)
 col.exec(propertyset, columnwidth, 12)
 col = cols.exec(propertyget, item, 5)
 col.exec(propertyset, columnwidth, 12)
 col = cols.exec(propertyget, item, 6)
 col.exec(propertyset, columnwidth, 12)


 range = worksheet.exec(propertyget, range, "A1:F1")
 range.exec(Procedure, merge)
 range.exec(propertyset, wraptext, 1)
 range = worksheet.exec(propertyget, range, "A2:F2")
 range.exec(Procedure, merge)
 range.exec(propertyset, wraptext, 1)
 range = worksheet.exec(propertyget, range, "A3:F3")
 range.exec(Procedure, merge)
 range.exec(propertyset, wraptext, 1)
 range = worksheet.exec(propertyget, range, "A4:F4")
 range.exec(Procedure, merge)
 range.exec(propertyset, wraptext, 1)

 var rangetext =  "C" + tostr(basecell - 2) + ":D" + tostr(basecell - 2)
 range = worksheet.exec(propertyget, range, rangetext)
 range.exec(Procedure, merge)
 range.exec(propertyset, wraptext, 1)

 rangetext =  "A" + tostr(basecell - 2) + ":A" + tostr(basecell - 1)
 range = worksheet.exec(propertyget, range, rangetext)
 range.exec(Procedure, merge)
 range.exec(propertyset, wraptext, 1)

 rangetext =  "B" + tostr(basecell - 2) + ":B" + tostr(basecell - 1)
 range = worksheet.exec(propertyget, range, rangetext)
 range.exec(Procedure, merge)
 range.exec(propertyset, wraptext, 1)
 
 rangetext = "A" + Tostr(basecell - 2) + ":F"+tostr(sizeof(datamass) + basecell - 1)
 
 range = worksheet.exec(propertyget, range, rangetext)

 range.exec(propertyset, VerticalAlignment, -4108)
 range.exec(propertyset, HorizontalAlignment, -4108)

 var Line = range.Exec(PropertyGet, Borders, 11)
 Line.Exec(PropertySet, LineStyle, 1)
 Line.Exec(PropertySet, Weight, 2)
 Line = range.Exec(PropertyGet, Borders, 12)
 Line.Exec(PropertySet, LineStyle, 1)
 Line.Exec(PropertySet, Weight, 2)

 Line = range.Exec(PropertyGet, Borders, 7)
 Line.Exec(PropertySet, LineStyle, 1)
 Line.Exec(PropertySet, Weight, 2)
 Line = range.Exec(PropertyGet, Borders, 8)
 Line.Exec(PropertySet, LineStyle, 1)
 Line.Exec(PropertySet, Weight, 2)
 Line = range.Exec(PropertyGet, Borders, 9)
 Line.Exec(PropertySet, LineStyle, 1)
 Line.Exec(PropertySet, Weight, 2)
 Line = range.Exec(PropertyGet, Borders, 10)
 Line.Exec(PropertySet, LineStyle, 1)
 Line.Exec(PropertySet, Weight, 2)

 rangetext = "D" + Tostr(basecell - 2) + ":D"+tostr(sizeof(datamass) + basecell - 1)
 range = worksheet.exec(propertyget, range, rangetext)

 Line.Exec(PropertySet, Weight, 2)
}
}