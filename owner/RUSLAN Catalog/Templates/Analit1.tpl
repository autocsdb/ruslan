define function main()
{
 doc.Document(100, 180)
 doc.out("\n", Side1)
 var k = MARCCOUNT(SOURCE, 999)
 for(var i = 0; i < k ; i  = i + 1)
  doc.out(MARC(SOURCE, 999, 0, ($p?$p"   ")), Side1)
 doc.out("\n", Side1, Default)
 if((source.count(700) + source.count(701)) < 5)
  doc.out(MARC(SOURCE, 700, 0, $a" "$b), Side1)
 if(!MARCEXIST(SOURCE, 200, 0, $f))
  doc.out(MARC(SOURCE, 200, 0, $g" "), Side1)
 doc.out(MARC(SOURCE, 200, 0, ($a?" "$a)($e?": "$e)), Side1)
 if(MARCEXIST(SOURCE, 701, 0, $a))
  doc.out(MARC(SOURCE, 200, 0, ($g|$f?" / "($f?$f($g?)"; ")$g)), Side1)
 doc.out(" // ", Side1)
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
   doc.out(MARC(SOURCE, 461, 0, 200,0,$a), Side1)
   if(marcexist(source, 462, 0))
    doc.out(marc(source, 462, 0, 200, 0, ($h$a?". "$h": "$a)), Side1)
   doc.out(MARC(SOURCE, 463, 0, 210,0,($d?".-- ")), Side1)
   var year = ""
   var qwerty = marccount(SOURCE, 463)
   for(var i = 0; i < qwerty; i = i+1)
   {
    if(MARC(SOURCE, 463, i, 210,0,$d) == year)
     doc.out(MARC(SOURCE, 463, i, 200,0,$a), Side1)
    if(MARC(SOURCE, 463, i, 210,0,$d) != year)
    {
     year = MARC(SOURCE, 463, i, 210,0,$d)
     doc.out(year, Side1)
     doc.out(MARC(SOURCE, 463, i, 200,0,($a?".-- "$a)), Side1)
    }
    doc.out(MARC(SOURCE, 463, i, 200,0,($v?".-- "$v)), Side1)
    if(i != qwerty - 1)
     doc.out("; ", Side1)
   }
  }
  k = MARCCOUNT(SOURCE, 463, 0, 205)
  for(var i = 0; i<k;i=i+1)
   doc.out(MARC(SOURCE, 463, 0, 205, i, ($a|$b?".-- "$a($b?", "$b))), Side1)
  doc.out(MARC(SOURCE, 463, 0, 320, 0, ($a?" -- "$a) ), Side1)
  doc.out(MARC(SOURCE, 463, 0, 305, 0, ($a?".-- "$a) ), Side1)
  doc.out(MARC(SOURCE, 463, 0, 300, 0, ($a?".-- "$a) ), Side1)
  k = MARCCOUNT(SOURCE, 463, 0, 10)
  for(var i = 0; i < k; i= i+1)
   doc.out(MARC(SOURCE, 463, 0, 10, i, ($a?"\n ISBN "$a)($b?"\n ISBN "$b)), Side1, Default)
  k = MARCCOUNT(SOURCE, 463, 0, 11)
  for(var i = 0; i < k; i= i+1)
   doc.out(MARC(SOURCE, 463, 0, 11, i, ($a?"\n ISSN "$a)($b?"\n ISSN "$b)), Side1, Default)
 }
 var r = marccount(source, 225)
 if(r > 0)
 {
  doc.out(".-- (", Side1) 
  for(var i = 0; i < r; i = i +1)
  { 
   if(i > 0)
    doc.out(marc(source, 225, i, ($a?".--"$a)), Side1)
   else
    doc.out(marc(source,225, i, $a), Side1)
  }
  doc.out(")", Side1) 
 }
 doc.out(marc(source,320, 0, ($a?".--"$a)), Side1)
 doc.out(".", Side1)
}