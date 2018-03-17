define function main()
{
doc.clear()
var s  = doc.oleobject()
s = s.propertyget(activesheet)
var payers = loadfromfile("payers.txt")
var payerstring = "ПЛАТЕЛЬЩИК: " + Payer
var payersstart = 0
var payersend = 0

for(var i = 0; i < sizeof(payers); i = i + 1)
{
 if(trim(payers[i]) == payerstring)
 {
  payersstart = i 	
  payersend = sizeof(payers)
  for(var j = i + 1; j < sizeof(payers); j = j + 1)
  {
   if(startwith(payers[j], "ПЛАТЕЛЬЩИК:"))
   {
    payersend = j
    break
   }
  }
  break
 }
}

doc.out("ЗАЯВКА № " + grs(grsrec, 62, "______"), "A2")
doc.out("от Санкт-Петербургского государственного технического университета", "A3")
doc.out("по подписке на газеты и журналы по безналичному расчету", "A4")

var actdate = Grs(grsrec, 72, "________")
var actstartyear = substring(actdate, symbol, 1, 4)
var actmonth = substring(actdate, symbol, 5, 2)
if(actmonth == "01")
 actmonth = "января"	
if(actmonth == "02")
 actmonth = "февраля"	
if(actmonth == "03")
 actmonth = "марта"	
if(actmonth == "04")
 actmonth = "апреля"	
if(actmonth == "05")
 actmonth = "мая"	
if(actmonth == "06")
 actmonth = "июня"	
if(actmonth == "07")
 actmonth = "июля"	
if(actmonth == "08")
 actmonth = "августа"	
if(actmonth == "09")
 actmonth = "сентября"	
if(actmonth == "10")
 actmonth = "октября"	
if(actmonth == "11")
 actmonth = "ноября"	
if(actmonth == "12")
 actmonth = "декабря"	

if(sizeof(actmonth) == 2)
 actmonth = "________"
var actday = substring(actdate, symbol, 7, 2)

var actstartdate = "\"" + actday + "\" " + actmonth

actdate = Grs(grsrec, 73, "________")
var actendyear = substring(actdate, symbol, 1, 4)
actmonth = substring(actdate, symbol, 5, 2)
if(actmonth == "01")
 actmonth = "января"	
if(actmonth == "02")
 actmonth = "февраля"	
if(actmonth == "03")
 actmonth = "марта"	
if(actmonth == "04")
 actmonth = "апреля"	
if(actmonth == "05")
 actmonth = "мая"	
if(actmonth == "06")
 actmonth = "июня"	
if(actmonth == "07")
 actmonth = "июля"	
if(actmonth == "08")
 actmonth = "августа"	
if(actmonth == "09")
 actmonth = "сентября"	
if(actmonth == "10")
 actmonth = "октября"	
if(actmonth == "11")
 actmonth = "ноября"	
if(actmonth == "12")
 actmonth = "декабря"	
if(sizeof(actmonth) == 2)
 actmonth = "________"

actday = substring(actdate, symbol, 7, 2)

var actenddate = "\"" + actday + "\" " + actmonth

if(actstartyear == actendyear)
{
 doc.out("c " + actstartdate + " по " + actenddate + " " + actendyear + " г.", "A5")
}
else
{
 doc.out("c " + actstartdate + " " + actstartyear + " г." + " по " + actenddate + " " + actendyear + " г.", "A5")
}
var zak = newmass(2)
zak[0] = "С доставкой"
zak[1] = "До востребования"
var zaktype = userselect(zak)
if(zaktype == 1)
{
 doc.out("ЗАКАЗЧИК: Фундаментальная библиотека СПбГТУ.", "A6")
 doc.out("АДРЕС ДОСТАВКИ: 195251, Санкт-Петербург, до востребования.", "A7")
 doc.out("Фундаментальная библиотека СПбГТУ.", "A8")
 doc.out("Телефон: 552-76-47", "A9")
}
else
{
 if(zaktype == 0)
 {
  doc.out("ЗАКАЗЧИК: Фундаментальная библиотека СПбГТУ.", "A6")
  doc.out("АДРЕС ДОСТАВКИ: 195251, Санкт-Петербург, Политехническая ул., до.29.", "A7")
  doc.out("Фундаментальная библиотека СПбГТУ, отдел комплектования.", "A8")
  doc.out("Телефон: 552-76-47", "A9")
 }
}

var currow = 10

for(var i = payersstart; i < payersend; i = i + 1)
{
 currow = currow + 1
 doc.out(payers[i], "A" + tostr(currow))
}

for(var i = 7; i < currow + 1; i = i +1)
{
 var rangetext = "a" + tostr(i) + ":g" + tostr(i)
 var range = s.exec(propertyget, range, rangetext)
 range.exec(Procedure, merge)
 range.exec(propertyset, VerticalAlignment, -4108)
 range.exec(propertyset, wraptext, 1)
}


currow = currow + 2
doc.out("Перечень выписанных изданий", "A" + tostr(currow))


for(var i = currow; i < currow + 2; i = i +1)
{
 var rangetext = "a" + tostr(i) + ":g" + tostr(i)
 var range = s.exec(propertyget, range, rangetext)
 range.exec(Procedure, merge)
 range.exec(propertyset, VerticalAlignment, -4108)
 range.exec(propertyset, wraptext, 1)
}
currow = currow + 2


doc.out("№ п/п", "A" + tostr(currow))
doc.out("Индекс", "B" + tostr(currow))
doc.out("Наименование", "C" + tostr(currow))
doc.out("Кол-во", "D" + tostr(currow))
doc.out("С", "E" + tostr(currow))
doc.out("По", "F" + tostr(currow))
doc.out("Сумма", "G" + tostr(currow))

var reqstring = grs(grsrec, 62) + "/" + grs(grsrec, 63)

currow = currow + 1

for(var i = 0; i < Sizeof(source);i = i + 1)
{
 doc.out(tostr(i + 1), "A" + tostr(currow + i))
 doc.out(marc(source[i], 969, 0, $a), "B" + tostr(currow + i))
 doc.out(marc(source[i], 200, 0, $a($h?"."$h)($i?"."$i)), "C" + tostr(currow + i))
 for(var j = 0; j < marccount(source[i], 979);j = j + 1)
 {
  if(marc(source[i], 979, j, $a) == reqstring)
  {
   doc.out(marc(source[i], 979, j, $d), "D" + tostr(currow + i))
   
   var actyear = substring(marc(source[i], 979, j, $b), symbol, 1, 4)
   var actmonth = substring(marc(source[i], 979, j, $b), symbol, 5, 2)
   var actday = substring(marc(source[i], 979, j, $b), symbol, 7, 2)
   
   doc.out(actday + "." + actmonth + "." + actyear, "E" + tostr(currow + i))

   actyear = substring(marc(source[i], 979, j, $c), symbol, 1, 4)
   actmonth = substring(marc(source[i], 979, j, $c), symbol, 5, 2)
   actday = substring(marc(source[i], 979, j, $c), symbol, 7, 2)
   doc.out(actday + "." + actmonth + "." + actyear, "F" + tostr(currow + i))
   doc.out("=D" + tostr(currow + i) + "*" +tostr(tonumber(marc(source[i], 979, j, $e))), "G" + tostr(currow + i))
   break
  }
 }
}

for(var i = 1; i < 7; i = i +1)
{
 var rangetext = "a" + tostr(i) + ":g" + tostr(i)
 var range = s.exec(propertyget, range, rangetext)
 range.exec(Procedure, merge)
 range.exec(propertyset, VerticalAlignment, -4108)
 range.exec(propertyset, HorizontalAlignment, -4108)
 range.exec(propertyset, wraptext, 1)
}

doc.out("Итого:", "A"+tostr(currow + Sizeof(source)))
doc.out("=SUM(D" + tostr(currow) + ":D"+tostr(currow - 1 + Sizeof(source))+")", "D"+tostr(currow + Sizeof(source)))
doc.out("=SUM(G" + tostr(currow) + ":G"+tostr(currow - 1 + Sizeof(source))+")", "G"+tostr(currow + Sizeof(source)))

var rangetext = "A" + tostr(currow - 1) + ":B" + tostr(currow + Sizeof(source))
var range = s.exec(propertyget, range, rangetext)

range.exec(propertyset, VerticalAlignment, -4108)
range.exec(propertyset, HorizontalAlignment, -4108)

rangetext = "D" + tostr(currow - 1) + ":F" + tostr(currow + Sizeof(source))
range = s.exec(propertyget, range, rangetext)

range.exec(propertyset, VerticalAlignment, -4108)
range.exec(propertyset, HorizontalAlignment, -4108)

rangetext = "G" + tostr(currow) + ":F" + tostr(currow + Sizeof(source))
range = s.exec(propertyget, range, rangetext)

range.exec(propertyset, Numberformat, "0,00")

rangetext = "A" + tostr(currow - 1) + ":G" + tostr(currow - 1 + Sizeof(source))
range = s.exec(propertyget, range, rangetext)

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

rangetext = "A" + tostr(currow)
range = s.exec(propertyget, range, rangetext)
var cols = range.exec(function, columns)
cols.exec(propertyset, columnwidth, 5)

rangetext = "B" + tostr(currow)
range = s.exec(propertyget, range, rangetext)
cols = range.exec(function, columns)
cols.exec(propertyset, columnwidth, 7)

rangetext = "C" + tostr(currow)
range = s.exec(propertyget, range, rangetext)
cols = range.exec(function, columns)
cols.exec(propertyset, columnwidth, 35)

rangetext = "D" + tostr(currow)
range = s.exec(propertyget, range, rangetext)
cols = range.exec(function, columns)
cols.exec(propertyset, columnwidth, 5)

rangetext = "E" + tostr(currow)
range = s.exec(propertyget, range, rangetext)
cols = range.exec(function, columns)
cols.exec(propertyset, columnwidth, 9)

rangetext = "G" + tostr(currow)
range = s.exec(propertyget, range, rangetext)
cols = range.exec(function, columns)
cols.exec(propertyset, columnwidth, 9)
}