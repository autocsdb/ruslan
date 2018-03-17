include "templates\common.tpl"
define function main()
{
doc.Document(100, 180)
var k = MARCCOUNT(SOURCE, 999)
var k1
var marker = marc(source)
for(var i = 0; i < k; i = i+1)
{
 if((MARC(SOURCE,999,i,$b) == "ÎÍË") | (MARC(SOURCE,999,i,$b) == "ÖÄÈ") | (MARC(SOURCE,999,i,$b) == "Í×Ç") | (MARC(SOURCE,999,i,$b) == "ÎÝÏÁ"))
  doc.out(MARC(SOURCE, 999,i,($p?$p"   ")), Side1)
}
common(source)

doc.out("\n", Side1)
var s = 0
if(MARCEXIST(SOURCE, 461, 0, 600, 0))
{
 s = 1
 k = MARCCOUNT(SOURCE, 461, 0, 600) - 1
 for(var i = 0; i < k; i= i+1)
 {
   doc.out(MARC(SOURCE, 461, 0, 600, i, $a($g?" "$g)(!$g?" "$b)($d?" "$d)($c?"("$c") ")($f?", "$f)"+"), Side1)
 }
 doc.out(MARC(SOURCE, 461, 0, 600, k, $a($g?" "$g)(!$g?" "$b)($d?" "$d)($c?"("$c") ")($f?", "$f)), Side1)
}
if(MARCEXIST(SOURCE, 461, 0, 601, 0))
{
 if(s == 1)
  doc.out("+", Side1)
 s = 1
 k = MARCCOUNT(SOURCE, 461, 0, 601) - 1
 for(var i = 0; i < k; i= i+1)
 {
   doc.out(MARC(SOURCE, 461, 0, 601, i, $a($b?" - "$b)($y?". "$y)"+"), Side1)
 }
 doc.out(MARC(SOURCE, 461, 0, 601, k, $a($b?" - "$b)($y?". "$y)), Side1)
}

if(MARCEXIST(SOURCE, 461, 0, 606, 0))
{
 if(s == 1)
  doc.out("+", Side1)
 s = 1
 k = MARCCOUNT(SOURCE, 461, 0, 606) - 1
 for(var i = 0; i < k; i= i+1)
 {
  if(MARC(SOURCE, 461, 0, 606, i, $2) == "spstush")
  {
   doc.out(MARC(SOURCE, 461, 0, 606), i, $a, Side1)
   for(var j = 0; j <= marccount(source, 461, 0, 606, i, $x); j = j + 1)
    doc.out(MARC(SOURCE, 461, 0, 606, i, ($x[j]?" -- "$x[j])), Side1)
   doc.out(MARC(SOURCE, 461, 0, 606, i, ($z?" -- "$z)($y?" -- "$y)" + "), Side1)
  }
 }
 if(MARC(SOURCE, 461, 0, 606, k, $2) == "spstush")
 {
   doc.out(MARC(SOURCE, 461, 0, 606), k, $a, Side1)
   for(var i = 0; i <= marccount(source, 461, 0, 606, k, $x); i = i + 1)
    doc.out(MARC(SOURCE, 461, 0, 606, k, ($x[i]?" -- "$x[i])), Side1)
   doc.out(MARC(SOURCE, 461, 0, 606, k, ($z?" -- "$z)($y?" -- "$y)), Side1)
 }
}
if(MARCEXIST(SOURCE, 461, 0, 607, 0))
{
 if(s == 1)
  doc.out("+", Side1)
 s = 1
 k = MARCCOUNT(SOURCE, 461, 0, 607) - 1
 for(var i = 0; i < k; i= i+1)
 {
   doc.out(MARC(SOURCE, 461, 0, 607, i, $x($y?".--"$y)($z?".--"$z)"+"), Side1)
 }
 doc.out(MARC(SOURCE, 461, 0, 607, k, $x($y?".--"$y)($z?".--"$z)), Side1)
}

if(MARCEXIST(SOURCE, 600, 0))
{
 if(s == 1)
  doc.out("+", Side1)
 s = 1
 k = MARCCOUNT(SOURCE, 600) - 1
 for(var i = 0; i < k; i= i+1)
 {
   doc.out(MARC(SOURCE, 600, i, $a($g?" "$g)(!$g?" "$b)($d?" "$d)($c?"("$c") ")($f?", "$f)"+"), Side1)
 }
 doc.out(MARC(SOURCE, 600, k, $a($g?" "$g)(!$g?" "$b)($d?" "$d)($c?"("$c") ")($f?", "$f)), Side1)
}
if(MARCEXIST(SOURCE, 601, 0))
{
 if(s == 1)
  doc.out("+", Side1)
 s = 1
 k = MARCCOUNT(SOURCE, 601) - 1
 for(var i = 0; i < k; i= i+1)
 {
   doc.out(MARC(SOURCE, 601, i, $a($b?" - "$b)($y?". "$y)"+"), Side1)
 }
 doc.out(MARC(SOURCE, 601, k, $a($b?" - "$b)($y?". "$y)), Side1)
}
if(MARCEXIST(SOURCE, 606, 0))
{
 if(s == 1)
  doc.out("+", Side1)
 s = 1
 k = MARCCOUNT(SOURCE, 606) - 1
 for(var i = 0; i < k; i= i+1)
 {
  if(MARC(SOURCE, 606, i, $2) == "spstush")
  {
   doc.out(MARC(SOURCE, 606, i, $a), Side1)
   for(var j = 0; j <= marccount(source, 606, i, $x); j = j + 1)
    doc.out(MARC(SOURCE, 606, i, ($x[j]?" -- "$x[j])), Side1)
   doc.out(MARC(SOURCE, 606, i, ($z?" -- "$z)($y?" -- "$y)" + "), Side1)
  }
 }
 if(MARC(SOURCE, 606, k, $2) == "spstush")
 {
   doc.out(MARC(SOURCE, 606, k, $a), Side1)
   for(var i = 0; i <= marccount(source, 606, k, $x); i = i + 1)
    doc.out(MARC(SOURCE, 606, k, ($x[i]?" -- "$x[i])), Side1)
   doc.out(MARC(SOURCE, 606, k, ($z?" -- "$z)($y?" -- "$y)), Side1)
 }
}
if(MARCEXIST(SOURCE, 607, 0))
{
 if(s == 1)
  doc.out("+", Side1)
 s = 1
 k = MARCCOUNT(SOURCE, 607) - 1
 for(var i = 0; i < k; i= i+1)
 {
   doc.out(MARC(SOURCE, 607, i, $a($x?" - "$x)"+"), Side1)
 }
 doc.out(MARC(SOURCE, 607, k,$a($x?" - "$x)), Side1)
}
}