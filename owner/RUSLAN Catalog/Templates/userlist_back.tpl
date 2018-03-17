define function main()
{
 doc.newfile()
 var s = doc.oleobject()
 s = s.propertyget(activesheet)
 var cardonpage = 1
 
 var cols = s.exec(function, columns)
 var col = cols.exec(propertyget, item, 1)
 col.exec(propertyset, columnwidth, 41)
 col.exec(propertyset, Verticalalignment, -4108)

 col = cols.exec(propertyget, item, 2)
 col.exec(propertyset, columnwidth, 41)
 col.exec(propertyset, Verticalalignment, -4108)

 var basecell = 1
 var sourcesize = sizeof(grssource)
 var text = "* Читательский бильт дает право пользования библиотекой ТПУ\n* Передавать билет другому лицу запрещается\n* В начале учебного года читательский билет необходимо продлить\n* При утере билета обращайтесь в бюро регистрации НТБ (ул.Белинского, к.146)\n* Дополнительную информацию о бибиотеке можно получить в Интернете по адресу: www.lib.tpu.ru"

 var rows = s.exec(function, rows)

 for(var i = 0; i < sourcesize; i = i + 1)
 {
  var rangetext = "A" + tostr(basecell) + ":B" + tostr(basecell) 
  var range = s.exec(propertyget, range, rangetext)
  range.exec(propertyset, wraptext, 1)
  var font = range.exec(propertyget, font)
  font.exec(propertyset, size, 8)

  var row = rows.exec(propertyget, item, basecell)
  row.exec(propertyset, rowheight, 130.5)
 

  doc.out(text, "B" + tostr(basecell))
  i = i + 1
  if(i < sourcesize)
   doc.out(text, "A" + tostr(basecell))

  basecell = basecell + 1
  
  if(cardonpage > 4)
  {
   rangetext = "A" + ToStr(baseCell)
   range = s.sexec(propertyget, range, rangetext)
   var HPageBreaks = s.sexec(propertyget, HPageBreaks)
   HPageBreaks.sexec(procedure, add, range)
   cardonpage = 1
  }
  else
   cardonpage = cardonpage + 1

 }
}