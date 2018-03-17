define function main()
{
doc.clear()
var basecell = 2
var s = doc.oleobject()
s = s.propertyget(activesheet)
doc.out("ОТМЕНА ЗАКАЗА / CANCELLATION OF ORDER " + grs(GRSREC, 80), "A" + tostr(basecell))
var rangetext = "a" + tostr(basecell) + ":i" + tostr(basecell)
var range = s.exec(propertyget, range, rangetext)
range.exec(Procedure, merge)
range.exec(propertyset, wraptext, 1)
range.exec(propertyset, HorizontalAlignment, -4108)
range.exec(propertyset, VerticalAlignment, -4108)

basecell = basecell + 2
doc.out("Поставщик / Customer " + grs(GRSREC, 88), "A" + tostr(basecell))
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
doc.out("Заказчик / Customer " + grs(GRSREC, 87), "A" + tostr(basecell))
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

basecell = basecell + 1

rangetext = "a" + tostr(basecell) + ":i" + tostr(basecell)
range = s.exec(propertyget, range, rangetext)
range.exec(Procedure, merge)
range.exec(propertyset, wraptext, 1)

basecell = basecell + 2
var begincell = basecell
var sourcesize = sizeof(SOURCE)
for(var i = 0; i < sourcesize; i = i + 1)
{
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
 
 rangetext = "a" + tostr(basecell) + ":g" + tostr(basecell)
 range = s.exec(propertyget, range, rangetext)
 range.exec(Procedure, merge)
 range.exec(propertyset, wraptext, 1)
 
 basecell = basecell + 1
}
}