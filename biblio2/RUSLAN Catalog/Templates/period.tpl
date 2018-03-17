define function main()
{
 doc.Document(100, 180)
 var k = MARCCOUNT(SOURCE,999)
 var k1

 var shiftmass = newmass(0)
 for(var i = 0; i < k; i = i+1)
 {
  if((MARC(SOURCE,999,i,$b) == "ÎÍË") | (MARC(SOURCE,999,i,$b) == "ÖÄÈ") | (MARC(SOURCE,999,i,$b) == "Í×Ç") | (MARC(SOURCE,999,i,$b) == "ÎÝÏÁ") | (MARC(SOURCE,999,i,$b) == "Î×Ç") | (MARC(SOURCE,999,i,$b) == "Ñ×Ç") | (MARC(SOURCE,999,i,$b) == "ÎÕË"))
  {
   if(indexof(shiftmass, MARC(SOURCE,999,i,$p)) == -1)
   {
    doc.out(MARC(SOURCE,999,i,($p?$p"   ")), Side1)
    add(shiftmass, MARC(SOURCE,999,i,$p))
   }
   
  }
 }
 doc.out("\n", Side1, Default)
 if(MARCEXIST(SOURCE,461, 0))
 {
  if((source.count(461, 0, 710) + source.count(461, 0, 700) + source.count(461, 0, 701)) < 5)
  {
   if(marcexist(source, 461,0, 700, 0))
    doc.out("\n" + MARC(SOURCE, 461, 0, 700, 0, ($a?$a" ")$b) + "\n", Side1)
   else
    doc.out("\n" + MARC(SOURCE, 461, 0, 710, 0, ($a?$a". ")$b) + "\n", Side1)
  }
  doc.out("    ", Side1, Default)
  var s
  for(s = 0; s < MARCCOUNT(SOURCE,461, 0, 200,0,$a) - 1; s = s + 1)
   doc.out(MARC(SOURCE,461, 0, 200,0,($a[s]?$a[s]"; ")), Side1)
  doc.out(MARC(SOURCE,461, 0, 200,0,($a[s]?$a[s]" ")), Side1)
  if(MARCEXIST(SOURCE,461, 0, 200, 0, $a))
   doc.out(MARC(SOURCE,461, 0, 200,0,($d?"="$d)($e?" : "$e)), Side1)
  doc.out(MARC(SOURCE,461, 0, 200, 0,($f|$g?"/ "$f($f&$g?"; ")$g)), Side1)
  var altotv=""
  if(marcexist(source, 461, 0, 712, 0, $a))
  { 
   var podrc = marccount(source, 461, 0, 712, 0, $b)
   altotv = marc(source, 461, 0, 712, 0, $b[0])
   for(var i = 1; i < podrc; i = i + 1)
    altotv = altotv + ". " + marc(source, 461, 0, 712, 0, $b[i])
  }
  k = MARCCOUNT(SOURCE,461, 0, 205)
  for(var i = 0; i< k;i=i+1)
   doc.out(MARC(SOURCE,461, 0, 205, i, ($a|$b?".-- "$a($b?", "$b))), Side1)
  k = marccount(source, 461, 0, 210, 0, $a) - 1
  k1 = marccount(source, 461, 0, 210, 0, $c) - 1
  doc.out(marc(source, 461, 0, 210, 0, ($a?".--")), Side1)
  if(k1 > 0)
  {
   for(var i = 0 ; i < k; i = i + 1)
    doc.out(MARC(SOURCE, 461, 0, 210, 0, $a[i]($c[i]?": "$c[i])"; "), Side1)
   doc.out(MARC(SOURCE, 461, 0, 210, 0, $a[k]($c[k]?": "$c[k])), Side1)
  }
  else
  {
   for(var i = 0 ; i < k; i = i + 1)
    doc.out(MARC(SOURCE, 461, 0, 210, 0, $a[i]"; "), Side1)
   doc.out(MARC(SOURCE, 461, 0, 210, 0, $a[k]($c?": "$c)), Side1)
  }
  doc.out(MARC(SOURCE, 461, 0, 210, 0, ($d?", "$d".")(!$d?", Á.ã. ")($e|$g?"(")$e($g?($e?": ")$g)($e|$g?")") ), Side1)
  doc.out(MARC(SOURCE,461, 0, 215, 0, ($a?".-- "$a($c?" : "$c)($d?"; "$d)($e?" + "$e)) ), Side1)
  doc.out(MARC(SOURCE,461, 0, 225, 0, ($a?".-- ("$a($e?". "$e)($f?"/ "$f)($h?"; "$h)($i?". "$i)($v?"; "$v)")") ), Side1)
  doc.out(MARC(SOURCE,461, 0, 320, 0, ($a?".-- "$a) ), Side1)
  doc.out(MARC(SOURCE,461, 0, 305, 0, ($a?".-- "$a) ), Side1)
  k = MARCCOUNT(SOURCE,461,0,300)
  for(var i = 0; i < k; i= i+1)
   doc.out(MARC(SOURCE,461,0,300, i, ($a?".-- "$a)), Side1)
  k = MARCCOUNT(SOURCE,461, 0, 10)
  for(var i = 0; i < k; i= i+1)
   doc.out(MARC(SOURCE,461, 0, 10, i, ($a?"\n ISBN "$a)($b?" "$b)), Side1)
  k = MARCCOUNT(SOURCE,461, 0, 11)
  for(var i = 0; i < k; i= i+1)
   doc.out(MARC(SOURCE,461, 0, 11, i, ($a?"\n ISSN "$a)($b?" "$b)), Side1)

  doc.out("\n", Side1)
 }
 else
 {
  if((source.count(710) + source.count(700) + source.count(701)) < 5)
  {
   if(marcexist(source, 700, 0))
    doc.out("\n" + MARC(SOURCE, 700, 0, ($a?$a" ")$b) + "\n", Side1)
   else
    doc.out("\n" + MARC(SOURCE, 710, 0, $a?($a". ")$b) + "\n", Side1)
  }
 }
 doc.out("    ", Side1, Default)
 if(marc(source, 200, 0, #1) != "0")
 {
  if(marcexist(source, 461))
   doc.out(MARC(SOURCE,461, 0, 200,0,($v?$v": ")), Side1)

  var s
  for(s = 0; s < MARCCOUNT(SOURCE, 200,0,$a) - 1; s = s + 1)
   doc.out(MARC(SOURCE, 200,0,($a[s]?$a[s]"; ")), Side1)
  doc.out(MARC(SOURCE, 200,0,($a[s]?$a[s]" ")), Side1)

  if(MARCEXIST(SOURCE,200, 0, $a))
   doc.out(MARC(SOURCE,200,0,($d?"="$d)($e?" : "$e)), Side1)
  doc.out(MARC(SOURCE,200, 0, ($f|$g?"/ "$f($f&$g?"; ")$g)), Side1)
  var altotv=""
  if(marcexist(source, 712, 0, $a))
  {
   var podrc = marccount(source, 712, 0, $b)
   altotv = marc(source, 712, 0, $b[0])
   for(var i = 1; i < podrc; i = i + 1)
    altotv = altotv + ". " + marc(source, 712, 0, $b[i])
  }
  k = MARCCOUNT(SOURCE,205)
  for(var i = 0; i<k;i=i+1)
   doc.out(MARC(SOURCE,205, i, ($a|$b?".-- "$a($b?", "$b))), Side1)
  k = marccount(source, 210, 0, $a) - 1
  k1 = marccount(source, 210, 0, $c)
  doc.out(marc(source, 210, 0, ($a?".--")), Side1)
  if(k1 > 1)
  {
   for(var i = 0 ; i < k; i = i + 1)
    doc.out(MARC(SOURCE, 210, 0, $a[i]": "$c[i]"; "), Side1)
   doc.out(MARC(SOURCE, 210, 0, $a[k]": "$c[k]), Side1)
  }
  else
  { 
   for(var i = 0 ; i < k; i = i + 1)
    doc.out(MARC(SOURCE, 210, 0, $a[i]"; "), Side1)
   doc.out(MARC(SOURCE, 210, 0, $a[k]($c?": "$c)), Side1)
  }
  if(marcexist(source, 461, 0))
   doc.out(MARC(SOURCE, 210, 0, ($d?".--"$d)($e|$g?"(")$e($g?($e?": ")$g)($e|$g?")") ), Side1)
  else
   doc.out(MARC(SOURCE, 210, 0, ($d?", "$d)($e|$g?"(")$e($g?($e?": ")$g)($e|$g?")") ), Side1)
 }
 if(marc(source, 200, 0, #1) == "0")
 {
  doc.out(MARC(SOURCE,210,0,($d?$d" ")), Side1)
  if(marcexist(source, 461))
   doc.out(MARC(SOURCE,461, 0, 200,0,$v), Side1)
 }
 doc.out(MARC(SOURCE,215, 0, ($a?".-- "$a($c?" : "$c)($d?"; "$d)($e?" + "$e)) ), Side1)
 doc.out(MARC(SOURCE,225, 0, ($a?".-- ("$a($e?". "$e)($f?"/ "$f)($h?"; "$h)($i?". "$i)($v?"; "$v)")")), Side1)
 doc.out(MARC(SOURCE,320, 0, ($a?".-- "$a)), Side1)
 doc.out(MARC(SOURCE,305, 0, ($a?".-- "$a)), Side1)
 k = MARCCOUNT(SOURCE,300)
 for(var i = 0; i < k; i= i+1)
  doc.out(MARC(SOURCE,300, i, ($a?".-- "$a)), Side1)

 k = MARCCOUNT(SOURCE,10)
 for(var i = 0; i < k; i= i+1)
  doc.out(MARC(SOURCE,10, i, ($a?"\n ISBN "$a)($b?" "$b)), Side1)
 k = MARCCOUNT(SOURCE,11)
 for(var i = 0; i < k; i= i+1)
  doc.out(MARC(SOURCE,11, i, ($a?"\n ISSN "$a)($b?" "$b)), Side1)
 doc.out("\n ", Side2)
 if(MARCEXIST(SOURCE,675, 0))
 {
  k = MARCCOUNT(SOURCE,675) - 1
  for(var i = 0; i < k; i= i+1)
   doc.out(MARC(SOURCE,675, i, ($a?$a" + ")), Side2)
  doc.out(MARC(SOURCE,675, k, $a), Side2)
 }
 if(MARCEXIST(SOURCE,461, 0, 675, 0))
 {
  k = MARCCOUNT(SOURCE,461, 0, 675) - 1
  for(var i = 0; i < k; i= i+1)
   doc.out(MARC(SOURCE,461, 0, 675, i, ($a?$a" + ")), Side2)
  doc.out("\n" = MARC(SOURCE,461, 0, 675, k, $a), Side2)
 }
 if(MARCEXIST(SOURCE, 686, 0))
 {
  doc.out("\n ", Side2)
  k = MARCCOUNT(SOURCE, 686) - 1
  for(var i = 0; i < k; i= i+1)
  {
   if(MARC(SOURCE, 686, i, $2) == "rubbk")
    doc.out(MARC(SOURCE, 686, i, ($a?"ÁÁÊ ")), Side2)
   doc.out(MARC(SOURCE, 686, i, ($a?$a" + ")), Side2)
  }
  if(MARC(SOURCE, 686, k, $2) == "rubbk")
   doc.out(MARC(SOURCE, 686, k, ($a?"ÁÁÊ ")), Side2)
  doc.out(MARC(SOURCE, 686, k, ($a?$a)), Side2)
 }
 if(MARCEXIST(SOURCE, 461, 0, 686, 0))
 {
  k = MARCCOUNT(SOURCE, 461, 0, 686) - 1
  for(var i = 0; i < k; i= i+1)
  {
   if(MARC(SOURCE, 461, 0, 686, i, $2) == "rubbk")
    doc.out(MARC(SOURCE, 461, 0, 686, i, ($a?"ÁÁÊ ")), Side2)
   doc.out(MARC(SOURCE, 461, 0, 686, i, ($a?$a" + ")), Side2)
  }
  if(MARC(SOURCE, 461, 0, 686, k, $2) == "rubbk")
   doc.out(MARC(SOURCE, 461, 0, 686, k, ($a?"ÁÁÊ ")), Side2)
  doc.out(MARC(SOURCE, 461, 0, 686, k, ($a?$a)), Side2)
 }
 doc.out("\n", Side2)
 if(MARCEXIST(SOURCE, 461, 0, 606, 0))
 {
  k = MARCCOUNT(SOURCE, 461, 0, 606) - 1
  for(var i = 0; i < k; i= i+1)
  { 
   if(MARC(SOURCE, 461, 0, 606, i, $2) == "spstush")
    doc.out(MARC(SOURCE, 461, 0, 606, i, $a($x?" -- "$x)($z?" -- "$z)($y?" -- "$y)" + "), Side2)
  }
  if(MARC(SOURCE, 461, 0, 606, k, $2) == "spstush")
   doc.out(MARC(SOURCE, 461, 0, 606, k, $a($x?" -- "$x)($z?" -- "$z)($y?" -- "$y)), Side2)
 }
 if(MARCEXIST(SOURCE, 606, 0))
 {
  k = MARCCOUNT(SOURCE, 606) - 1
  for(var i = 0; i < k; i= i+1)
  { 
   if(MARC(SOURCE, 606, i, $2) == "spstush")
    doc.out(MARC(SOURCE, 606, i, $a($x?" -- "$x)($z?" -- "$z)($y?" -- "$y)" + "), Side2)
  }
  if(MARC(SOURCE, 606, k, $2) == "spstush")
   doc.out(MARC(SOURCE, 606, k, $a($x?" -- "$x)($z?" -- "$z)($y?" -- "$y)), Side2)
 }
}