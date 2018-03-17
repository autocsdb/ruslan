define function main()
{
doc.newfile()
var s = doc.oleobject()
s = s.propertyget(activesheet)
doc.out("Список актов на литературу, поступившую в библиотеку бесплатно или в порядке обмена", a1)
if(MonthMode == 1)
 doc.out("за " + month + " " + tostr(year) + " года", a2)
else
 doc.out("за " + quarter + " квартал " + tostr(year) + " года", a2)

var range = s.exec(propertyget, range, "a1:g1")
range.exec(Procedure, merge)

range = s.exec(propertyget, range, "a2:g2")
range.exec(Procedure, merge)

range = s.exec(propertyget, range, "e4:f4")
range.exec(Procedure, merge)

range = s.exec(propertyget, range, "a1:a1")
range.exec(propertyset, wraptext, 1)
range.exec(propertyset, HorizontalAlignment, -4108)
range.exec(propertyset, VerticalAlignment, -4108)

range = s.exec(propertyget, range, "a2:a2")
range.exec(propertyset, wraptext, 1)
range.exec(propertyset, HorizontalAlignment, -4108)
range.exec(propertyset, VerticalAlignment, -4108)


doc.out("№ п/п", a4)
doc.out("Название организации", b4)
doc.out("Кол-во", c4)
doc.out("Сумма", d4)
doc.out("В т.ч. взято на баланс", e4)
doc.out("Кол-во", e5)
doc.out("Сумма", f5)
doc.out("№ по КСУ", g4)
var sourcesize = sizeof(source)
var basecell = 6

var sortmass = newmass(0)
var datamass = newmass(0)

for(var i = 0; i < sourcesize; i = i + 1)
{
 if ((uppercase(grs(source[i], 26)) == "БЕСПЛАТНО")|(uppercase(grs(source[i], 26)) == "ПОДПИСКА"))
 {
  var d = grs(source[i], 22, "-1")
  if(tonumber(d) >= 0)
  {
   for(var j = 0; sizeof(d) < 5; j = j + 1)
   {
    d = "0" + d
   }
  }
  add(sortmass, d)
  add(datamass, source[i])
 }
}

sort(datamass, sortmass[%row%])
sourcesize = sizeof(datamass)
for(var i =0; i < sourcesize; i = i + 1)
{
 doc.out(tostr(i + 1), "a" + tostr(i + basecell))
 doc.out(grs(datamass[i], 19), "b" + tostr(i + basecell))
 doc.out(tostr(tonumber(grs(datamass[i], 27, "0")) + tonumber(grs(datamass[i], 40, "0"))), "c" + tostr(i + basecell))
 doc.out(tostr(tonumber(tostr(tonumber(grs(datamass[i], 28, "0")) + tonumber(grs(datamass[i], 41, "0"))))), "d" + tostr(i + basecell))
 doc.out(tostr(tonumber(grs(datamass[i], 27, "0"))), "e" + tostr(i + basecell))
 doc.out(tostr(tonumber(grs(datamass[i], 28, "0"))), "f" + tostr(i + basecell))
 doc.out(tostr(tonumber(grs(datamass[i], 22, "0"))), "g" + tostr(i + basecell))
}
var cols = s.exec(function, columns)
var col = cols.exec(propertyget, item, 1)
col.exec(propertyset, columnwidth, 5)

col = cols.exec(propertyget, item, 2)
col.exec(propertyset, columnwidth, 40)

col = cols.exec(propertyget, item, 3)
col.exec(propertyset, columnwidth, 5)

col = cols.exec(propertyget, item, 4)
col.exec(propertyset, columnwidth, 10)

col = cols.exec(propertyget, item, 5)
col.exec(propertyset, columnwidth, 6)

col = cols.exec(propertyget, item, 6)
col.exec(propertyset, columnwidth, 9)

col = cols.exec(propertyget, item, 7)
col.exec(propertyset, columnwidth, 5)

'range = s.exec(propertyget, range, "e3:f3")
'range.exec(Procedure, merge)

'range = s.exec(propertyget, range, "g3:h3")
'range.exec(Procedure, merge)

var lastcell = doc.getlast() + 1
var rangetext = "c4:g" + tostr(lastcell)
range = s.exec(propertyget, range, rangetext)
range.exec(propertyset, wraptext, 1)
range.exec(propertyset, HorizontalAlignment, -4108)
range.exec(propertyset, VerticalAlignment, -4108)

rangetext = "a4:a" + tostr(lastcell)
range = s.exec(propertyget, range, rangetext)
range.exec(propertyset, wraptext, 1)
range.exec(propertyset, HorizontalAlignment, -4108)
range.exec(propertyset, VerticalAlignment, -4108)


range = s.exec(propertyget, range, "a4:f5")
range.exec(propertyset, HorizontalAlignment, -4108)
range.exec(propertyset, VerticalAlignment, -4108)

rangetext = "a4:g" + tostr(lastcell)
range = s.exec(propertyget, range, rangetext)
var borders = range.exec(propertyget, borders)
borders.exec(propertyset, linestyle, 1)

doc.out("Итого:", "b" + tostr(lastcell))
doc.out("=sum(c6:c"+tostr(lastcell - 1) + ")", "c" + tostr(lastcell))
doc.out("=sum(d6:d"+tostr(lastcell - 1) + ")", "d" + tostr(lastcell))
doc.out("=sum(e6:e"+tostr(lastcell - 1) + ")", "e" + tostr(lastcell))
doc.out("=sum(f6:f"+tostr(lastcell - 1) + ")", "f" + tostr(lastcell))
}