'Топографическая карточка 2
define function main()
{
 doc.Document(100, 180)
 var bookcount = 1
 if(source.exist(910, 0, $a))
  bookcount  = tonumber(source.value(910, 0, $a))
 
 var marker = source.value()
 var k
 var i
 var k2
 var j
 doc.ZoneSeparate(Side1, 10, VER, Zone1, Zone2)
' doc.ZoneSeparate(Zone1, 35, HOR, Zone1, Zone7)
 doc.ZoneSeparate(zone2, 10, VER, Zone2, Zone3)
 doc.ZoneSeparate(zone3, 10, VER, Zone3, Zone4)
' doc.ZoneSeparate(Zone2, 17, HOR, Zone2, Zone5)
 doc.ZoneSeparate(Zone3, 12, HOR, Zone3, Zone6)
 doc.ZoneSeparate(Zone4, 10, VER, Zone4, Zone7) 

doc.out(marc(source,999,0,$i), Zone3)

doc.setfont(zone1, "", -1, -1, 1)
 doc.setfont("Arial Unicode MS", 11)
'  doc.out("\n", zone6)
 var mass999 = newmass(0)
 k = source.count(999)
 if(k > 1)
 {
  for(i =0; i < k; i = i + 1)
   add(mass999,marc(source,999, i,$p "   "$b)) 	
  k = userselect(mass999)
  doc.out(marc(source,999, k, "   "$p" - "$b), Zone1)
 }
 else
  doc.out(marc(source,999, 0, "  "$p" - "$b), Zone1)
 

 if(Marcexist(source,106,0))
  doc.out("Б", Zone7)
 else
 {
  if(Marcexist(source,126,0))
  {
   if(SubString(marc(source,126,0,$a), symbol, 1, 1) == "b")
    doc.out("P", Zone7)
   if(SubString(marc(source,126,0,$a), symbol, 1, 1) == "c")
    doc.out("К", Zone7)
  }
 }
 

 doc.out(source.value(999, 0, $h), Zone2)
 
 if(MARCEXIST(SOURCE,461, 0))
 {
  if((source.count(461, 0, 700) + source.count(461, 0, 701) + source.count(461, 0, 710) + source.count(461, 0, 711)) < 5)
  {
   if(marcexist(source, 461,0, 700, 0))
    doc.out(MARC(SOURCE, 461, 0, 700, 0, $a" "$g), zone6)
   else
    doc.out(MARC(SOURCE, 461, 0, 710, 0, $a". "$g), zone6)
  }
  doc.out("    ", zone4)
  var s
  for(s = 0; s < MARCCOUNT(SOURCE,461, 0, 200,0,$a) - 1; s = s + 1)
   doc.out(MARC(SOURCE,461, 0, 200,0,($a[s]?$a[s]"; ")), zone4)
  doc.out(MARC(SOURCE,461, 0, 200,0,($a[s]?$a[s])), zone4)
  doc.out("\n", zone4)
 }
 else
 {
  if((source.count(700) + source.count(701) + source.count(710) + source.count(711)) < 5)
  {
   if(marcexist(source, 700, 0))
    doc.out(MARC(SOURCE, 700, 0, $a($g?", "$g)(!$g?" "$b)), zone6)
   else
    doc.out(MARC(SOURCE, 710, 0, $a". "($g?$g)(!$g?$b)), zone6)
  }
 }
 doc.out("    ", zone4)
 if(marcexist(source, 462))
 {
  if((substring(marker, symbol, 8, 1) == "s") & (substring(marker, symbol, 9, 1) == "2"))
   doc.out(MARC(SOURCE,210,0,($d?$d".  ")), zone4)
  doc.out(MARC(SOURCE,462, 0, 200,0,$v), zone4)
  if(marc(source, 200, 0, #1) != "0")
   doc.out(": ", zone4)
 }
 else
 {
  if(marcexist(source, 461))
  {
   if((substring(marker, symbol, 8, 1) == "s") & (substring(marker, symbol, 9, 1) == "2"))
    doc.out(MARC(SOURCE,210,0,($d?$d",  ")), zone4)
   doc.out(MARC(SOURCE,461, 0, 200,0,$v"."), zone4)
   if(marc(source, 200, 0, #1) != "0")
    doc.out(": ", zone4)
  }
 }
 if(marc(source, 200, 0, #1) != "0")
 {
  var s = 0	
  for(s = 0; s < MARCCOUNT(SOURCE, 200,0,$a) - 1; s = s + 1)
   doc.out(MARC(SOURCE, 200,0,($a[s]?$a[s]"; ")), zone4)
  doc.out(MARC(SOURCE, 200,0,($a[s]?$a[s]" ")), zone4)
 }
 
 if(source.exist(126))
  doc.out("\n" + marc(source,215, 0, ($a?"На "$a)), zone4)
 
 if(source.exist(106))
 {
  if(bookcount > 1)
  {
   var books = newmass(0)
   for(var i = 1; i <= bookcount; i = i + 1)
    add(books, "Кн. " + tostr(i))
   var book = userselect(books)
   doc.out("\n" + marc(source,215, 0, ($a?"В "$a)) + " " + books[book], zone4)
  }
 }

 doc.setfont(zone7, "", -1, -1, 1)
 if(source.exist(210, 0, $a))
  'doc.out(MARC(SOURCE, 210, 0, $a[0]), zone4)
doc.out(MARC(SOURCE, 210, 0, $a[0]), zone7)
 else
 {
  if(source.exist(461))
   doc.out(MARC(SOURCE, 461, 0, 210, 0, $a[0]), zone7)
 }
 doc.out(MARC(SOURCE, 210, 0, ($d?", "$d)), zone7)
 
 doc.out(",  " + marc(source,999, 0, $u ) + " р.", Zone7)
}