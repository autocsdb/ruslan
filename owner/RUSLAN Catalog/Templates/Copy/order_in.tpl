define function main()
{
doc.clear()
var basecell = 2
var s = doc.oleobject()

doc.out("ЗАКАЗ / ORDER " + grs(GRSREC, 80), "A" + tostr(basecell))
var rangetext = "a" + tostr(basecell) + ":i" + tostr(basecell)
var range = s.exec(propertyget, range, rangetext)
range.exec(Procedure, merge)
range.exec(propertyset, wraptext, 1)
range.exec(propertyset, HorizontalAlignment, -4108)
range.exec(propertyset, VerticalAlignment, -4108)

basecell = basecell + 2
doc.out("Заказчик / Customer " + grs(GRSREC, 87), "A" + tostr(basecell))
rangetext = "a" + tostr(basecell) + ":i" + tostr(basecell)
range = s.exec(propertyget, range, rangetext)
range.exec(Procedure, merge)
range.exec(propertyset, wraptext, 1)

basecell = basecell + 1
doc.out("Получатель / Recipient ", "A" + tostr(basecell))
rangetext = "a" + tostr(basecell) + ":i" + tostr(basecell)
range = s.exec(propertyget, range, rangetext)
range.exec(Procedure, merge)
range.exec(propertyset, wraptext, 1)

basecell = basecell + 1
doc.out("Поставщик / Deliverer " + grs(GRSREC, 88), "A" + tostr(basecell))
rangetext = "a" + tostr(basecell) + ":i" + tostr(basecell)
range = s.exec(propertyget, range, rangetext)
range.exec(Procedure, merge)
range.exec(propertyset, wraptext, 1)

basecell = basecell + 1
doc.out("Дата заказа / Date of order " + grs(GRSREC, 81), "A" + tostr(basecell))
rangetext = "a" + tostr(basecell) + ":i" + tostr(basecell)
range = s.exec(propertyget, range, rangetext)
range.exec(Procedure, merge)
range.exec(propertyset, wraptext, 1)

basecell = basecell + 1
doc.out("Количество названий / Numbers of items ordered " + grs(GRSREC, 84), "A" + tostr(basecell))
rangetext = "a" + tostr(basecell) + ":i" + tostr(basecell)
range = s.exec(propertyget, range, rangetext)
range.exec(Procedure, merge)
range.exec(propertyset, wraptext, 1)

basecell = basecell + 1
doc.out("Сумма / Total sum " + grs(GRSREC, 85), "A" + tostr(basecell))
rangetext = "a" + tostr(basecell) + ":i" + tostr(basecell)
range = s.exec(propertyget, range, rangetext)
range.exec(Procedure, merge)
range.exec(propertyset, wraptext, 1)

basecell = basecell + 1
doc.out("Для сообщения / Notes " + grs(GRSREC, 89), "A" + tostr(basecell))

rangetext = "a" + tostr(basecell) + ":i" + tostr(basecell)
range = s.exec(propertyget, range, rangetext)
range.exec(Procedure, merge)
range.exec(propertyset, wraptext, 1)

basecell = basecell + 2

rangetext = "a" + tostr(basecell) + ":g" + tostr(basecell)
range = s.exec(propertyget, range, rangetext)
range.exec(Procedure, merge)
range.exec(propertyset, wraptext, 1)

doc.out("Автор и название", "A" + tostr(basecell))
doc.out("Кол-во", "H" + tostr(basecell))
doc.out("Сумма", "I" + tostr(basecell))
doc.drawborder("a" + tostr(basecell) + ":g" + tostr(basecell))
doc.drawborder("h" + tostr(basecell) + ":h" + tostr(basecell))
doc.drawborder("i" + tostr(basecell) + ":i" + tostr(basecell))

basecell = basecell + 1
var startcell = basecell

var begincell = basecell
var sourcesize = sizeof(SOURCE)
for(var i = 0; i < sourcesize; i = i + 1)
{
 rangetext = "a" + tostr(basecell) + ":g" + tostr(basecell)
 range = s.exec(propertyget, range, rangetext)
 range.exec(Procedure, merge)
 range.exec(propertyset, wraptext, 1)

 doc.drawborder("a" + tostr(basecell) + ":g" + tostr(basecell))
 doc.drawborder("h" + tostr(basecell) + ":h" + tostr(basecell))
 doc.drawborder("i" + tostr(basecell) + ":i" + tostr(basecell))

 var outstring = tostr(i + 1) + ". "
 if(marcexist(source[i], 461))
 {
  outstring = outstring + marc(source[i], 461, 0, 700, 0, ($a?$a($b?" "$b)". ")
  for(var j = 0; j < marccount(source[i], 461, 0, 200, 0, $a); j = j +1)
   outstring = outstring + marc(source[i], 461, 0, 200, 0, $a[j]"; ")
 }
 else
 {
  outstring = outstring + marc(source[i], 700, 0, ($a?$a($b?" "$b)". "))
  for(var j = 0; j < marccount(source[i], 200, 0, $a); j = j +1)
   outstring = outstring + marc(source[i], 200, 0, $a[j]"; ")
 }
 outstring = outstring + marc(source[i], 210, 0, ($a|$c|$d?".-")($a?$a": ")($c?$c", ")($d?$d))
 doc.out(outstring, "A" + tostr(basecell))
 doc.out(marc(source[i], 10, 0, ($a?$a)($b?" "$b)), "h" + tostr(basecell))

 for(var j = 0; j < source[i].count(959); j = j + 1)
 {
  if(startwith(source[i].value(959, j, $a), grs(GRSREC, 80) + "/"))
  {
   doc.out(source[i].value(959, j, $d), "H" + tostr(basecell))
   doc.out("= H" + tostr(basecell) + " * " + tostr(tonumber(source[i].value(959, j, $e))), "I" + tostr(basecell))
   break
  }
 }
 
 rangetext = "a" + tostr(basecell) + ":g" + tostr(basecell)
 range = s.exec(propertyget, range, rangetext)
 range.exec(Procedure, merge)
 range.exec(propertyset, wraptext, 1)
 
 basecell = basecell + 1
}
doc.out("Итого:", "a" + tostr(basecell))
doc.out("=sum(H" + tostr(startcell) + ":H" + tostr(basecell - 1), "H" + tostr(basecell))
doc.out("=sum(I" + tostr(startcell) + ":I" + tostr(basecell - 1), "I" + tostr(basecell))

rangetext = "H" + tostr(startcell) + ":H" + tostr(basecell - 1)
range = s.exec(propertyget, range, rangetext)
var rows = range.exec(propertyget, rows)
rows.exec(propertyset, rowheight, 25)
}