define function main()
{
 doc.Document(100, 180)
 doc.out("\n", Side1, Default)
 var k = MARCCOUNT(SOURCE, 999)
 var k1
 for(var i = 0; i < k ; i  = i + 1)
  doc.out(MARC(SOURCE, 999, 0, ($p?$p"   ")), Side1)
 doc.out("\n", Side1, Default)
 if(MARCEXIST(SOURCE, 700, 0, $a) & (!MARCEXIST(SOURCE, 701, 1, $a)))
  doc.out(MARC(SOURCE, 200, 0, $f" "), Side1)
 if(MARCEXIST(SOURCE, 700, 0, $a) & MARCEXIST(SOURCE, 701, 1, $a) & (!MARCEXIST(SOURCE, 701, 2, $a)))
  doc.out(MARC(SOURCE, 700, 0, $a" "$b), Side1)
 if(!MARCEXIST(SOURCE, 200, 0, $f))
  doc.out(MARC(SOURCE, 200, 0, $g" "), Side1)
 doc.out(MARC(SOURCE, 200, 0, ($a?" "$a)), Side1)
 if(MARCEXIST(SOURCE, 701, 0, $a) | MARCEXIST(SOURCE, 712, 0, $a))
  doc.out(MARC(SOURCE, 200, 0, ($g|$f?" / "($f?$f($g?)"; ")$g)), Side1)
 doc.out(" // ", , Side1)
 if(MARCEXIST(SOURCE, 463, 0))
 {
  if((MARCEXIST(SOURCE, 700, 0, $a)) & (!(MARCEXIST(SOURCE,701, 2, $a))))
   doc.out(MARC(SOURCE, 463, 0, 200,0,$f), Side1)
  if((MARCEXIST(SOURCE, 700, 0, $a)) & MARCEXIST(SOURCE,701, 2, $a) & (MARCEXIST(SOURCE, 710, 0, $a)))
   doc.out(MARC(SOURCE, 463, 0, 200,0,$f), Side1)
  if((!(MARCEXIST(SOURCE, 700, 0, $a))) & (MARCEXIST(SOURCE, 710, 2, $a)))
   doc.out(MARC(SOURCE, 463, 0, 200,0,$f), Side1)
  if(MARCEXIST(SOURCE, 461, 0))
  {
   if((source.count(461, 0, 700) + source.count(461, 0, 701)) < 5)
   {
    if(marcexist(source,461, 0,  700, 0))
     doc.out("\n" + MARC(SOURCE,461, 0,  700, 0, $a" "$b), Side1, default)
    else
     doc.out("\n" + MARC(SOURCE, 461, 0, 710, 0, $a), Side1, default)
   }
 
   doc.out(MARC(SOURCE, 461, 0, 200,0,$a), Side1)
   if(MARCEXIST(SOURCE,461, 0, 200, 0, $a))
    doc.out(MARC(SOURCE,461, 0, 200,0,($d?"="$d)($e?" : "$e)), Side1)
   k = MARCCOUNT(SOURCE,461,0,205)
   for(var i = 0; i<k;i=i+1)
    doc.out(MARC(SOURCE,461,0,205, i, ($a|$b?".-- "$a($b?", "$b))), Side1)
   k = marccount(source, 461, 0, 210, 0, $a) - 1
   k1 = marccount(source,461, 0,  210, 0, $c)
   doc.out(marc(source, 461, 0, 210, 0, ($a?".--")), Side1)
   if(k1 > 1)
   {
    for(var i = 0 ; i < k; i = i + 1)
     doc.out(MARC(SOURCE,461, 0,  210, 0, $a[i]": "$c[i]"; "), Side1)
    doc.out(MARC(SOURCE, 461, 0, 210, 0, $a[k]": "$c[k]), Side1)
   }
   else
   {
    for(var i = 0 ; i < k; i = i + 1)
     doc.out(MARC(SOURCE, 461, 0, 210, 0, $a[i]"; "), Side1)
    doc.out(MARC(SOURCE, 461, 0, 210, 0, $a[k]($c?": "$c)), Side1)
   }
   doc.out(MARC(SOURCE, 461, 0, 210,0,($d?".--"$d)($e|$g?"(")$e($g?($e?": ")$g)($e|$g?")")), Side1)
   if(marcexist(SOURCE, 463, 0, 200,0,$a))
   {
    doc.out(".-- ", Side1)
    var w = MARCCOUNT(SOURCE, 463, 0, 200,0,$a) - 1
    for(var w1 = 0; w1 < w; w1 = w1 + 1)
     doc.out(MARC(SOURCE, 463, 0, 200,0,($a[w1]?$a[w1]"; ")), Side1)
    doc.out(MARC(SOURCE, 463, 0, 200,0,($a[w]?$a[w])), Side1)
   }
   doc.out(MARC(SOURCE, 463, 0, 215, 0, ($a?".-- "$a($c?" : "$c)($d?"; "$d)($e?" + "$e)) ), Side1)
   doc.out(MARC(SOURCE, 463, 0, 320, 0, ($a?".-- "$a)), Side1)
   doc.out(MARC(SOURCE, 463, 0, 305, 0, ($a?".-- "$a)), Side1)
   k = MARCCOUNT(SOURCE, 463, 0, 300)
   for(var i = 0; i < k; i= i+1)
    doc.out(MARC(SOURCE, 463, 0, 300, i, ($a?".-- "$a)), Side1)
   doc.out(MARC(SOURCE, 463, 0, 200,0,($v?".-- "$v)), Side1)
  }
  else
  {
   if((source.count(700) + source.count(701)) < 5)
   {
    if(marcexist(source,700, 0))
     doc.out("\n" + MARC(SOURCE, 700, 0, $a" "$b), Side1, default)
    else
     doc.out("\n" + MARC(SOURCE, 710, 0, $a), Side1, default)
   }

   doc.out(MARC(SOURCE, 463, 0, 200,0,$a), Side1)
   if(MARCEXIST(SOURCE,463, 0, 200, 0, $a))
    doc.out(MARC(SOURCE,463, 0, 200,0,($d?"="$d)($e?" : "$e)), Side1)
   k = MARCCOUNT(SOURCE,463,0,205)
   for(var i = 0; i<k;i=i+1)
    doc.out(MARC(SOURCE,463,0,205, i, ($a|$b?".-- "$a($b?", "$b))), Side1)
   if(marcexist(source, 463, 0, 711, 0))
    doc.out(marc(source, 463, 0, 711, 0, ($a?"/ "$a)), side1)
   k = marccount(source, 463, 0, 210, 0, $a) - 1
   doc.out(marc(source, 463, 0, 210, 0, ($a?".--"$a)), Side1)
   if(k > 1)
   {
    for(var i = 1 ; i < k; i = i + 1)
     doc.out(MARC(SOURCE, 463, 0, 210, 0, ($a[i]?","$a[i]), Side1)
   }
   doc.out(MARC(SOURCE, 463, 0, 210,0,($d?", "$d)($e|$g?"(")$e($g?($e?": ")$g)($e|$g?")")), Side1)
   doc.out(MARC(SOURCE, 215, 0, ($a?".-- "$a($c?" : "$c)($d?"; "$d)($e?" + "$e))"." ), Side1)
   doc.out(MARC(SOURCE, 463, 0, 200,0,($v?".-- "$v)), Side1)
  }
  k = MARCCOUNT(SOURCE, 463, 0, 205)
  for(var i = 0; i<k;i=i+1)
   doc.out(MARC(SOURCE, 463, 0, 205, i, ($a|$b?".-- "$a($b?", "$b))), Side1)
  doc.out(MARC(SOURCE, 463, 0, 320, 0, ($a?" -- "$a) ), Side1)
  doc.out(MARC(SOURCE, 463, 0, 305, 0, ($a?".-- "$a) ), Side1)
  doc.out(MARC(SOURCE, 463, 0, 300, 0, ($a?".-- "$a) ), Side1)
  k = MARCCOUNT(SOURCE, 463, 0, 10)
  for(var i = 0; i < k; i= i+1)
   doc.out("\n" + MARC(SOURCE, 463, 0, 10, i, ($a?" ISBN "$a)($b?"\n ISBN "$b)), Side1, Default)
  k = MARCCOUNT(SOURCE, 463, 0, 11)
  for(var i = 0; i < k; i= i+1)
   doc.out("\n" + MARC(SOURCE, 463, 0, 11, i, ($a?" ISSN "$a)($b?"\n ISSN "$b)), Side1, Default)
  doc.out("\n ", Side1, Default)
 }
}