define function main()
{
 var tempfile = loadfromfile("коэфф.переоценки.txt")
 var repriceyears = newmass(0)
 var repricedata = newmass(0)
 for(var i = 0; i < sizeof(tempfile); i = i + 1)
 {
  var current = tempfile[i]
  var pos = pos(current, ";")
  if(pos > 0)
  {
   var curyear1 = substring(current, symbol, 1, pos - 1)
   current = substring(current, symbol, pos + 1)
   pos = pos(curyear1, "-")
   var curyear2
   if(pos > 0)
   {
    if(pos < sizeof(curyear1))
     curyear2 = tonumber(substring(curyear1, symbol, pos + 1))
    else
     curyear2 = tonumber(substring(curyear1, symbol, 1, pos - 1))
    
    if(pos > 1)
     curyear1 = tonumber(substring(curyear1, symbol, 1, pos - 1))
    else
     curyear1 = curyear2
   }else
   {
    curyear1 = tonumber(curyear1)
    curyear2 = curyear1
   }
   
   pos = pos(current, ";")
   if(pos > 0)
   {
    var month1 = substring(current, symbol, 1, pos - 1)
    current = substring(current, symbol, pos + 1)
    pos = pos(month1, "-")
    var month2
    if(pos > 0)
    {
     month2 = tonumber(substring(month1, symbol, pos + 1))
     month1 = tonumber(substring(month1, symbol, 1, pos - 1))
    }else
    {
     month1 = tonumber(month1)
     month2 = month1
    }
    
    var factor = "1"
    if(sizeof(current) > 0)
    {
     factor = trim(current)
     for(var i = curyear1; i <= curyear2; i = i + 1)
     {
      var k = indexof(repriceyears, i)
      if(k < 0)
      {
       k = sizeof(repriceyears)
       add(repriceyears, i)
       add(repricedata, newmass(4))
       for(var j = 0; j < 4; j = j + 1)
        repricedata[k][j] = "1"
      }
      for(var j = month1; j <= month2; j = j + 1)
      {
       if(j < 5)
        repricedata[k][j - 1] = factor
      }
     }
    }
   } 
  }
 }


doc.clear()
doc.out("УТВЕРЖДАЮ", "D1")
doc.out("проректор СПбГПУ", "D2")
doc.out("_____________________", "D4")
doc.out("(подпись лица, утвердившего акт)", "D5")
var worksheet = doc.oleobject()
worksheet = worksheet.propertyget(activesheet)

var range = worksheet.exec(propertyget, range, "D5")
var font = range.exec(propertyget, font)
font.exec(propertyset, size, 10)
font.exec(propertyset, Superscript, 1)

doc.out("\"___\"__________20__г", "D6")

doc.out("    Акт № " + Grs(ACTDESC, 34), "C8")
var actdate = Grs(ACTDESC, 35)
var actyear = substring(actdate, symbol, 1, 4)
var actmonth = substring(actdate, symbol, 5, 2)
if(actmonth == "01")
 actmonth = "января"	
if(actmonth == "02")
 actmonth = "февраля"	
if(actmonth == "03")
 actmonth = "марта"	
if(actmonth == "04")
 actmonth = "апреля"	
if(actmonth == "05")
 actmonth = "мая"	
if(actmonth == "06")
 actmonth = "июня"	
if(actmonth == "07")
 actmonth = "июля"	
if(actmonth == "08")
 actmonth = "августа"	
if(actmonth == "09")
 actmonth = "сентября"	
if(actmonth == "10")
 actmonth = "октября"	
if(actmonth == "11")
 actmonth = "ноября"	
if(actmonth == "12")
 actmonth = "декабря"	
var actday = substring(actdate, symbol, 7, 2)
doc.out("\"" + actday + "\" " + actmonth + " " + actyear + " г.", "C9")

doc.out("Настоящий акт составлен_____________________________________________________________", "A11")
doc.out("___________________________________________________________________________________", "A13")
doc.out("___________________________________________________________________________________", "A15")
doc.out("Об исключении из фонда: " + grs(actdesc, 37, "________________________________________________________________"), "A17")
doc.out(grs(actdesc, 38, "__________") + " экземпляр(ов)______________________________________________________________", "A19")
doc.out("на сумму " + grs(actdesc, 39, "_____________") + " руб. По причине: " + grs(actdesc, 36, "________________________________________________"), "A21")
doc.out("Список выбывших___________________________________________________________________", "A23")
doc.out("На \"____\"______________листах прилагается.", "A25")

doc.out("Список по акту № " + Grs(ACTDESC, 34), "C28")

var columns = worksheet.exec(propertyget, columns, "A:A")
columns.exec(propertyset, ColumnWidth, 3)

range = worksheet.exec(propertyget, range, "B30")
range.exec(propertyset, WrapText, 1)
columns = worksheet.exec(propertyget, columns, "B:B")
columns.exec(propertyset, ColumnWidth, 8)

range = worksheet.exec(propertyget, range, "C30")
range.exec(propertyset, WrapText, 1)
columns = worksheet.exec(propertyget, columns, "C:C")
columns.exec(propertyset, ColumnWidth, 28)
range = worksheet.exec(propertyget, range, "D30")
range.exec(propertyset, WrapText, 1)
columns = worksheet.exec(propertyget, columns, "D:D")
columns.exec(propertyset, ColumnWidth, 5)
range = worksheet.exec(propertyget, range, "E30")
range.exec(propertyset, WrapText, 1)
columns = worksheet.exec(propertyget, columns, "E:E")
columns.exec(propertyset, ColumnWidth, 5)
columns = worksheet.exec(propertyget, columns, "F:F")
columns.exec(propertyset, ColumnWidth, 5)
range = worksheet.exec(propertyget, range, "G30")
range.exec(propertyset, WrapText, 1)
columns = worksheet.exec(propertyget, columns, "G:G")
columns.exec(propertyset, ColumnWidth, 3)

range = worksheet.exec(propertyget, range, "H30")
range.exec(propertyset, WrapText, 1)
columns = worksheet.exec(propertyget, columns, "H:H")
columns.exec(propertyset, ColumnWidth, 8)
columns.exec(propertyset, HorizontalAlignment, -4108)

range = worksheet.exec(propertyget, range, "I30")
range.exec(propertyset, WrapText, 1)
columns = worksheet.exec(propertyget, columns, "I:I")
columns.exec(propertyset, ColumnWidth, 4)
range = worksheet.exec(propertyget, range, "j30")
range.exec(propertyset, WrapText, 1)
columns = worksheet.exec(propertyget, columns, "j:j")
columns.exec(propertyset, ColumnWidth, 10)

doc.out("№", "A30")
doc.out("Инв.номер", "B30")
doc.out("Автор и заглавие", "C30")

doc.out("Год издания", "D30")
doc.out("Год поступления", "E30")

doc.out("Цена", "F30")
doc.out("руб.", "F31")
doc.out("коп.", "G31")
doc.out(" ", "H30")
range = worksheet.exec(propertyget, range, "H30")
range.exec(propertyset, value, "Коэф. переоценки")

doc.out("Кол. экз.", "I30")
range = worksheet.exec(propertyget, range, "J30")
range.exec(propertyset, value, "Стоимость")

range = worksheet.exec(propertyget, range, "a30:i32")
range.exec(propertyset, VerticalAlignment, -4108)

doc.drawborder("a30:i32", 0, 2)
doc.drawborder("a31:i31", 0, 2)

doc.out("1", "A32")
doc.out("2", "B32")
doc.out("3", "C32")
doc.out("4", "D32")
doc.out("5", "E32")
doc.out("6", "F32")
doc.out("7", "G32")
doc.out("8", "H32")
doc.out("9", "I32")
doc.out("10", "J32")

range = worksheet.exec(propertyget, range, "A30:J32")
range.exec(propertyset, HorizontalAlignment, -4108)
range.exec(propertyset, VerticalAlignment, -4108)

range = worksheet.exec(propertyget, range, "G30:H30")
range.exec(procedure, merge)

var basecell=33
var startcell = basecell
var k = sizeof(source)
var numb = 1
var i = 0

var outmass = newmass(0)

for(i = 0; i < k; i= i + 1)
{
 for(var j = 0; j < marccount(source[i], 989); j = j + 1)
 {
  if(pos(marc(source[i], 989, j, $e), Grs(ACTDESC, 34)  + "/") != 1 )
   continue 
   
  var outindex = sizeof(outmass)
  add(outmass, newmass(8))
  for(var i =0; i < 8; i = i + 1)
   outmass[outindex][i] = ""
   
'  outmass[outindex][0] = tostr(numb)
'  doc.out(tostr(numb), "A" + tostr(basecell))

  outmass[outindex][0] = marc(source[i], 989, j, $p)
'  doc.out(marc(source[i], 989, j, $p), "B" + tostr(basecell))

  var curcell = "A" + tostr(basecell) + ":i" + tostr(basecell)
  range = worksheet.exec(propertyget, range, curcell)
  range.exec(propertyset, VerticalAlignment, -4108)

  var mainstring = ""
  if(marcexist(source[i], 700))
  {
   mainstring = mainstring + marc(source[i], 700, 0, $a($b?" "$b))   
   var k3 = marccount(source[i], 701)
   for(var i2 = 0; i2 < k3; i2 = i2 + 1)
    mainstring = mainstring + ", " + marc(source[i], 701, i2, $a($b?" "$b))   
  }  
  if(marcexist(source[i], 710))
  {
   mainstring = mainstring + marc(source[i], 710, 0, $a($b?". "$b))   
   var k4 = marccount(source[i], 711)
   for(var i3 = 0; i3 < k4; i3 = i3 + 1)
    mainstring = mainstring + ", " + marc(source[i], 711, i2, $a($b?". "$b))   
  }
  if(marcexist(source[i], 710) | marcexist(source[i], 700))
   mainstring = mainstring + ", " + marc(source[i], 200, 0, $a)	
  else
   mainstring = marc(source[i], 200, 0, $a)	

  var rangename = "C" + tostr(basecell)
  range = worksheet.exec(propertyget, range, rangename)
  range.exec(propertyset, WrapText, 1)

  outmass[outindex][1] = mainstring
'  doc.out(mainstring, "C" + tostr(basecell))
  
  outmass[outindex][2] = marc(source[i], 210, 0, $d)
'  doc.out(marc(source[i], 210, 0, $d), "D" + tostr(basecell))

  var price = ""

  var invnumber = marc(source[i], 989, j, $p)
  var outprice = -1
  if(source[i].exist(989, j, $u))
   outprice = tonumber(source[i].value(989, j, $u))
  
  var lastcycle
  var lasthit = -1
  
  outmass[outindex][5] = "1"
  for(var n = 0; ; n = n + 1)
  {
   if(n == marccount(source[i], 999))
   {
    if(lasthit == -1)
    {
     price = marc(source[i], 989, j, (!$u?"0")($u?$u))	
     var date
     if(source[i].exist(210, 0, $d))
     {
      date = source[i].value(210, 0, $d)
      date = date + "01"
     }
     else
     {
      date = "000001"
     }
     
     var month = tonumber(substring(date, symbol, 5, 2))
     date = substring(date, symbol, 1, 4)
     var repricepos = indexof(repriceyears, tonumber(date))
     if(repricepos >= 0)
     {
      month = tonumber(month)
      if(month > 0 & month < 4)
       month = 0
      if(month > 3 & month < 7)
       month = 1
      if(month > 6 & month < 10)
       month = 2
      if(month > 9 & month < 13)
       month = 3
      if(month < 1 | month > 13)
       month = 0
       
'       doc.out(tostr(repricedata[repricepos][month]), "G" + tostr(basecell))
      outmass[outindex][6] = tostr(tonumber(repricedata[repricepos][month]))
      outmass[outindex][3] = date
     }else
     {
      if(tonumber(date) < repriceyears[0])
      {
'        doc.out(tostr(repricedata[0][0]), "G" + tostr(basecell))
       outmass[outindex][6] = tostr(tonumber(repricedata[0][0]))
       outmass[outindex][3] = date
      }
      else
      {
'        doc.out("1", "G" + tostr(basecell))
       outmass[outindex][6] = "1"
       outmass[outindex][3] = date
      }
     }
     break
    }
    n = lasthit
    lastcycle = 1
   }else
    lastcycle = 0
  
   if(marc(source[i], 999, n, $p) == invnumber)
   {
    lasthit = n
    price = marc(source[i], 999, n, (!$u?"0")($u?$u))	
    if((outprice < 0) | (lastcycle) | (tonumber(price) == outprice))
    {
     if(source[i].exist(999, n, $e))
     {
      var date = ""
      if(startwith(source[i].value(999, n, $e), "-"))
      {
       if(source[i].exist(210, 0, $d))
       {
      	date = source[i].value(210, 0, $d)
      	date = date + "01"
       }
       else
       {
      	date = "000001"
       }
      }
      else
      {
       var spl = pos(source[i].value(999, n, $e), "/")
       if(spl > 0)
       {
        date = substring(source[i].value(999, n, $e), symbol, spl + 1)
       }
       if(sizeof(date) == 0)
       {
      	if(source[i].exist(210, 0, $d))
      	{
      	 date = source[i].value(210, 0, $d)
      	 date = date + "01"
      	}
      	else
      	{
      	 date = "000001"
      	}
       }
      }
      var month = tonumber(substring(date, symbol, 5, 2))
      date = substring(date, symbol, 1, 4)
      var repricepos = indexof(repriceyears, tonumber(date))
      if(repricepos >= 0)
      {
       month = tonumber(month)
       if(month > 0 & month < 4)
        month = 0
       if(month > 3 & month < 7)
        month = 1
       if(month > 6 & month < 10)
        month = 2
       if(month > 9 & month < 13)
        month = 3
       if(month < 1 | month > 13)
        month = 0
       
'       doc.out(tostr(repricedata[repricepos][month]), "G" + tostr(basecell))
       outmass[outindex][6] = tostr(tonumber(repricedata[repricepos][month]))
       outmass[outindex][3] = date
      
      }else
      {
       if(tonumber(date) < repriceyears[0])
       {
'        doc.out(tostr(repricedata[0][0]), "G" + tostr(basecell))
        outmass[outindex][6] = tostr(tonumber(repricedata[0][0]))
        outmass[outindex][3] = date
       }
       else
       {
'        doc.out("1", "G" + tostr(basecell))
        outmass[outindex][6] = "1"
        outmass[outindex][3] = date
       }
      }
     }else
     {
'      doc.out("1", "G" + tostr(basecell))
      outmass[outindex][6] = "1"
       outmass[outindex][3] = ""
     }
     
     break
    }
   }
  }
  var splplace = pos(price, ",")
  if(splplace)
  {
'   doc.out(substring(price, symbol, 1, splplace - 1), "E" + tostr(basecell))
   outmass[outindex][4] = substring(price, symbol, 1, splplace - 1)
'   doc.out(substring(price, symbol, splplace + 1, -1), "F" + tostr(basecell))
   outmass[outindex][5] = substring(price, symbol, splplace + 1, -1)
  }
  else
  {
   outmass[outindex][4] = price
'   doc.out(price, "E" + tostr(basecell))
   outmass[outindex][5] = "0"
'   doc.out("0", "F" + tostr(basecell))
  }
'  doc.out(marc(source[i], 989, j, $v), "H" + tostr(basecell))
  outmass[outindex][7] = marc(source[i], 989, j, $v)
'  doc.out("=((E"+tostr(basecell)+"*100+F" + tostr(basecell) + ")*G" + tostr(basecell) + ")/100", "I" + tostr(basecell))
  numb = numb + 1
  basecell = basecell + 1
 }
}

sort(outmass, outmass[%ROW%][0])

basecell = startcell

for(var i =0; i < sizeof(outmass); i = i + 1)
{
 doc.out(tostr(i + 1), "a" + tostr(basecell))
 for(var j =0; j < sizeof(outmass[i]); j = j + 1)
 {
  doc.out(outmass[i][j] ,char(97 + j + 1) + tostr(basecell))
 }
 doc.out("=((f"+tostr(basecell)+"*100+g" + tostr(basecell) + ")*h" + tostr(basecell) + ")/100", "j" + tostr(basecell))
 basecell = basecell + 1
}

doc.out("=sum(j" + tostr(startcell) + ":j"+tostr(basecell - 1)+")", "j" + tostr(basecell))
doc.out("=sum(i" + tostr(startcell) + ":i"+tostr(basecell - 1)+")", "i" + tostr(basecell))

range = worksheet.exec(propertyget, range, "a" + tostr(basecell) + ":h" + tostr(basecell))
range.procedure(merge)
doc.out("Итого", "a" + tostr(basecell))

basecell = basecell + 1



doc.out("Директор библиотеки: ", "A" + tostr(basecell + 2))
doc.out("Зав отделом: ", "A" + tostr(basecell + 4))
doc.out("Инвентаризатор: ", "A" + tostr(basecell + 6))

var rangetext = "B1:B" + tostr(basecell)
range = worksheet.exec(propertyget, range, rangetext)
range.exec(propertyset, HorizontalAlignment, -4108)

var curcell = tostr(basecell - 1)
doc.drawborder("A30:j" + curcell, 0, 2, 63)
var range1 = worksheet.exec(propertyget, range, "j33:j" + curcell)
range1.exec(propertyset, Numberformat, "0,00")
range1 = worksheet.exec(propertyget, range, "g33:g" + curcell)
range1.exec(propertyset, Numberformat, "00")

'doc.drawborder("A30:I32", 0, 2, 63)
'doc.drawborder("B30:B" + curcell, 0, 2)
'doc.drawborder("D30:D" + curcell, 0, 2)
'doc.drawborder("D30:E" + curcell, 0, 2)
'doc.drawborder("G30:G" + curcell, 0, 2)
'doc.drawborder("I30:I" + curcell, 0, 2)
}