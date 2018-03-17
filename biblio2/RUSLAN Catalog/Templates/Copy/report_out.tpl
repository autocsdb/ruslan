define function main()
{
doc.newfile()
doc.out("ОТЧЕТ НТБ ТПУ", a1)
doc.out("по списанию литературы из фондов НТБ", a2)
if(MonthMode == 1)
 doc.out("за " + month + " " + tostr(year) + " года", a3)
else
 doc.out("за " + quarter + " квартал " + tostr(year) + " года", a3)
doc.out("№ акта", a5)
doc.out("Причина списания", b5)
doc.out("Фонд", c5)
doc.out("Общая сумма", d5)
doc.out("Количество экземпляров, шт.", e5)
var sourcesize = sizeof(source)
var basecell = 6
var s = doc.oleobject()
for(var i =0; i < sourcesize; i = i + 1)
{
 doc.out(grs(source[i], 34, "0"), "a" + tostr(i + basecell))
 doc.out(grs(source[i], 36), "b" + tostr(i + basecell))
 doc.out(grs(source[i], 37), "c" + tostr(i + basecell))
 doc.out(tostr(tonumber(grs(source[i], 39, "0"))), "d" + tostr(i + basecell))
 doc.out(tostr(tonumber(grs(source[i], 38, "0"))), "e" + tostr(i + basecell))
}
var cols = s.exec(function, columns)
var col = cols.exec(propertyget, item, 1)
col.exec(propertyset, columnwidth, 10)

col = cols.exec(propertyget, item, 2)
col.exec(propertyset, columnwidth, 25)

col = cols.exec(propertyget, item, 3)
col.exec(propertyset, columnwidth, 10)

col = cols.exec(propertyget, item, 4)
col.exec(propertyset, columnwidth, 15)

col = cols.exec(propertyget, item, 5)
col.exec(propertyset, columnwidth, 10)

var range = s.exec(propertyget, range, "a1:e1")
range.exec(Procedure, merge)
range.exec(propertyset, wraptext, 1)
range.exec(propertyset, HorizontalAlignment, -4108)
range.exec(propertyset, VerticalAlignment, -4108)

range = s.exec(propertyget, range, "a2:e2")
range.exec(Procedure, merge)
range.exec(propertyset, wraptext, 1)
range.exec(propertyset, HorizontalAlignment, -4108)
range.exec(propertyset, VerticalAlignment, -4108)

range = s.exec(propertyget, range, "a3:e3")
range.exec(Procedure, merge)
range.exec(propertyset, wraptext, 1)
range.exec(propertyset, HorizontalAlignment, -4108)
range.exec(propertyset, VerticalAlignment, -4108)

var lastcell = doc.getlast() + 1
var rangetext = "a2:e" + tostr(lastcell)
range = s.exec(propertyget, range, rangetext)
range.exec(propertyset, wraptext, 1)
range.exec(propertyset, HorizontalAlignment, -4108)
range.exec(propertyset, VerticalAlignment, -4108)

rangetext = "a5:e" + tostr(lastcell)
range = s.exec(propertyget, range, rangetext)
var borders = range.exec(propertyget, borders)
borders.exec(propertyset, linestyle, 1)

doc.out("Итого:", "b" + tostr(lastcell))
doc.out("=sum(d4:d"+tostr(lastcell - 1) + ")", "d" + tostr(lastcell))
doc.out("=sum(e4:e"+tostr(lastcell - 1) + ")", "e" + tostr(lastcell))

doc.out("Сдал зав.отделом комплектования НТБ:", "a" + tostr(lastcell + 2)) 
doc.out("А.М.Щукина", "d" + tostr(lastcell + 2)) 
doc.out("Принял бухгалтер ТПУ:", "a" + tostr(lastcell + 3)) 
doc.out("Т.А.Алехина", "d" + tostr(lastcell + 3)) 
}