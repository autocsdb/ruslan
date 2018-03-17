define function main()
{
 doc.Document(180, 100)
 doc.setfont("Times New Roman", 14)
 var mass[source.count( 999)]
 var k = source.count( 999)
 for(var i = 0; i < k; i = i+1)
  mass[i] = source.value( 999,i,$e) + " - " + source.value( 999,i,$p)
 var h = 0
 if(k > 1)
  h = userselect(mass)

 if(source.value( 999,h, $b) == "Œ◊«")
  doc.out(source.value( 999,h,"\n\n\n\n\n                        "$p"\n"),side1)
 if(startwith(source.value( 999,h, $p), "¡”"))
  doc.out(source.value( 999,h,"\n\n                     "$p"\n"),side1)
 if((source.value( 999,h, $b) != "Œ◊«") & (!startwith(source.value( 999,h, $p), "¡”")))
  doc.out(source.value( 999,h,"\n\n"$p"\n"),side1)

 if(startwith(uppercase(source.value( 999,h,$p)), "¡”") | startwith(uppercase(source.value( 999,h,$p)), "»Ã ¡”"))
 {
  var numbmass = newmass(0)
  for(var i = 0; i < source.count( 999,h, $y); i = i + 1)
  {
   var numb = source.value( 999,h, $y[i])
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
 if(source.exist( 461, 0))
 {
  if((source.count(461, 0, 700) + source.count(461, 0, 701)) < 5)
  {
   if(source.exist( 461,0, 700, 0))
    doc.out("\n" + source.value( 461, 0, 700, 0, $a" "$b), Side1)
   else
    doc.out("\n" + source.value( 461, 0, 710, 0, $a), Side1)
  }
 }
 else
 {
  if((source.count(700) + source.count(701)) < 5)
  {
   if(source.exist( 700, 0))
    doc.out("\n" + source.value( 700, 0, $a" "$b), Side1)
   else
    doc.out("\n" + source.value( 710, 0, $a), Side1)
  }
 }

 if(source.exist( 461))
  doc.out(source.value( 461, 0, 200,0,($a?" "$a" ")),side1)
 else
 {
  if(source.value( 200, 0, #1) != "0")
   doc.out(source.value( 200,0,($a?" "$a" ")),side1)
 }
 doc.out(source.value(461, 0, 200,0,($v?" "$v)), Side1)

 doc.out("\n" + source.value( 210,0,($d?$d" ")),side1)
 doc.out("\n" + source.value( 999,h,($u?$u" ")),side1)
}