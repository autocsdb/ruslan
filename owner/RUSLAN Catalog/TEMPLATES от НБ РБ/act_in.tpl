define function main()
{
doc.clear()
var s  = doc.oleobject()
s = s.propertyget(activesheet)
doc.out("АКТ № " + grs(grsrec, 22, "______"), "A2")

var actdate = Grs(grsrec, 23, "________")
var actyear = substring(actdate, symbol, 1, 4)
var actmonth = substring(actdate, symbol, 5, 2)
if(actmonth == 01)
 actmonth = "января"	
if(actmonth == 02)
 actmonth = "февраля"	
if(actmonth == 03)
 actmonth = "марта"	
if(actmonth == 04)
 actmonth = "апреля"	
if(actmonth == 05)
 actmonth = "мая"	
if(actmonth == 06)
 actmonth = "июня"	
if(actmonth == 07)
 actmonth = "июля"	
if(actmonth == 08)
 actmonth = "августа"	
if(actmonth == 09)
 actmonth = "сентября"	
if(actmonth == 10)
 actmonth = "октября"	
if(actmonth == 11)
 actmonth = "ноября"	
if(actmonth == 12)
 actmonth = "декабря"	
var actday = substring(actdate, symbol, 7, 2)

actdate = "\"" + actday + "\" " + actmonth + " " + actyear + " г."

doc.out(actdate + " составлен_________________________________________________________", "A4")
doc.out("директором НТБ, __________________________________________________________зав.отделом", "A5")
doc.out("комплектования, __________________________________________зав.сектором учета литературы", "A6")
doc.out("_________________________настоящий акт о приеме в Научно-техническую библиотеку Томского", "A7")
doc.out("политехнического университета литературы, полученный от_________________________________", "A8")
doc.out("____________________________________________________________________________________", "A9")
doc.out("____________________________________________________________________________________", "A10")
doc.out("в количестве " + tostr(tonumber(grs(grsrec, 27, "0")) + tonumber(grs(grsrec, 40, "0"))) + " экз. на сумму " + tostr(tonumber(grs(grsrec, 28, "0")) + tonumber(grs(grsrec, 41, "0"))) + " руб.", "A11")


doc.out("Запись в книге суммарного учета:", "A14")
doc.out("№" + grs(grsrec, 22) + " от " + actdate, "A15")

doc.out("Количество экз. "+ grs(grsrec, 27) + " на " + grs(grsrec, 28) + " руб.", "A18")
doc.out("Записано в инвентарь под №№", "A20")


var resultstring = ""
var Res = BILLSPSTU(Source, ToStr(BillNumb) + "/" + ToStr(Billdate), 999, $e, $b, $p, $v, $u, 30)
for(var i = 0; i < Sizeof(Res);i = i + 1)
{
 var CurDep = Res[i]
 resultstring = resultstring + " " + CurDep[1]
}
doc.out(resultstring, "b20")

doc.out("____________________________________________________________________________________", "A22")
doc.out("На баланс НТБ не ставить " + grs(grsrec, 40, "0") + " экз. на сумму " + grs(grsrec, 41, "0") + " руб.", "A24")
doc.out("____________________________________________________________________________________", "A25")
doc.out("___________________________________________", "A27")
doc.out("___________________________________________", "A29")
doc.out("Директор НТБ:", "A32")
doc.out("Зав.отделом комплектования:", "A34")
doc.out("Зав.сектором учета", "A36")

var cols = s.exec(function, columns)
var col = cols.exec(propertyget, item, 1)
col.exec(propertyset, columnwidth, 35)

col = cols.exec(propertyget, item, 2)
col.exec(propertyset, columnwidth, 50)

var range = s.exec(propertyget, range, "a2:b2")
range.exec(Procedure, merge)
range.exec(propertyset, VerticalAlignment, -4108)
range.exec(propertyset, HorizontalAlignment, -4108)

for(var i = 3; i < 12; i = i +1)
{
 var rangetext = "a" + tostr(i) + ":b" + tostr(i)
 range = s.exec(propertyget, range, rangetext)
 range.exec(Procedure, merge)
 range.exec(propertyset, VerticalAlignment, -4108)
}

for(var i = 12; i < 20; i = i +1)
{
 var rangetext = "a" + tostr(i) + ":b" + tostr(i)
 range = s.exec(propertyget, range, rangetext)
 range.exec(Procedure, merge)
 range.exec(propertyset, VerticalAlignment, -4108)
 range.exec(propertyset, HorizontalAlignment, -4108)
}


range = s.exec(propertyget, range, "a20:b20")
range.exec(propertyset, wraptext, 1)
range.exec(propertyset, VerticalAlignment, -4160)

for(var i = 21; i < 40; i = i +1)
{
 var rangetext = "a" + tostr(i) + ":b" + tostr(i)
 range = s.exec(propertyget, range, rangetext)
 range.exec(Procedure, merge)
 range.exec(propertyset, VerticalAlignment, -4108)
}

}