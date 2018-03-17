define function main()
{
 VAR BARFONTNAME = "Free 3 of 9"
 doc.newfile()
 var s = doc.oleobject()
s = s.propertyget(activesheet)
 var cardonpage = 1
 
 var cols = s.exec(function, columns)
 var col = cols.exec(propertyget, item, 1)
 col.exec(propertyset, columnwidth, 16)
 col.exec(propertyset, numberformat, "@")

 col = cols.exec(propertyget, item, 2)
 col.exec(propertyset, columnwidth, 25)
 col.exec(propertyset, numberformat, "@")

 col = cols.exec(propertyget, item, 3)
 col.exec(propertyset, columnwidth, 16)
 col.exec(propertyset, numberformat, "@")

 col = cols.exec(propertyget, item, 4)
 col.exec(propertyset, columnwidth, 25)
 col.exec(propertyset, numberformat, "@")
 
 var basecell = 1
 var sourcesize = sizeof(grssource)
 for(var i = 0; i < sourcesize; i = i + 1)
 {
  doc.out("Íàó÷íî-òåõíè÷åñêàÿ", "B" + tostr(basecell))
  doc.out("ÁÈÁËÈÎÒÅÊÀ ÒÏÓ", "B" + tostr(basecell + 1))

  var rangetext = "B" + tostr(basecell) + ":B" + tostr(basecell + 1)
  var range = s.exec(propertyget, range, rangetext)
  var font = range.exec(propertyget, font)
  font.exec(propertyset, size, 12)
  font.exec(propertyset, bold, 1)
  
  doc.out(grs(grssource[i], 119, ""), "B" + tostr(basecell + 2))
  rangetext = "B" + tostr(basecell + 2)
  range = s.exec(propertyget, range, rangetext)
  font = range.exec(propertyget, font)
  font.exec(propertyset, size, 14)
  
  doc.out(grs(grssource[i], 101, ""), "B" + tostr(basecell + 3))
  doc.out(grs(grssource[i], 102, ""), "B" + tostr(basecell + 4))
  doc.out(grs(grssource[i], 103, ""), "B" + tostr(basecell + 5))
  var date = grs(grssource[i], 105, "________")
  date = substring(date, symbol, 7, 2) + "." + substring(date, symbol, 5, 2) + "." + substring(date, symbol, 1, 4)
  doc.out("Âûäàí   " + date, "B" + tostr(basecell + 6))
  rangetext = "B" + tostr(basecell + 6)
  range = s.exec(propertyget, range, rangetext)
  font = range.exec(propertyget, font)
  font.exec(propertyset, size, 8)

  rangetext = "A" + tostr(basecell + 7) + ":B" + tostr(basecell + 7)
  range = s.exec(propertyget, range, rangetext)
  font = range.exec(propertyget, font)
  font.exec(propertyset, size, 26)
  font.exec(propertyset, name, "Free 3 of 9")
  range.exec(propertyset, HorizontalAlignment, -4108)
  range.exec(propertyset, VerticalAlignment, -4108)

  range = s.exec(propertyget, range, rangetext)
  range.exec(procedure, merge)
  
  doc.out(grs(grssource[i], 100, ""), "A" + tostr(basecell + 7))

  rangetext = "a" + tostr(basecell)
  range = s.exec(propertyget, range, rangetext)
  var top = range.exec(propertyget, top)
  top = top.int() + 5
  var left = range.exec(propertyget, left)
  left = left.int() + 5

  var picturesize = EXTRACTPICTUREFROMGRS("c:\temp.jpg", grssource[i], 117)
  if(sizeof(picturesize) > 0)
  {
   var shapes = s.exec(propertyget, shapes)
   var p1 = picturesize[0]
   var p2 = picturesize[1]
   shapes.exec(function, addpicture, "c:\temp.jpg", 0, 1, left, top, p1, p2)
  }
  doc.drawborder("a" + tostr(basecell) + ":B" + tostr(basecell + 7))
  i = i + 1
  if(i < sourcesize)
  {
   doc.out("Íàó÷íî-òåõíè÷åñêàÿ", "D" + tostr(basecell))
   doc.out("ÁÈÁËÈÎÒÅÊÀ ÒÏÓ", "D" + tostr(basecell + 1))

   var rangetext = "D" + tostr(basecell) + ":D" + tostr(basecell + 1)
   var range = s.exec(propertyget, range, rangetext)
   var font = range.exec(propertyget, font)
   font.exec(propertyset, size, 12)
   font.exec(propertyset, bold, 1)
  
   doc.out(grs(grssource[i], 119, ""), "D" + tostr(basecell + 2))
   rangetext = "D" + tostr(basecell + 2)
   range = s.exec(propertyget, range, rangetext)
   font = range.exec(propertyget, font)
   font.exec(propertyset, size, 14)
  
   doc.out(grs(grssource[i], 101, ""), "D" + tostr(basecell + 3))
   doc.out(grs(grssource[i], 102, ""), "D" + tostr(basecell + 4))
   doc.out(grs(grssource[i], 103, ""), "D" + tostr(basecell + 5))
   var date = grs(grssource[i], 105, "________")
   date = substring(date, symbol, 7, 2) + "." + substring(date, symbol, 5, 2) + "." + substring(date, symbol, 1, 4)
   doc.out("Âûäàí   " + date, "D" + tostr(basecell + 6))
   rangetext = "D" + tostr(basecell + 6)
   range = s.exec(propertyget, range, rangetext)
   font = range.exec(propertyget, font)
   font.exec(propertyset, size, 8)

   rangetext = "C" + tostr(basecell + 7) + ":D" + tostr(basecell + 7)
   range = s.exec(propertyget, range, rangetext)
   font = range.exec(propertyget, font)
   font.exec(propertyset, size, 26)
   font.exec(propertyset, name, BARFONTNAME)
   range.exec(propertyset, HorizontalAlignment, -4108)
   range.exec(propertyset, VerticalAlignment, -4108)

   range = s.exec(propertyget, range, rangetext)
   range.exec(procedure, merge)
  
   doc.out(grs(grssource[i], 100, ""), "C" + tostr(basecell + 7))

   rangetext = "C" + tostr(basecell)
   range = s.exec(propertyget, range, rangetext)
   var top = range.exec(propertyget, top)
   top = top.int() + 5
   var left = range.exec(propertyget, left)
   left = left.int() + 5
 
   var picturesize = EXTRACTPICTUREFROMGRS("c:\temp.jpg", grssource[i], 117)
   if(sizeof(picturesize) > 0)
   {
    var shapes = s.exec(propertyget, shapes)
    var p1 = picturesize[0]
    var p2 = picturesize[1]
    shapes.exec(function, addpicture, "c:\temp.jpg", 0, 1, left, top, p1, p2)
   }
   doc.drawborder("C" + tostr(basecell) + ":D" + tostr(basecell + 7))
  }
  basecell = basecell + 8
  
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