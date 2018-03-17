define function main()
{
doc.newfile()
if(MonthMode == 1)
 doc.out("ОТЧЕТ НТБ ТПУ по приходу литературы за " + month + " " + tostr(year) + " года", a1)
else
 doc.out("ОТЧЕТ НТБ ТПУ по приходу литературы за " + quarter + " квартал " + tostr(year) + " года", a1)

doc.out("№ п/п", a3)
doc.out("Источник комплектования", b3)
doc.out("№ акта", c3)
doc.out("Общая сумма", d3)
doc.out("На баланс", e3)
doc.out("Вне баланса", g3)
doc.out("Прочие расходы", i3)
var sourcesize = sizeof(source)
var basecell = 4
var s = doc.oleobject()
for(var i =0; i < sourcesize; i = i + 1)
{
 doc.out(tostr(i + 1), "a" + tostr(i + basecell))
 doc.out(grs(source[i], 19), "b" + tostr(i + basecell))
 doc.out(tostr(tonumber(grs(source[i], 22, "0"))), "c" + tostr(i + basecell))
 doc.out(tostr(tonumber(tostr(tonumber(grs(source[i], 28)) + tonumber(grs(source[i], 41))))), "d" + tostr(i + basecell))
 doc.out(tostr(tonumber(grs(source[i], 27, "0"))), "e" + tostr(i + basecell))
 doc.out(tostr(tonumber(grs(source[i], 28, "0"))), "f" + tostr(i + basecell))
 doc.out(tostr(tonumber(grs(source[i], 40, "0"))), "g" + tostr(i + basecell))
 doc.out(tostr(tonumber(grs(source[i], 41, "0"))), "h" + tostr(i + basecell))
 doc.out(tostr(tonumber(grs(source[i], 42, "0"))), "i" + tostr(i + basecell))
}
var cols = s.exec(function, columns)
var col = cols.exec(propertyget, item, 1)
col.exec(propertyset, columnwidth, 5)

col = cols.exec(propertyget, item, 2)
col.exec(propertyset, columnwidth, 20)

col = cols.exec(propertyget, item, 3)
col.exec(propertyset, columnwidth, 5)

col = cols.exec(propertyget, item, 4)
col.exec(propertyset, columnwidth, 10)

col = cols.exec(propertyget, item, 5)
col.exec(propertyset, columnwidth, 5)

col = cols.exec(propertyget, item, 6)
col.exec(propertyset, columnwidth, 10)

col = cols.exec(propertyget, item, 7)
col.exec(propertyset, columnwidth, 5)

col = cols.exec(propertyget, item, 8)
col.exec(propertyset, columnwidth, 10)

col = cols.exec(propertyget, item, 9)
col.exec(propertyset, columnwidth, 10)

var range = s.exec(propertyget, range, "a1:i1")
range.exec(Procedure, merge)
range.exec(propertyset, wraptext, 1)
range.exec(propertyset, HorizontalAlignment, -4108)
range.exec(propertyset, VerticalAlignment, -4108)

range = s.exec(propertyget, range, "e3:f3")
range.exec(Procedure, merge)

range = s.exec(propertyget, range, "g3:h3")
range.exec(Procedure, merge)

var lastcell = doc.getlast() + 1
var rangetext = "a2:i" + tostr(lastcell)
range = s.exec(propertyget, range, rangetext)
range.exec(propertyset, wraptext, 1)
range.exec(propertyset, HorizontalAlignment, -4108)
range.exec(propertyset, VerticalAlignment, -4108)

rangetext = "a3:i" + tostr(lastcell)
range = s.exec(propertyget, range, rangetext)
var borders = range.exec(propertyget, borders)
borders.exec(propertyset, linestyle, 1)

doc.out("Итого:", "b" + tostr(lastcell))
doc.out("=sum(d4:d"+tostr(lastcell - 1) + ")", "d" + tostr(lastcell))
doc.out("=sum(e4:e"+tostr(lastcell - 1) + ")", "e" + tostr(lastcell))
doc.out("=sum(f4:f"+tostr(lastcell - 1) + ")", "f" + tostr(lastcell))
doc.out("=sum(g4:g"+tostr(lastcell - 1) + ")", "g" + tostr(lastcell))
doc.out("=sum(h4:h"+tostr(lastcell - 1) + ")", "h" + tostr(lastcell))
doc.out("=sum(i4:i"+tostr(lastcell - 1) + ")", "i" + tostr(lastcell))

rangetext = "a" + tostr(lastcell) + ":c" + tostr(lastcell)
range = s.exec(propertyget, range, rangetext)
range.exec(Procedure, merge)
range.exec(propertyset, HorizontalAlignment, -4130)

rangetext = "a" + tostr(lastcell + 2) + ":g" + tostr(lastcell + 2)
range = s.exec(propertyget, range, rangetext)
range.exec(Procedure, merge)
range.exec(propertyset, HorizontalAlignment, -4130)
range.exec(propertyset, VerticalAlignment, -4108)
doc.out("Сдал:", "a" + tostr(lastcell + 2))

rangetext = "a" + tostr(lastcell + 4) + ":g" + tostr(lastcell + 4)
range = s.exec(propertyget, range, rangetext)
range.exec(Procedure, merge)
range.exec(propertyset, HorizontalAlignment, -4130)
range.exec(propertyset, VerticalAlignment, -4108)
doc.out("Принял:", "a" + tostr(lastcell + 4))

rangetext = "a" + tostr(lastcell + 6) + ":h" + tostr(lastcell + 6)
range = s.exec(propertyget, range, rangetext)
range.exec(Procedure, merge)
range.exec(propertyset, HorizontalAlignment, -4130)
range.exec(propertyset, VerticalAlignment, -4108)
doc.out(Date, "a" + tostr(lastcell + 6))

}