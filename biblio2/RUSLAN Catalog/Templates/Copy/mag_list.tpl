define function main()
{
doc.newfile()
var mag = newmass(0)
var magsort = newmass(0)

var news = newmass(0)
var newssort = newmass(0)
var sourcesize = sizeof(source)

'var flag = 0
for(var i = 0; i < sourcesize; i = i + 1)
{
 var record = newmass(5)
 record[0] = source[i].value(969, 0, $a)
 record[1] = source[i].value(200, 0, $a($h?". "$h)($i?". "$i))
 record[2] = ""
 record[3] = ""
 record[4] = ""
 for(var j = 0; j < source[i].count(979); j = j + 1)
 {
'  if(flag == 0)
'  {
'   if(messagebox("979, j, $b " + source[i].value(979, j, $b)  + " param1 " + param1 + " 979, j, $c " + source[i].value(979, j, $c) + " param2 " + param2, "", 1) == 1)
'    flag = 2
'  }
  if((source[i].value(979, j, $b) <= param1) & ((source[i].value(979, j, $c) >= param2) | ((sizeof(param2) == 0) & (source[i].value(979, j, $c) >= param1))))
  {
   record[2] = source[i].value(979, j, $d)
   record[3] = source[i].value(969, 0, $c)
   record[4] = source[i].value(979, j, $f)
   break
  }
 }
 if(source[i].value(969, 0, $e) == "1")
 {
  add(news, record)
  add(newssort, record[1])
 }
 else
 {
  add(mag, record)
  add(magsort, record[1])
 }
}

var basecell = 1

var newssize = sizeof(news)
var magsize = sizeof(mag)

if((magsize == 0) & (newssize == 0))
 return

var s = doc.oleobject()

var cols = s.exec(function, columns)
var col = cols.exec(propertyget, item, 1)
col.exec(propertyset, columnwidth, 8)
col.exec(propertyset, wraptext, 1)
col = cols.exec(propertyget, item, 2)
col.exec(propertyset, columnwidth, 55)
col.exec(propertyset, wraptext, 1)
col = cols.exec(propertyget, item, 3)
col.exec(propertyset, columnwidth, 4)
col.exec(propertyset, wraptext, 1)
col = cols.exec(propertyget, item, 4)
col.exec(propertyset, columnwidth, 4)
col.exec(propertyset, wraptext, 1)
col = cols.exec(propertyget, item, 5)
col.exec(propertyset, columnwidth, 12)
col.exec(propertyset, wraptext, 1)

var rangetext = "a" + tostr(basecell) + ":e" + tostr(basecell)
var range = s.exec(propertyget, range, rangetext)
range.exec(procedure, merge)
range.exec(propertyset, HorizontalAlignment, -4108)
doc.out("СПИСОК ГАЗЕТ И ЖУРНАЛОВ,", a + tostr(basecell))
var font = range.exec(propertyget, font)
font.exec(propertyset, bold, 1)
basecell = basecell + 1
rangetext = "a" + tostr(basecell) + ":e" + tostr(basecell)
range = s.exec(propertyget, range, rangetext)
range.exec(procedure, merge)
range.exec(propertyset, HorizontalAlignment, -4108)
doc.out("выписанных Фундаментальной библиотекой", a + tostr(basecell))
font = range.exec(propertyget, font)
font.exec(propertyset, bold, 1)
basecell = basecell + 1
rangetext = "a" + tostr(basecell) + ":e" + tostr(basecell)
range = s.exec(propertyget, range, rangetext)
range.exec(procedure, merge)

var year = substring(param1, symbol, 1, 4)
var month = substring(param1, symbol, 5, 2)
range.exec(propertyset, HorizontalAlignment, -4108)
if(month == "01")
 doc.out("на I полугодие " + year + "года", a + tostr(basecell))
else
 doc.out("на II полугодие " + year + "года", a + tostr(basecell))
font = range.exec(propertyget, font)
font.exec(propertyset, bold, 1)

basecell = basecell + 2

if(newssize > 0)
{

 rangetext = "a" + tostr(basecell) + ":e" + tostr(basecell)
 range = s.exec(propertyget, range, rangetext)
 range.exec(procedure, merge)
 range.exec(propertyset, HorizontalAlignment, -4108)
 doc.out("Газеты", a + tostr(basecell))
 font = range.exec(propertyget, font)
 font.exec(propertyset, bold, 1)
 font.exec(propertyset, underline, 2)
 basecell = basecell + 1
 
 sort(news, newssort[%ROW%])
 
 var startcell = basecell
 for(var i = 0; i < newssize; i = i + 1)
 {
  var record = news[i]
  doc.out(record[0], "a" + tostr(basecell))
  doc.out(record[1], "b" + tostr(basecell))
  doc.out(record[2], "c" + tostr(basecell))
  doc.out(record[4], "e" + tostr(basecell))
  basecell = basecell + 1
 }

 doc.out("Итого", "a" + tostr(basecell))
 doc.out("=rows(b" + tostr(startcell) + ":b" + tostr(basecell - 1) + ")", "b" + tostr(basecell))
 doc.out("=sum(c" + tostr(startcell) + ":c" + tostr(basecell - 1) + ")", "c" + tostr(basecell))

 basecell = basecell + 1

 rangetext = "A" + ToStr(baseCell)
 range = s.exec(propertyget, range, rangetext)
 var HPageBreaks = s.exec(propertyget, HPageBreaks)
 HPageBreaks.exec(procedure, add, range)
}


if(magsize > 0)
{

 rangetext = "a" + tostr(basecell) + ":e" + tostr(basecell)
 range = s.exec(propertyget, range, rangetext)
 range.exec(procedure, merge)
 range.exec(propertyset, HorizontalAlignment, -4108)
 doc.out("Журналы", a + tostr(basecell))
 font = range.exec(propertyget, font)
 font.exec(propertyset, bold, 1)
 font.exec(propertyset, underline, 2)
 basecell = basecell + 1

 sort(mag, magsort[%ROW%])
 var startcell = basecell
 for(var i = 0; i < magsize; i = i + 1)
 {
  var record = mag[i]
  doc.out(record[0], "a" + tostr(basecell))
  doc.out(record[1], "b" + tostr(basecell))
  doc.out(record[2], "c" + tostr(basecell))
  doc.out(record[3], "d" + tostr(basecell))
  doc.out(record[4], "e" + tostr(basecell))
  basecell = basecell + 1
 }
 doc.out("Итого", "a" + tostr(basecell))
 doc.out("=rows(b" + tostr(startcell) + ":b" + tostr(basecell - 1) + ")", "b" + tostr(basecell))
 doc.out("=sum(c" + tostr(startcell) + ":c" + tostr(basecell - 1) + ")", "c" + tostr(basecell))
 doc.out("=sum(d" + tostr(startcell) + ":d" + tostr(basecell - 1) + ")", "d" + tostr(basecell))
}
}