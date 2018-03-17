define function main()
{
var currec = -1
for(var i =0; i < source.count(979); i = i + 1)
{
 if(startwith(source.value(979, i, $a), CurNumDate))
 {
  currec = i
  break
 }
}
doc.newfile("docs\\subcard.xls")
doc.out(source.value(969, 0, $a), "Q3")
doc.out(source.value(969, 0, $a), "Q17")
doc.out(source.value(979, currec, $d), "s5")
doc.out(source.value(979, currec, $d), "T21")
'var magname = source.value(200, 0, $a)
'if(sizeof(magname) > 24)
' magname = substring(magname, symbol, 0, 23) + "..."
'doc.out(magname, "E4")
doc.out(source.value(200, 0, $a), "E4")
doc.out(source.value(200, 0, $a), "E19")
if(source.value(969, 0, $e) == "0")
{
 doc.out("журнал", "M3")
 doc.out("на журнал", "L17")
}
else
{
 if(source.value(969, 0, $e) == "1")
 {
  doc.out("газету", "M3")
  doc.out("на газету", "L17")
 }
 else
 {
  if(source.value(969, 0, $e) == "2")
  { 
   doc.out("инф.изд.", "M3")
   doc.out("на инф.изд.", "L17")
  }
 }
}
var begindate = source.value(979, currec, $b)
var enddate = source.value(979, currec, $c)
doc.out("на " + substring(begindate, symbol, 1, 4) + " год по мес€цам:", E6)
doc.out("на " + substring(begindate, symbol, 1, 4) + " год по мес€цам:", E23)

var beg = tonumber(substring(begindate, symbol, 5, 2))
var end = tonumber(substring(enddate, symbol, 5, 2))
if(beg < 2)
{
 doc.out("X", "E8")
 doc.out("X", "E25")
}
if((beg < 3) & (end > 1))
{
 doc.out("X", "F8")
 doc.out("X", "F25")
}
if((beg < 4) & (end > 2))
{
 doc.out("X", "G8")
 doc.out("X", "G25")
}
if((beg < 5) & (end > 3))
{
 doc.out("X", "I8")
 doc.out("X", "I25")
}
if((beg < 6) & (end > 4))
{
 doc.out("X", "J8")
 doc.out("X", "J25")
}
if((beg < 7) & (end > 5))
{
 doc.out("X", "K8")
 doc.out("X", "K25")
}
if((beg < 8) & (end > 6))
{
 doc.out("X", "M8")
 doc.out("X", "M25")
}
if((beg < 9) & (end > 7))
{
 doc.out("X", "N8")
 doc.out("X", "N25")
}
if((beg < 10) & (end > 8))
{
 doc.out("X", "P8")
 doc.out("X", "P25")
}
if((beg < 11) & (end > 9))
{
 doc.out("X", "R8")
 doc.out("X", "R25")
}
if((beg < 12) & (end > 10))
{
 doc.out("X", "S8")
 doc.out("X", "S25")
}
if(end == 12)
{
 doc.out("X", "T8")
 doc.out("X", "T25")
}
}