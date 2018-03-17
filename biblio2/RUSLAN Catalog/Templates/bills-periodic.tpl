include "templates\common.tpl"
define function main()
{
 doc.clear()
 
 doc.out("Счет №  " + ToStr(BillNumb), "A1")
 doc.out("от  " + BillOpenDate, "C1")
 doc.out("Всего экземпляров", "A4")
 doc.out(ToStr(BillSumCount), "C4")
 doc.out("Сумма", "A5")
 doc.out(ToStr(BillSumPrice), "C5")
 'doc.ZONESEPARATE("c5", -1, "num2")
 doc.out("Инвентаризатор", "A7")
 doc.out("Периодические издания", "C10")
 doc.out("по данному документу введены в электронный каталог", "A11")
 doc.out("и переданы в следующие отделы Фундаментальной библиотеки", "A12")
 
 var s = doc.oleobject()
 s = s.propertyget(activesheet)

 var HPageBreaks = s.exec(propertyget, HPageBreaks)
 s.exec(procedure, ResetAllPageBreaks)
 
 var cols = s.exec(function, columns)
 var col = cols.exec(propertyget, item, 2)
 col.exec(propertyset, columnwidth, 8)
 col = cols.exec(propertyget, item, 3)
 col.exec(propertyset, columnwidth, 35)
 col = cols.exec(propertyget, item, 4)
 col.exec(propertyset, columnwidth, 5)
 col = cols.exec(propertyget, item, 5)
 col.exec(propertyset, columnwidth, 8)
 col = cols.exec(propertyget, item, 6)
 col.exec(propertyset, columnwidth, 4)
 col = cols.exec(propertyget, item, 7)
 col.exec(propertyset, NUMBERFORMAT, "0,00")
 
 var range = s.exec(propertyget, range, "a10:G10")
 range.exec(Procedure, merge)
 range.exec(propertyset, wraptext, 1)
 range.exec(propertyset, HorizontalAlignment, -4108)
 range = s.exec(propertyget, range, "a11:G11")
 range.exec(Procedure, merge)
 range.exec(propertyset, wraptext, 1)
 range.exec(propertyset, HorizontalAlignment, -4108)
 range = s.exec(propertyget, range, "a12:G12")
 range.exec(Procedure, merge)
 range.exec(propertyset, wraptext, 1)
 range.exec(propertyset, HorizontalAlignment, -4108)
 
 doc.out("Отделы", "A14")
 doc.out("Шифры", "B14")
 doc.out("Названия изданий", "C14")
 doc.out("Год", "D14")
 doc.out("Номер", "E14")
 doc.out("Кол.", "F14")
 doc.out("Сумма", "G14")
 doc.drawborder("A14:G14") 
 
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
 
 var basecell = 15 
 var finalcountstring = "=0"
 var finalsumstring = "=0"
 var lastname = ""
 for(var i =0; i < sizeof(singmass); i = i + 1)
 {
  if(sizeof(resmass[i]) > 0)
  {
   doc.out(singmass[i], "A" + tostr(basecell))
   var curmass = resmass[i]
   var sourcesize = sizeof(curmass)
   var firstcell = basecell
   for(var j = 0; j < sourcesize; j = j + 1)
   {
    var record = curmass[j]
    doc.out(record[0], "B" + tostr(basecell))
    if(record[1] != lastname)
    {
     lastname = record[1]
     doc.out(record[1], "C" + tostr(basecell))
    }
    else
     doc.out("--////--", "C" + tostr(basecell))
    doc.out(record[2], "D" + tostr(basecell))
    doc.out(record[3], "E" + tostr(basecell))
    doc.out(record[4], "F" + tostr(basecell))
    doc.out(tostr(TONUMBER(record[4]) * tonumber(record[5])), "G" + tostr(basecell))
    basecell = basecell + 1
   }
   doc.drawborder("A"+tostr(basecell) + ":G" + tostr(basecell)) 
   var rangetext = "a" + tostr(basecell) + ":E" + tostr(basecell)
   range = s.exec(propertyget, range, rangetext)
   range.exec(Procedure, merge)
   range.exec(propertyset, wraptext, 1)
   range.exec(propertyset, HorizontalAlignment, -4108)
 
   doc.out("Итого по отделу", "A" + tostr(basecell))
   doc.out("=sum(F" + tostr(firstcell) + ":F" + tostr(basecell - 1)+")", "F" + tostr(basecell))
   finalcountstring = finalcountstring + "+sum(F" + tostr(firstcell) + ":F" + tostr(basecell - 1)+")"
   doc.out("=sum(G" + tostr(firstcell) + ":G" + tostr(basecell - 1)+")", "G" + tostr(basecell))
   finalsumstring = finalsumstring + "+sum(G" + tostr(firstcell) + ":G" + tostr(basecell - 1)+")"
   basecell = basecell + 1
  }
 }
 var rangetext = "a" + tostr(basecell) + ":E" + tostr(basecell)
 range = s.exec(propertyget, range, rangetext)
 range.exec(Procedure, merge)
 range.exec(propertyset, wraptext, 1)
 range.exec(propertyset, HorizontalAlignment, -4108)
 doc.drawborder("A"+tostr(basecell) + ":G" + tostr(basecell)) 
 
 doc.out("Всего по документу", "A" + tostr(basecell))
 doc.out(finalcountstring, "F" + tostr(basecell))
 doc.out(finalsumstring, "G" + tostr(basecell))
 
 doc.drawborder("A"+tostr(14) + ":A" + tostr(basecell)) 
 doc.drawborder("B"+tostr(14) + ":B" + tostr(basecell)) 
 doc.drawborder("C"+tostr(14) + ":C" + tostr(basecell)) 
 doc.drawborder("D"+tostr(14) + ":D" + tostr(basecell)) 
 doc.drawborder("E"+tostr(14) + ":E" + tostr(basecell)) 
 doc.drawborder("F"+tostr(14) + ":F" + tostr(basecell)) 
 doc.drawborder("G"+tostr(14) + ":G" + tostr(basecell)) 
}