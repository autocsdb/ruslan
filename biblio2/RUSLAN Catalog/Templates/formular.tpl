define function main()
{
 doc.Document(180, 100)
 doc.ZoneSeparate(Side1, 20, HOR, Sideleft, Side1)

 var mass[marccount(SOURCE, 999)]
 var k = marccount(SOURCE, 999)
 for(var i = 0; i < k; i = i+1)
  mass[i] = MARC(SOURCE, 999,i,$e) + " - " + MARC(SOURCE, 999,i,$p)
 var h = 0
 if(k > 1)
  h = userselect(mass)
 doc.setfont(side1,"Segoe UI", 10)
 doc.setfont(Sideleft,"Segoe UI", 10)
'инвентарный номер
 if(MARC(SOURCE, 999,h, $b) == "ОЧЗ")
  doc.out(MARC(SOURCE, 999,h,$p"\n"),side1)
 if(startwith(MARC(SOURCE, 999,h, $p), "Б/У"))
  doc.out(MARC(SOURCE, 999,h,$p"\n"),side1)
 if((MARC(SOURCE, 999,h, $b) != "ОЧЗ") & (!startwith(MARC(SOURCE, 999,h, $p), "Б/У")))
  doc.out(MARC(SOURCE, 999,h,"\t"$p"\n"),side1)

 'полочные  686a и 093a

 doc.out(source.value(686, 0, $a), side1)
 doc.out("\n", side1)
 doc.out(source.value(093, 0,$a), side1)
 doc.out("\n", side1)
 if(startwith(uppercase(MARC(SOURCE, 999,h,$p)), "Б/У") | startwith(uppercase(MARC(SOURCE, 999,h,$p)), "ИМ Б/У"))
 {
  var numbmass = newmass(0)
  for(var i = 0; i < marccount(SOURCE, 999,h, $y); i = i + 1)
  {
   var numb = marc(SOURCE, 999,h, $y[i])
   var splpos = pos(numb, "-")
   if(splpos > 0)
   {
    var startnumb = substring(numb, symbol, 0, splpos - 1)
    for(var i = 0; ; i = i + 1)
    { 
     if(startnumb[1] != "0")
      startnumb = substring(numb, symbol, i, -1)
     else
      break
    }
    var endnumb = tonumber(substring(numb, symbol, splpos + 1, - 1))
    for(var j = tonumber(startnumb); j <= endnumb;  j = j + 1)
     add(numbmass, tostr(j))
   }
   else
    add(numbmass, numb)
  }
  var s = 0
  if(sizeof(numbmass) > 0)
  {
   if(sizeof(numbmass) > 1)
    s = userselect(numbmass)
 
   var printnumb = numbmass[s]
   for(var i = 0; i < 10; i = i + 1)
   { 
    if(sizeof(printnumb) < 10)
     printnumb = "0" + printnumb
    else
     break
   }
   doc.out(printnumb + "\n",side1)
  }
 }
 if(marcExist(source, 461, 0))
 {
  if((source.count(461, 0, 700) + source.count(461, 0, 701)) < 5)
  {
   if(marcexist(source, 461,0, 700, 0))
    doc.out("\n" + MARC(SOURCE, 461, 0, 700, 0, $a" "$b), Side1)
   else
    doc.out("\n" + MARC(SOURCE, 461, 0, 710, 0, $a), Side1)
  }
 }
 else
 {
  if((source.count(700) + source.count(701)) < 5)
  {
   if(marcexist(source, 700, 0))
    doc.out("\n" + MARC(SOURCE, 700, 0, $a" "$b), Side1)
   else
    doc.out("\n" + MARC(SOURCE, 710, 0, $a), Side1)
  }
 }

 if(marcexist(source, 461))
  doc.out(MARC(SOURCE, 461, 0, 200,0,($a?" "$a" ")),side1)
 else
 {
  if(marc(source, 200, 0, #1) != "0")
   doc.out(MARC(SOURCE, 200,0,($a?" "$a" ")),side1)
 }
 doc.out(MARC(SOURCE,461, 0, 200,0,($v?" "$v)), Side1)

 doc.out("\n" + MARC(SOURCE, 210,0,($d?$d" ")),side1)
 doc.out("\t" + MARC(SOURCE, 999,h,($u?$u"р.")),side1)
 
 

 doc.out( "\n\n", Sideleft)
 if(substring (source.value(100, 0, $a), symbol, 17, 2)	== " c")
	doc.out( "МЛ", Sideleft)
if(substring (source.value(100, 0, $a), symbol, 17, 2)	== " d")
	doc.out( "СР", Sideleft)
if(substring (source.value(100, 0, $a), symbol, 17, 2)	== " a")
	doc.out( "СТ", Sideleft)
 
}