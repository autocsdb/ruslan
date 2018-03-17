define function main()
{
var baseCell = 3
if(headerrequired == 0)
{
 if(doc.isempty() )
 {
  var s = messagebox("Файл книги не открыт. Создать новый?", "Формирование инвентарной книги", 4132)
  if(s == 6)
   doc.newfile("docs\invtemplates\invbook.xls")
  else
   return
 }

 baseCell = doc.getlast() + 1
 var i
 var Sourcesize = sizeof(source)

 var k
 var j
 var nummas = newmass(0)
 var billmas = newmass(0)
 var recmas = newmass(0)
 var record
 var number
 var k2
 var s = doc.oleobject()
 s = s.propertyget(activesheet)
 var cardonpage = 0
 for(i = 0; i < Sourcesize; i = i + 1)
 {
  status(0.66 + i/(3 * Sourcesize))	

'-------Вывод всех инвентарных номеров------------------------------------------
  k = marccount(source[i], 999)
  for(j = 0; j < k ; j = j + 1)
  { 
   var curnumb = uppercase(marc(source[i], 999, j, $p))
   prefix = uppercase(prefix)
   if(!startwith(curnumb,prefix))
    continue
   curnumb = substring(curnumb, symbol, sizeof(prefix) + 1, -1)
   var end = substring(curnumb, symbol, sizeof(curnumb) - sizeof(postfix) + 1, -1)
   if(end != postfix)
    continue
 
   var main = curnumb
'   var main = substring(curnumb, symbol, 1, sizeof(curnumb) - sizeof(postfix))

   if((sizeof(prefix) == 0) & (!isdigit(substring(main, symbol, 1, 1))))
    continue

   if((!isdigit(main)) | ((sizeof(startbody) != sizeof(main)) | (startbody >= main) | ((sizeof(endbody) > 0) & (endbody < main))))
    continue

  number = marc(source[i], 999, j, $p)

  record = newmass(0)
'------------в запись добавляем дату-------------------------
add(record, marc(source[i], 999, j, $e))
   add(record, marc(source[i], 999, j, $d))
   add(record, marc(source[i], 999, j, $p))

'------составляем строку автор + заглавие--------------------
   var mainstring = ""
   if(marcexist(source[i], 461, 0))
   {
    mainstring = marc(source[i], 461, 0, 700, 0, ($a?$a($b?" "$b)))   
    if(!marcexist(source[i], 461, 0, 700))
    mainstring = marc(source[i], 461, 0, 710, 0, ($a?$a($b?" "$b)))   
 
    var count200= source[i].count(461, 0, 200, 0, $a)
    var заглавие = ""
    for(var i = 0; i < count200 - 1; i = i +1 )
     заглавие  =  заглавие + marc(source[i], 461, 0, 200, 0, ($a[i]?$a[i]"; "))
    заглавие  =  заглавие + marc(source[i], 461, 0, 200, 0, ($a[count200 - 1]?$a[count200 - 1]" "))
    if(sizeof(mainstring) != 0)
     mainstring = mainstring + ", " + заглавие
    else
     mainstring = заглавие
   }
   else
   {
    mainstring = marc(source[i], 700, 0, ($a?$a($b?" "$b)))   
    if(!marcexist(source[i], 700))
     mainstring = marc(source[i], 710, 0, ($a?$a($b?" "$b)))   

    var count200= source[i].count(200, 0, $a)
    var заглавие = ""
    for(var i = 0; i < count200 - 1; i = i +1 )
     заглавие  =  заглавие + marc(source[i], 200, 0, ($a[i]?$a[i]"; "))
    заглавие  =  заглавие + marc(source[i], 200, 0, ($a[count200 - 1]?$a[count200 - 1]" "))
    if(sizeof(mainstring) != 0)
     mainstring = mainstring + ", " + заглавие
    else
     mainstring = заглавие
   }
'----------------------------------------------------------------------------
   mainstring = substring(mainstring, symbol, 1, 40)
   if(source[i].exist(461))
    mainstring = mainstring + " " + source[i].value(461, 0, 200, 0, $v)

   if(Marcexist(source[i],106,0) | (SubString(marc(source[i],126,0,$a), symbol, 1, 1) == "b") | (SubString(marc(source[i],126,0,$a), symbol, 1, 1) == "c"))
   {
    var kol = source[i].value(215, 0, $a)
    var kolpos = pos(kol, "(")
    if(kolpos > 0)
     mainstring = mainstring + " (" + substring(source[i].value(215, 0, $a), symbol, 0, kolpos - 1)) + ")"
    else
     mainstring = mainstring + " (" + source[i].value(215, 0, $a) + ")"
   }


'   if(sizeof(mainstring) > 60)
'    add(record, substring(mainstring, symbol, 0, 60) + "...")
'   else
'изменено
   add(record, mainstring)
   if(marcexist(source[i], 461, 0))
   {
    var date = substring(marc(source[i], 461, 0, 210, 0, $a[0]), symbol, 1, 10)
    if(source[i].exist(210, 0, $d))
     date = date + ", " + substring(marc(source[i], 210, 0, $d[0]), symbol, 1, 5)
    else
     date = date + ", " + substring(marc(source[i], 461, 0, 210, 0, $d[0]), symbol, 1, 5)
    add(record, date)
   }
   else
   {
    var date = substring(marc(source[i], 210, 0, $a[0]), symbol, 1, 10)
    if(source[i].exist(210, 0, $d))
     date = date + ", " + substring(marc(source[i], 210, 0, $d[0]), symbol, 1, 5)
    else
     date = date + ", " + substring(marc(source[i], 461, 0, 210, 0, $d[0]), symbol, 1, 5)
    add(record, date)
   }
'   add(record, marc(source[i], 999, j, $v))
   add(record, marc(source[i], 999, j, $u))
   add(record, substring(marc(source[i], 999, j, $h), symbol, 1, 6))
   add(recmas, record)
   add(nummas, marc(source[i], 999, j, $p))
   add(billmas, marc(source[i], 999, j, $e))
  }	  
 }
 var lastbillnumb
 if(sizeof(recmas) > 0)
 {
  sort(recmas, nummas[%row%])
  Sourcesize = sizeof(nummas)

  for(i = 0; i < Sourcesize; i = i + 1)
  {
   status(0.66 + i/(3 * Sourcesize))	

   record = recmas[i]

   var bd = record[0]
   var bill = ""
   var date = ""
   var splpos = pos(bd, "/")
if(splpos > 0)
   {
    bill = substring(bd, symbol, 1, splpos - 1)
    bd = substring(bd, symbol, splpos + 1, -1)
    date = substring(bd, symbol, 7, 2) + "." + substring(bd, symbol, 5, 2) + "." + substring(bd, symbol, 1, 4)
   }
   else
    bill = bd
  
   doc.out(bill + "/" + date, "A" + ToStr(i + baseCell))
   number = record[2]
   doc.out(number, "b" + ToStr(i + baseCell))
   doc.out(record[3], "c" + ToStr(i + baseCell))
   doc.out(record[4], "d" + ToStr(i + baseCell))
   doc.out(record[5], "e" + ToStr(i + baseCell))
 
'   var curstr = record[7]
'   var curstrpos = pos(curstr, ",")
'   if(curstrpos != 0)
'   curstr = substring(curstr, symbol, 0, curstrpos - 1) + "." + substring(curstr, symbol, curstrpos + 1, -1)
'   doc.out(curstr, "f" + ToStr(i + baseCell))
'   doc.out(bill, "g" + ToStr(i + baseCell))
'   doc.out(record[8], "h" + ToStr(i + baseCell))
    doc.drawborder("A" + ToStr(i + baseCell) + ":H" + ToStr(i + baseCell), 1, 1) 
   if(cardonpage > 24)
   {
    var rangetext = "A" + ToStr(i + baseCell)
    var range = s.sexec(propertyget, range, rangetext)
    var HPageBreaks = s.sexec(propertyget, HPageBreaks)
    HPageBreaks.sexec(procedure, add, range)
    cardonpage = 0
   }
   else
    cardonpage = cardonpage + 1

  }
  doc.drawborder("A" + ToStr(baseCell - 2) + ":H" + ToStr(i + baseCell - 1)) 
  if(i > 0)
  {
   doc.drawborder("B" + ToStr(baseCell - 2) + ":B" + Tostr(i + baseCell - 1)) 
   doc.drawborder("D" + ToStr(baseCell - 2) + ":D" + Tostr(i + baseCell - 1)) 
   doc.drawborder("F" + ToStr(baseCell - 2) + ":F" + Tostr(i + baseCell - 1)) 
   doc.drawborder("H" + ToStr(baseCell - 2) + ":H" + Tostr(i + baseCell - 1)) 
}
 }
}else
{
 doc.clear()
 var i
 var Sourcesize = sizeof(source)
 var k
 var j
 var nummas = newmass(0)
 var billmas = newmass(0)
 var recmas = newmass(0)
 var record
 var number
 var k2
 var s = doc.oleobject()
 s = s.propertyget(activesheet)
 for(i = 0; i < Sourcesize; i = i + 1)
 {
  k = marccount(source[i], 999)
  for(j = 0; j < k ; j = j + 1)
  {
   if(Param1 != "Все")
   {
    if(Param1 != marc(source[i], 999, j, $h))	
     continue
   }
   if((Param2 != "Все") & (Param2 != "Неформатная"))
   {	
    number = marc(source[i], 999, j, $p)
    k2 = sizeof(number)
    if((k2 != 7) | (Param2 != number[k2 - 1]) | startwith(number, "Б"))
     continue
   } 
   if(Param2 == "Неформатная")
   {	
    number = marc(source[i], 999, j, $p)
    k2 = sizeof(number)
    if((k2 >= 7) & (!startwith(number, "Б/У")))
     continue
   } 
   if(EndBillNumb == 0)
    EndBillNumb = StartBillNumb  
 
   number = marc(source[i], 999, j, $e)   

   var numberpos = pos(number, "/")
   var syear = substring(number, SYMBOL, numberpos + 1, 4)
   if(numberpos > 0)
    number = substring(number, SYMBOL, 0, numberpos - 1)
   if((StartBillNumb > ToNumber(number)) | (EndBillNumb < ToNumber(number)) | (syear != ToStr(BillDate)))
    continue 
   record = newmass(0)
   add(record, marc(source[i], 999, j, $e))
   add(record, marc(source[i], 999, j, $d))
   add(record, marc(source[i], 999, j, $p))
   var mainstring = ""
   if(marcexist(source[i], 461, 0))
   {
    mainstring = marc(source[i], 461, 0, 700, 0, ($a?$a($b?" "$b)))   
    if(!marcexist(source[i], 461, 0, 700))
     mainstring = marc(source[i], 461, 0, 710, 0, ($a?$a($b?" "$b)))   
    if(!marcexist(source[i], 461, 0, 710) & !marcexist(source[i], 461, 0, 700))
     mainstring = marc(source[i], 461, 0, 702, 0, ($a?$a($b?" "$b)))	
  
    if(marcexist(source[i], 461, 0, 710) | marcexist(source[i], 461, 0, 700) | marcexist(source[i], 461, 0, 702))
     mainstring = mainstring + ", " + marc(source[i], 461, 0, 200, 0, ($a?$a", ")) + marc(source[i], 200, 0, $a)	
    else
     mainstring = marc(source[i], 461, 0, 200, 0, ($a?$a", ")) + marc(source[i], 200, 0, $a)
   }

   if(!marcexist(source[i], 461, 0))
   {
    mainstring = marc(source[i], 700, 0, ($a?$a($b?" "$b)))   
    if(!marcexist(source[i], 700))
     mainstring = marc(source[i], 710, 0, ($a?$a($b?" "$b)))   
    if(!marcexist(source[i], 710) & !marcexist(source[i], 700))
     mainstring = marc(source[i], 702, 0, ($a?$a($b?" "$b)))	
    if(sizeof(mainstring) != 0)
     mainstring = mainstring + ", " + marc(source[i], 200, 0, $a)	
    if(sizeof(mainstring) == 0)
     mainstring = marc(source[i], 200, 0, $a)	
   }
   if(sizeof(mainstring) > 60)
    add(record, substring(mainstring, symbol, 0, 60) + "...")
   else
    add(record, mainstring)
   if(marcexist(source[i], 461, 0))
    add(record, marc(source[i], 461, 0, 210, 0, $a($d?", "$d)))
   else
    add(record, marc(source[i], 210, 0, $a))
   add(record, marc(source[i], 999, j, $v))
   add(record, marc(source[i], 999, j, $u))
   add(recmas, record)
   add(nummas, marc(source[i], 999, j, $p))
   add(billmas, marc(source[i], 999, j, $e))
  }	  
 }
 var lastbillnumb
 if(sizeof(recmas) > 0)
 {
  sort(recmas, billmas[%row%], nummas[%row%])
  Sourcesize = sizeof(nummas)

  for(i = 0; i < Sourcesize; i = i + 1)
  {
   record = recmas[i]
   doc.out(ToStr(record[0]), "A" + ToStr(i + baseCell))
   number = record[2]
   doc.out(number, "b" + ToStr(i + baseCell))
   doc.out(record[3], "c" + ToStr(i + baseCell))
   doc.out(record[4] + ", " + record[5], "d" + ToStr(i + baseCell))

   var curstr = record[7]
   var curstrpos = pos(curstr, ",")
   if(curstrpos != 0)
   curstr = substring(curstr, symbol, 0, curstrpos - 1) + "." + substring(curstr, symbol, curstrpos + 1, -1)
   doc.out(curstr, "e" + ToStr(i + baseCell))
   doc.drawborder("A" + ToStr(i + baseCell) + ":h" + ToStr(i + baseCell), 1, 1) 
  }
  doc.out("Итого:", "a" + ToStr(i + baseCell))
  doc.out("=count(e3:e" + tostr(i + baseCell - 1) + ")", "b" + ToStr(i + baseCell))
  doc.out("=sum(e3:e" + tostr(i + baseCell - 1) + ")", "e" + ToStr(i + baseCell))
  doc.drawborder("A" + ToStr(baseCell - 2) + ":h" + ToStr(i + baseCell - 1)) 
  if(i > 0)
  {
   doc.drawborder("B" + ToStr(baseCell - 2) + ":B" + Tostr(i + baseCell - 1)) 
   doc.drawborder("D" + ToStr(baseCell - 2) + ":D" + Tostr(i + baseCell - 1)) 
   doc.drawborder("F" + ToStr(baseCell - 2) + ":F" + Tostr(i + baseCell - 1)) 
   doc.drawborder("H" + ToStr(baseCell - 2) + ":H" + Tostr(i + baseCell - 1)) 
  }
 }
 doc.out("Номер записи в КСУФБ/Дата записи" ,"a1")
 doc.out("Инвентарный номер" ,"b1")
 doc.out("Автор, заглавие, том, часть, выпуск" ,"c1")
 doc.out("Место издания и год" ,"d1")
 doc.out("Цена" ,"e1")
 doc.out("Отметка о проверке" ,"f1")
 doc.out("№ акта выбытия" ,"g1")
 doc.out("Примечание" ,"h1")
 doc.out("1" ,"a2")
 doc.out("2" ,"b2")
 doc.out("3" ,"c2")
 doc.out("4" ,"d2")
 doc.out("5" ,"e2")
 doc.out("6" ,"f2")
 doc.out("7" ,"g2")
 doc.out("8" ,"h2")
 var cols = s.exec(function, columns)
'настройка ширины столбцов-------------------

 var col = cols.exec(propertyget, item, 1)
 col.exec(propertyset, columnwidth, 14)

 col = cols.exec(propertyget, item, 2)
 col.exec(propertyset, columnwidth, 9)
 
col = cols.exec(propertyget, item, 3)
 col.exec(propertyset, columnwidth, 27)

 col = cols.exec(propertyget, item, 4)
 col.exec(propertyset, columnwidth, 11)

 col = cols.exec(propertyget, item, 5)
 col.exec(propertyset, columnwidth, 7)

 col = cols.exec(propertyget, item, 6)
 col.exec(propertyset, columnwidth, 6)

 col = cols.exec(propertyget, item, 7)
 col.exec(propertyset, columnwidth, 5)

 col = cols.exec(propertyget, item, 7)
 col.exec(propertyset, columnwidth, 6)

 var range = s.exec(propertyget, range, "a1:h1")
 range.exec(propertyset, orientation, 90)
 range = s.exec(propertyget, range, "c1")
 range.exec(propertyset, orientation, 0)


 range = s.exec(propertyget, range, "a1:h2")
 range.exec(propertyset, wraptext, 1)
 range.exec(propertyset, HorizontalAlignment, -4108)
 range.exec(propertyset, VerticalAlignment, -4108)

 var rangetext = "b3:b" + Tostr(i + baseCell - 1)
 range = s.exec(propertyget, range, rangetext)
 range.exec(propertyset, HorizontalAlignment, -4108)

 var rows = s.exec(function, rows)
 var row = rows.exec(propertyget, item, 1)
 row.exec(propertyset, rowheight, 70)
 
}
}