'************************************************************************************************************************************************
'* 
'*  $Author: Anton $
'*
'*  $Date: 2004/11/14 15:18:02 $
'*
'*  $Source: Z:/CVS/Data/Configurations/Ruslan/Catalogue/СПбГПУ/Templates/statistic.tpl,v $
'*
'*  $Revision: 1.2 $
'*
'************************************************************************************************************************************************
'*
'************************************************************************************************************************************************
define function main()
{
 doc.newfile()

 var activesheet = doc.oleobject()
 activesheet = activesheet.propertyget(activesheet)

 var siglemass = newmass(0)
 var siglenamemass = newmass(0)
 var pointmass = newmass(0)
 var pointnamemass = newmass(0)
 var usermass = newmass(0)
 var usernamemass = newmass(0)
 var setupcolumns = 1

 for(var i = 0; i < sizeof(grssource); i = i + 1)
 {
  var category = grs(grssource[i], 1801, 0, "")
  if(category == "1")
  {
   var pos = indexof(siglenamemass, grs(grssource[i], 1800, 0, ""))
   if(pos == -1)
   {
    add(siglenamemass, grs(grssource[i], 1800, 0, ""))
    add(siglemass, newmass(0))
    pos = sizeof(siglemass) - 1
    for(var j = 0;  j < 16; j = j + 1)
     add(siglemass[pos], 0)
   }

   for(var j = 0;  j < 3; j = j + 1)
    siglemass[pos][j] = siglemass[pos][j] + tonumber(grs(grssource[i], 1803 + j, 0, "0"))
   for(var j = 0;  j < 12; j = j + 1)
    siglemass[pos][j + 3] = siglemass[pos][j + 3] + tonumber(grs(grssource[i], 1910 + j, 0, "0"))
  }
  if(category == "2")
  {
   var pos = indexof(pointnamemass, grs(grssource[i], 1800, 0, ""))
   if(pos == -1)
   {
    add(pointnamemass, grs(grssource[i], 1800, 0, ""))
    add(pointmass, newmass(0))
    pos = sizeof(pointmass) - 1
    for(var j = 0;  j < 16; j = j + 1)
     add(pointmass[pos], 0)
   }

   for(var j = 0;  j < 3; j = j + 1)
    pointmass[pos][j] = pointmass[pos][j] + tonumber(grs(grssource[i], 1803 + j, 0, "0"))
   for(var j = 0;  j < 12; j = j + 1)
    pointmass[pos][j + 3] = pointmass[pos][j + 3] + tonumber(grs(grssource[i], 1910 + j, 0, "0"))
  }
  if(category == "3")
  {
   var pos = indexof(usernamemass, grs(grssource[i], 1800, 0, ""))
   if(pos == -1)
   {
    add(usernamemass, grs(grssource[i], 1800, 0, ""))
    add(usermass, newmass(0))
    pos = sizeof(usermass) - 1
    for(var j = 0;  j < 16; j = j + 1)
     add(usermass[pos], 0)
   }

   for(var j = 0;  j < 3; j = j + 1)
    usermass[pos][j] = usermass[pos][j] + tonumber(grs(grssource[i], 1803 + j, 0, "0"))
   for(var j = 0;  j < 12; j = j + 1)
    usermass[pos][j + 3] = usermass[pos][j + 3] + tonumber(grs(grssource[i], 1910 + j, 0, "0"))
  }
 }

 var basecell = 1
 
 if(sizeof(siglemass) > 0)
 {
  var range = activesheet.propertyget(range, "a" + tostr(basecell) + ":p" + tostr(basecell))
  range.procedure(merge)
  var font = range.propertyget(font)
  font.propertyset(bold, 1)
  doc.out("Фонд", "a" + tostr(basecell))

  basecell = basecell + 1
  var startcell = basecell
  basecell = create_header(activesheet, basecell, setupcolumns) 
  setupcolumns = 0
  range.propertyset(horizontalalignment, -4130)

  for(var i = 0;  i < sizeof(siglemass); i = i + 1)
  {
   doc.out(siglenamemass[i], "a" + tostr(basecell))
   for(var j = 0; j < 15; j= j + 1)
    doc.out(tostr(siglemass[i][j]), char(j + 98) + tostr(basecell))
   basecell = basecell + 1
  }
  
  doc.drawborder("a" + tostr(startcell) + ":p" + tostr(basecell - 1), 1, 2, 63)
 }

 
 if(sizeof(pointnamemass) > 0)
 {
  basecell = basecell + 1
  var range = activesheet.propertyget(range, "a" + tostr(basecell) + ":p" + tostr(basecell))
  range.procedure(merge)
  var font = range.propertyget(font)
  font.propertyset(bold, 1)
  doc.out("Точки выдачи", "a" + tostr(basecell))
  basecell = basecell + 1
  var startcell = basecell
  basecell = create_header(activesheet, basecell, setupcolumns) 
  setupcolumns = 0
  range.propertyset(horizontalalignment, -4130)
  
  for(var i = 0;  i < sizeof(pointmass); i = i + 1)
  {
   doc.out(pointnamemass[i], "a" + tostr(basecell))
   for(var j = 0; j < 15; j= j + 1)
    doc.out(tostr(pointmass[i][j]), char(j + 98) + tostr(basecell))
   basecell = basecell + 1
  }
  doc.drawborder("a" + tostr(startcell) + ":p" + tostr(basecell - 1), 1, 2, 63)
 }

 if(sizeof(usermass) > 0)
 {
  basecell = basecell + 1
  var range = activesheet.propertyget(range, "a" + tostr(basecell) + ":p" + tostr(basecell))
  range.procedure(merge)
  var font = range.propertyget(font)
  font.propertyset(bold, 1)
  doc.out("Пользователи", "a" + tostr(basecell))
  basecell = basecell + 1
  var startcell = basecell
  basecell = create_header(activesheet, basecell, setupcolumns) 
  setupcolumns = 0
  range.propertyset(horizontalalignment, -4130)
 
  for(var i = 0;  i < sizeof(usermass); i = i + 1)
  {
   doc.out(usernamemass[i], "a" + tostr(basecell))
   for(var j = 0; j < 15; j= j + 1)
    doc.out(tostr(usermass[i][j]), char(j + 98) + tostr(basecell))
   basecell = basecell + 1
  }
  doc.drawborder("a" + tostr(startcell) + ":p" + tostr(basecell - 1), 1, 2, 63)
 }

 return

  var pos = indexof(siglemass, currentsigle)
  if(pos == -1)
  {
   pos = sizeof(siglemass)
   add(siglemass, currentsigle)
   add(outmass, newmass(2))
   outmass[pos][0] = newmass(0)
   outmass[pos][1] = newmass(0)
  }
  var currentpoint = grs(grssource, 1801, 0, "")
  var pos1 = indexof(outmass[pos][0], currentpoint)
  if(pos1 == -1)
  {
   pos1 = sizeof(outmass[pos][0])
   add(outmass[pos][0], currentpoint)
   add(outmass[pos][1], newmass(0))
  }
  
  add(outmass[pos][1][pos1], grs(grssource, 1803, 0, ""))
 }
}
'************************************************************************************************************************************************
'*
'************************************************************************************************************************************************
define function create_header(_activesheet, _basecell, _setupcolumns)
{
 doc.out("Объект\nстатистики", "a" + tostr(_basecell))
 var range = _activesheet.propertyget(range, "a" + tostr(_basecell) + ":a" + tostr(_basecell + 1))
 range.procedure(merge)
 
 doc.out("Посещений", "b" + tostr(_basecell))
 range = _activesheet.propertyget(range, "b" + tostr(_basecell) + ":b" + tostr(_basecell + 1))
 range.procedure(merge)
 
 doc.out("Выданных", "c" + tostr(_basecell))
 range = _activesheet.propertyget(range, "c" + tostr(_basecell) + ":c" + tostr(_basecell + 1))
 range.procedure(merge)
 
 doc.out("Сданных", "d" + tostr(_basecell))
 range = _activesheet.propertyget(range, "d" + tostr(_basecell) + ":d" + tostr(_basecell + 1))
 range.procedure(merge)
 
 doc.out("Распределение по времени", "e" + tostr(_basecell))
 range = _activesheet.propertyget(range, "e" + tostr(_basecell) + ":p" + tostr(_basecell))
 range.procedure(merge)
 range.propertyset(verticalalignment, -4108)
 range.propertyset(horizontalalignment, -4108)
 
 range = _activesheet.propertyget(range, "a" + tostr(_basecell) + ":d" + tostr(_basecell + 1))
 range.propertyset(orientation, 90)
 
 range = _activesheet.propertyget(range, "a" + tostr(_basecell))
 range.procedure(merge)
 range.propertyset(RowHeight, 45)

 if(_setupcolumns == 1)
 {
  var cols = _activesheet.propertyget(columns, 1)
  cols.propertyset(verticalalignment, -4108)
  cols.propertyset(horizontalalignment, -4108)
  cols.propertyset(columnwidth, 10)

  cols = _activesheet.propertyget(columns, 2)
  cols.propertyset(verticalalignment, -4108)
  cols.propertyset(horizontalalignment, -4108)
  cols.propertyset(columnwidth, 5)

  cols = _activesheet.propertyget(columns, 3)
  cols.propertyset(verticalalignment, -4108)
  cols.propertyset(horizontalalignment, -4108)
  cols.propertyset(columnwidth, 5)
  
  cols = _activesheet.propertyget(columns, 4)
  cols.propertyset(verticalalignment, -4108)
  cols.propertyset(horizontalalignment, -4108)
  cols.propertyset(columnwidth, 5)
  
  for(var j = 5; j < 17; j = j + 1)
  {
   cols = _activesheet.propertyget(columns, j)
   cols.propertyset(verticalalignment, -4108)
   cols.propertyset(horizontalalignment, -4108)
   cols.propertyset(columnwidth, 4)
  }
 }
 
 
 _basecell = _basecell + 1
 doc.out("10", "e" + tostr(_basecell))
 doc.out("11", "f" + tostr(_basecell))
 doc.out("12", "g" + tostr(_basecell))
 doc.out("13", "h" + tostr(_basecell))
 doc.out("14", "i" + tostr(_basecell))
 doc.out("15", "j" + tostr(_basecell))
 doc.out("16", "k" + tostr(_basecell))
 doc.out("17", "l" + tostr(_basecell))
 doc.out("18", "m" + tostr(_basecell))
 doc.out("19", "n" + tostr(_basecell))
 doc.out("20", "o" + tostr(_basecell))
 doc.out("21", "p" + tostr(_basecell))
 
 return (_basecell + 1)
}
'************************************************************************************************************************************************
'*
'************************************************************************************************************************************************
