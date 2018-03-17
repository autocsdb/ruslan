define function main()
{
 if(doc.isempty() )
 {
  var s = messagebox("Файл книги не открыт. Создать новый?", "Формирование книги суммарного учета", 4132)
  if(s == 6)
   doc.newfile("docs\ksutemplates\ksu.xls")
  else
   return
 }

 var tegs = newmass(0)
 add(tegs, "") '1
 add(tegs, "1502") '2
 add(tegs, "1507") '3
 add(tegs, "1512") '4
 add(tegs, "1517") '5
 add(tegs, "1522") '6
 add(tegs, "1527") '7
 add(tegs, "1532") '8
 add(tegs, "1537") '9
 add(tegs, "1542") '10
 add(tegs, "1547") '11
 add(tegs, "1557") '12

 var baseCell = doc.getlast() + 1
 var size = sizeof(KSUDESC)
 for(var i = 0; i < size; i = i + 1)
 {
  var curaddress = ""
  for(var j = 0; j < sizeof(tegs); j = j + 1)
  {
   if(j >= 26)
    curaddress = "a" + char(j + 97 - 26)
   else
    curaddress = char(j + 97)

   if(sizeof(tegs[j]))
   {
    var s = Grs(KSUDESC[i], tegs[j], "0")
    if(s != "NULL")
     doc.out(s, curaddress + ToStr(baseCell), Add, Default)
   }
   doc.drawborder(curaddress + ToStr(baseCell))
  }
  doc.out(Grs(KSUDESC[i], "22", "0") + "/" + Grs(KSUDESC[i], "23", "0"), "a" + ToStr(baseCell))
  baseCell = baseCell + 1
 }
}