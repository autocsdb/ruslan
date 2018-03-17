include "Templates\common.tpl"
define function main()
{
 doc.Document(100, 180)
 var k = source.count(999)
 var k1
 var marker = marc(source)
 for(var i = 0; i < k; i = i+1)
 {
  if((source.value(999,i,$b) == "ÎÍË") | (source.value(999,i,$b) == "ÖÄÈ") | (source.value(999,i,$b) == "Í×Ç") | (source.value(999,i,$b) == "ÎÝÏÁ"))
   doc.out(source.value(999,i,($p?$p"   ")), Side1)
 }
 doc.out("\n", Side1)
 common(source, "side1")
 doc.out("\n ", Side2)
 if(source.exist(675, 0))
 {
  k = source.count(675) - 1
  for(var i = 0; i < k; i= i+1)
   doc.out(source.value(675, i, ($a?$a" + ")), Side2)
  doc.out(source.value(675, k, $a), Side2)
 }
 if(source.exist(461, 0, 675, 0))
 {
  k = source.count(461, 0, 675) - 1
  for(var i = 0; i < k; i= i+1)
   doc.out(source.value(461, 0, 675, i, ($a?$a" + ")), Side2)
  doc.out("\n" + source.value(461, 0, 675, k, $a), Side2)
 }
 if(source.exist( 686, 0))
 {
  doc.out("\n ", Side2)
  k = source.count( 686) - 1
  for(var i = 0; i < k; i= i+1)
  {
   if(source.value( 686, i, $2) == "rubbk")
    doc.out(source.value( 686, i, ($a?"ÁÁÊ "$a" + ")), Side2)
  }
  if(source.value( 686, k, $2) == "rubbk")
  doc.out(source.value( 686, k, ($a?"ÁÁÊ "$a)), Side2)
 }
 if(source.exist( 461, 0, 686, 0))
 {
  k = source.count( 461, 0, 686) - 1
  for(var i = 0; i < k; i= i+1)
  {
   if(source.value( 461, 0, 686, i, $2) == "rubbk")
    doc.out(source.value( 461, 0, 686, i, ($a?"ÁÁÊ "$a" + ")), Side2)
  }
  if(source.value( 461, 0, 686, k, $2) == "rubbk")
   doc.out(source.value( 461, 0, 686, k, ($a?"ÁÁÊ "$a)), Side2)
 }
 doc.out("\n", Side2)
 var s = 0
 if(source.exist( 461, 0, 600, 0))
 {
  s = 1
  k = source.count( 461, 0, 600) - 1
  for(var i = 0; i < k; i= i+1)
   doc.out(source.value( 461, 0, 600, i, $a($d?" "$d)($c?"("$c") ")($f?", "$f)"+"), Side2)
  doc.out(source.value( 461, 0, 600, k, $a($d?" "$d)($c?"("$c") ")($f?", "$f)), Side2)
 }
 if(source.exist( 461, 0, 601, 0))
 {
  if(s == 1)
   doc.out("+", Side2)
  s = 1
  k = source.count( 461, 0, 601) - 1
  for(var i = 0; i < k; i= i+1)
   doc.out(source.value( 461, 0, 601, i, $a($b?" - "$b)($y?". "$y)"+"), Side2)
  doc.out(source.value( 461, 0, 601, k, $a($b?" - "$b)($y?". "$y)), Side2)
 }

 if(source.exist( 461, 0, 606, 0))
 {
  if(s == 1)
   doc.out("+", Side1)
  s = 1
  k = source.count( 461, 0, 606) - 1
  for(var i = 0; i < k; i= i+1)
  {
   if(source.value( 461, 0, 606, i, $2) == "spstush")
   {
    doc.out(source.value( 461, 0, 606, i, $a), Side2)
    for(var j = 0; j <= source.count( 461, 0, 606, i, $x); j = j + 1)
     doc.out(source.value( 461, 0, 606, i, ($x[j]?" -- "$x[j])), Side2)
    doc.out(source.value( 461, 0, 606, i, ($z?" -- "$z)($y?" -- "$y)" + "), Side2)
   }
  }
  if(source.value( 461, 0, 606, k, $2) == "spstush")
  {
   doc.out(source.value( 461, 0, 606, k, $a), Side2)
   for(var i = 0; i <= source.count( 461, 0, 606, k, $x); i = i + 1)
    doc.out(source.value( 461, 0, 606, k, ($x[i]?" -- "$x[i])), Side2)
   doc.out(source.value( 461, 0, 606, k, ($z?" -- "$z)($y?" -- "$y)), Side2)
  }
 }
 
 if(source.exist( 461, 0, 607, 0))
 {
  if(s == 1)
   doc.out("+", Side2)
  s = 1
  k = source.count( 461, 0, 607) - 1
  for(var i = 0; i < k; i= i+1)
   doc.out(source.value( 461, 0, 607, i, $x($y?".--"$y)($z?".--"$z)"+"), Side2)
  doc.out(source.value( 461, 0, 607, k, $x($y?".--"$y)($z?".--"$z)), Side2)
 }

 if(source.exist( 600, 0))
 {
  if(s == 1)
   doc.out("+", Side2)
  s = 1
  k = source.count( 600) - 1
  for(var i = 0; i < k; i= i+1)
   doc.out(source.value( 600, i, $a($g?" "$g)($c?"("$c") ")($f?", "$f)"+"), Side2)
  doc.out(source.value( 600, k, $a($g?" "$g)($c?"("$c") ")($f?", "$f)), Side2)
 }
 if(source.exist( 601, 0))
 {
  if(s == 1)
   doc.out("+", Side2)
  s = 1
  k = source.count( 601) - 1
  for(var i = 0; i < k; i= i+1)
   doc.out(source.value( 601, i, $a($b?" - "$b)($y?". "$y)"+"), Side2)
  doc.out(source.value( 601, k, $a($b?" - "$b)($y?". "$y)), Side2)
 }
 if(source.exist( 606, 0))
 {
  if(s == 1)
   doc.out("+", Side2)
  s = 1
  k = source.count( 606) - 1
  for(var i = 0; i < k; i= i+1)
  {
   if(source.value( 606, i, $2) == "spstush")
   {
    doc.out(source.value( 606, i, $a), Side2)
    for(var j = 0; j <= source.count( 606, i, $x); j = j + 1)
     doc.out(source.value( 606, i, ($x[j]?" -- "$x[j])), Side2)
    doc.out(source.value( 606, i, ($z?" -- "$z)($y?" -- "$y)" + "), Side2)
   }
  }
  if(source.value( 606, k, $2) == "spstush")
  {
   doc.out(source.value( 606, k, $a), Side2)
   for(var i = 0; i <= source.count( 606, k, $x); i = i + 1)
    doc.out(source.value( 606, k, ($x[i]?" -- "$x[i])), Side2)
   doc.out(source.value( 606, k, ($z?" -- "$z)($y?" -- "$y)), Side2)
  }
 }
 if(source.exist( 607, 0))
 {
  if(s == 1)
   doc.out("+", Side2)
  s = 1
  k = source.count( 607) - 1
  for(var i = 0; i < k; i= i+1)
   doc.out(source.value( 607, i, $a($x?" - "$x)"+"), Side2)
  doc.out(source.value( 607, k,$a($x?" - "$x)), Side2)
 }
}