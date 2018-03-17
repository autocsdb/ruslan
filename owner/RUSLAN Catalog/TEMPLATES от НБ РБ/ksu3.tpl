define function main()
{
 var curaddress
 if(doc.isempty() )
 {
  var s = messagebox("Файл книги не открыт. Создать новый?", "Формирование книги суммарного учета", 4132)
  if(s == 6)
   doc.newfile("docs\ksutemplates\ksu.xls")
  else
   return
 }

 var tegs = newmass(0)
 add(tegs, 0) '1
 add(tegs, 54) '4
 add(tegs, 55) '5
 add(tegs, 56) '6
 add(tegs, 58) '7
 add(tegs, 51) '8
 add(tegs, 52) '9
 add(tegs, 1201) '10
 add(tegs, 1206) '11
 add(tegs, 1211) '12
 add(tegs, 1216) '13
 add(tegs, 1221) '14
 add(tegs, 1296) '15
 add(tegs, 1301) '16
 add(tegs, 1305) '17
 add(tegs, 1306) '18
 add(tegs, 1316) '19
 add(tegs, 1696) '20
 add(tegs, 1686) '21
 add(tegs, 1691) '22
 add(tegs, 1321) '23
 add(tegs, 1326) '24
 add(tegs, 1331) '25
 add(tegs, 1336) '26
 add(tegs, 1341) '27
 add(tegs, 1346) '28
 add(tegs, 1351) '29
 add(tegs, 1356) '30

var baseCell = doc.getlast() + 1
for(var i =0; i < 2; i = i + 1)
{
 if(i ==0)
  doc.out("Поступило за " + quarter + " кв. " + tostr(year) + "г.", "a" + ToStr(baseCell))
 if(i == 1)
  doc.out("Выбыло за " + quarter + " кв. " + tostr(year) + "г.", "a" + ToStr(baseCell))

 if(i >= sizeof(ksudesc))
 {
  for(var j = 0; j < sizeof(tegs); j = j + 1)
  {
   if(tegs[j] > 0)
   {
    if(j >= 26)
     curaddress = "a" + char(j + 97 - 26)
    else
     curaddress = char(j + 97)
    doc.out("0", curaddress + ToStr(baseCell))
   }
  }

 }
 if(i < sizeof(ksudesc))
 {
  for(var j = 0; j < sizeof(tegs); j = j + 1)
  {
   if(tegs[j] > 0)
   {
    if(j >= 26)
     curaddress = "a" + char(j + 97 - 26)
    else
     curaddress = char(j + 97)
    doc.out(Grs(KSUDESC[i], tegs[j], "0"), curaddress + ToStr(baseCell))
   }
  }
 }
 baseCell = baseCell + 1
}

var monthstring
if(quarter == "I")
 monthstring = "01.04." 	
if(quarter == "II")
 monthstring = "01.07." 	
if(quarter == "III")
 monthstring = "01.10." 	
if(quarter == "IV")
{
 monthstring = "01.01." 	
  year = year + 1
}


doc.out("Состоит на " + monthstring + tostr(year), "a" + ToStr(baseCell))
for(var j = 0; j < sizeof(tegs); j = j + 1)
{
 if(tegs[j]>0)
 {
  if(j >= 26)
   curaddress = "a" + char(j + 97 - 26)
  else
   curaddress = char(j + 97)
  if(j == 2)
  {
   var nextaddress = char(j + 97 + 1)
   doc.out("=" + curaddress + ToStr(baseCell - 3) + "+" + curaddress + ToStr(baseCell - 2) + "-" + curaddress + ToStr(baseCell - 1) + " + int((" + nextaddress + ToStr(baseCell - 3) + "+" + nextaddress + ToStr(baseCell - 2) + "-" + nextaddress + ToStr(baseCell - 1) + ")/100)", curaddress + ToStr(baseCell))
  }
  else
  {
   if(j==3)
   {
    doc.out("=((" + curaddress + ToStr(baseCell - 3) + "+" + curaddress + ToStr(baseCell - 2) + "-" + curaddress + ToStr(baseCell - 1) + ")/100 - int((" + curaddress + ToStr(baseCell - 3) + "+" + curaddress + ToStr(baseCell - 2) + "-" + curaddress + ToStr(baseCell - 1) + ")/100))*100", curaddress + ToStr(baseCell))
   }
   else
    doc.out("=" + curaddress + ToStr(baseCell - 3) + "+" + curaddress + ToStr(baseCell - 2) + "-" + curaddress + ToStr(baseCell - 1), curaddress + ToStr(baseCell))
  }
 }
}

}