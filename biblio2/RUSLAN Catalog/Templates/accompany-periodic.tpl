include "templates\common.tpl"
define function main()
{
 doc.clear()
 
 var s = doc.oleobject()
 s = s.propertyget(activesheet)

 var HPageBreaks = s.exec(propertyget, HPageBreaks)
 s.exec(procedure, ResetAllPageBreaks)
 
 var cols = s.exec(function, columns)
 var col = cols.exec(propertyget, item, 1)
 col.exec(propertyset, columnwidth, 8)
 col = cols.exec(propertyget, item, 2)
 col.exec(propertyset, columnwidth, 55)
 col = cols.exec(propertyget, item, 3)
 col.exec(propertyset, columnwidth, 5)
 col = cols.exec(propertyget, item, 4)
 col.exec(propertyset, columnwidth, 8)
 col = cols.exec(propertyget, item, 5)
 col.exec(propertyset, columnwidth, 4)
 
 var range
 
 var singmass=newmass(0)
 var resmass = newmass(0)
 add(singmass, "ОНЛ")
 add(resmass, newmass(0))
 add(singmass, "НЧЗ")
 add(resmass, newmass(0))
 add(singmass, "ЦДИ")
 add(resmass, newmass(0))
 add(singmass, "ОЧЗ")
 add(resmass, newmass(0))
 add(singmass, "ОЭПБ")
 add(resmass, newmass(0))
 add(singmass, "ОНТД")
 add(resmass, newmass(0))
 add(singmass, "ОХЛ")
 add(resmass, newmass(0))
 add(singmass, "ОБФ")
 add(resmass, newmass(0))
 add(singmass, "ОКМ")
 add(resmass, newmass(0))
 
 var abridgments_list = load_abridgments_list("abridgments.txt")
 
 var sourcesize = sizeof(source)
 for(var i =0; i < sourcesize; i = i + 1)
 {
  for(var j = 0; j < source[i].count(999); j = j + 1)
  {
   var index = -1
   if(source[i].value(999, j, $e) == grs(GRSREC, 22)+"/"+grs(GRSREC, 23))
   {
    var cursigla = source[i].value(999, j, $b)
    for(var l = 0; l < sizeof(singmass); l = l+1)
    {
     if(singmass[l] == cursigla)
      index = l
    }
    if(index < 0)
    {
     add(singmass, cursigla)
     add(resmass, newmass(0))
     index = sizeof(resmass) - 1
    }
    var record = newmass(0)
    add(record, source[i].value(999, j, $p))
    add(record, short_periodic_title(source[i], abridgments_list))
    add(record, source[i].value(210, 0, $d))
    add(record, short_periodic_number(source[i]))
    add(record, source[i].value(999, j, $v))
    add(record, source[i].value(999, j, $u))
    add(resmass[index], record)
   }
  }
 }
 
 for(var i =0; i < sizeof(resmass); i = i + 1)
  sort(resmass[i], resmass[i][%row%][1])
 
 var basecell = 1
 
 
 for(var i =0; i < sizeof(singmass); i = i + 1)
 {
  if(sizeof(resmass[i]) > 0)
  {
   var lastname = ""
   var finalcountstring = 0
   doc.out("Путевка на периодические издания фонда " + singmass[i], "A" + tostr(basecell))
   basecell = basecell + 2
   doc.out("Дата поступления: " + BillOpenDate, "A" + tostr(basecell))
   basecell = basecell + 2
   doc.out("Счет № " + ToStr(BillNumb), "A" + tostr(basecell))
   basecell = basecell + 2
   
   var count_address = basecell
   basecell = basecell + 2

   var startcell = basecell
 
   doc.out("Шифры", "a" + tostr(basecell))
   doc.out("Названия изданий", "b" + tostr(basecell))
   doc.out("Год", "c" + tostr(basecell))
   doc.out("Номер", "d" + tostr(basecell))
   doc.out("Кол.", "e" + tostr(basecell))
   doc.drawborder("A" + tostr(basecell) + " :e" + tostr(basecell), 1, 2, 15) 
   basecell = basecell + 1

  
   var curmass = resmass[i]
   var sourcesize = sizeof(curmass)
   var firstcell = basecell
   for(var j = 0; j < sourcesize; j = j + 1)
   {
    var record = curmass[j]
    doc.out(record[0], "a" + tostr(basecell))
    if(record[1] != lastname)
    {
     lastname = record[1]
     doc.out(record[1], "b" + tostr(basecell))
    }
    else
     doc.out("--//--", "b" + tostr(basecell))
    doc.out(record[2], "c" + tostr(basecell))
    doc.out(record[3], "d" + tostr(basecell))
    doc.out(record[4], "e" + tostr(basecell))
    finalcountstring = finalcountstring + tonumber(record[4])
    basecell = basecell + 1
   }
   doc.drawborder("A" + tostr(startcell) + ":e" + tostr(basecell), 1, 2, 47) 
   var rangetext = "a" + tostr(basecell) + ":d" + tostr(basecell)
   range = s.exec(propertyget, range, rangetext)
   range.exec(Procedure, merge)
   range.exec(propertyset, wraptext, 1)
'   range.exec(propertyset, HorizontalAlignment, -4108)
 
   doc.out("Итого", "A" + tostr(basecell))
   doc.drawborder("A" + tostr(basecell) + " :e" + tostr(basecell), 1, 2, 1) 
   doc.out("=sum(e" + tostr(firstcell) + ":e" + tostr(basecell - 1)+")", "e" + tostr(basecell))
   doc.out("Общее количество: " + tostr(finalcountstring), "A" + tostr(count_address))
   basecell = basecell + 2

   rangetext = "a" + tostr(basecell) + ":e" + tostr(basecell)
   range = s.exec(propertyget, range, rangetext)
   range.exec(Procedure, merge)
   doc.out("Дата передачи в отдел каталогизации:", "a" + tostr(basecell))
   basecell = basecell + 2

   rangetext = "a" + tostr(basecell) + ":e" + tostr(basecell)
   range = s.exec(propertyget, range, rangetext)
   range.exec(Procedure, merge)
   doc.out("Дата передачи зав.отделом хранения:", "a" + tostr(basecell))
   basecell = basecell + 2
  
   rangetext = "A" + ToStr(baseCell)
   range = s.sexec(propertyget, range, rangetext)
   HPageBreaks.sexec(procedure, add, range)

  }

  
 }
' var rangetext = "a" + tostr(basecell) + ":E" + tostr(basecell)
' range = s.exec(propertyget, range, rangetext)
' range.exec(Procedure, merge)
' range.exec(propertyset, wraptext, 1)
' range.exec(propertyset, HorizontalAlignment, -4108)
' doc.drawborder("A"+tostr(basecell) + ":G" + tostr(basecell)) 
 
' doc.out("Всего по документу", "A" + tostr(basecell))
' doc.out(finalcountstring, "F" + tostr(basecell))
' doc.out(finalsumstring, "G" + tostr(basecell))
 
' doc.drawborder("A"+tostr(14) + ":A" + tostr(basecell)) 
' doc.drawborder("B"+tostr(14) + ":B" + tostr(basecell)) 
' doc.drawborder("C"+tostr(14) + ":C" + tostr(basecell)) 
' doc.drawborder("D"+tostr(14) + ":D" + tostr(basecell)) 
' doc.drawborder("E"+tostr(14) + ":E" + tostr(basecell)) 
' doc.drawborder("F"+tostr(14) + ":F" + tostr(basecell)) 
' doc.drawborder("G"+tostr(14) + ":G" + tostr(basecell)) 
}