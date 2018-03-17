include "templates\common1.tpl"
include "common1.tpl"
'Основная без инвентарных
define function main()
{
 var marker = source.value()
 doc.Document(100, 180)
 var k
 var k1
 var i
 var k2
 var j
 var dlina_stroki=0
 doc.ZoneSeparate(Side1, 75, VER, Side1, side11)
 doc.ZoneSeparate(Side1, 10, VER, Zone1, Zone2)
 doc.ZoneSeparate(Zone1, 90, HOR, Zone3, Zone4)
 doc.ZoneSeparate(Zone2, 15, HOR, Zone7, Zone9)
 doc.ZoneSeparate(side2,50,ver,zone222,zone223)
 doc.ZoneSeparate(zone223,23,HOR,Zone21,Zone2n1)

 doc.ZoneSeparate(zone2n1,33,HOR,Zone22,Zone2n2)
 doc.ZoneSeparate(zone2n2,50,HOR,Zone23,Zone24)

'для ББК
 doc.ZoneSeparate(Zone9, 90, VER, Zone9,Zone92) 
doc.setfont(zone92, "", -1, -1, 2)
'для ISBN
' doc.ZoneSeparate(Zone9, 90, VER, Zone9,Zone93) 

 doc.out(source.value(999, 0, $h), Zone3)

 common(source)
var headcount = 0 
 var price = ""
 if(source.exist(999))
 {
  if((MARC(SOURCE, 101, 0, $a) == "bak")|(MARC(SOURCE, 101, 0, $a) == "tar")) 
  price = ": " + source.value(999, 0, $u )+" h." 
  else
  price = ": " + source.value(999, 0, $u )+" р." 
}
 var tirag = ""
 doc.setfont(Zone9,"Arial Unicode MS", 8)
 k = source.count(461, 0, 10)
 var ndpl = 0
 for(var i = 0; i < k; i= i+1)
 {
  if(ndpl)
  doc.out("; ", Zone9)  
  if(source.exist(461, 0, 10, i, $a$b)& ndpl == 0)
  {
   doc.out("    ", zone9)
   ndpl = 1
  }
  doc.out(source.value(461, 0, 10, i, ($a|$b?"ISBN ")($a?" "$a)($b?" "$b)), Zone9)
  if(source.exist(461, 0, 10, i, $9))
   tirag = source.value(461, 0, 10, i, ($9?", "$9))
 }

 k = source.count(10)
 for(var i = 0; i < k; i= i+1)
 {
  if(ndpl)
   doc.out("; ", Zone9)  
  if(source.exist( 10, i, $a$b)& ndpl == 0)
  {
   doc.out("    ", zone9)
   ndpl = 1
  }
  doc.out(source.value( 10, i, ($a|$b?"ISBN ")($a?" "$a)($b?" "$b)), Zone9)
  if(source.exist( 10, i, $9))
   tirag = source.value( 10, i, ($9?", "$9))
 }

 if(ndpl)
  doc.out(price + tirag, Zone9)

 k = source.count(461, 0, 11)
 doc.out("\n", zone9)
 tirag = ""
 ndpl = 0
 for(var i = 0; i < k; i= i+1)
 {
  if(ndpl)
   doc.out("; ", Zone9)  
  if(source.exist(461, 0, 11, i, $a$b)& ndpl == 0)
  {
   doc.out("    ", zone9)
   ndpl = 1
  }
  doc.out(source.value(461, 0, 11, i, ($a|$b?"ISSN ")($a?" "$a)($b?" "$b)), Zone9)
  if(source.exist( 461, 0, 11, i, $9))
   tirag = source.value( 461, 0, 11, i, ($9?", "$9))
 }

 k = source.count(11)
 for(var i = 0; i < k; i= i+1)
 {
  if(ndpl)
   doc.out("; ", Zone9)  
  if(source.exist( 11, i, $a$b) & ndpl == 0)
  {
   doc.out("    ", zone9)
   ndpl = 1
  }
  doc.out(source.value(11, i, ($a|$b?"ISSN ")($a?" "$a)($b?" "$b)), Zone9)
  if(source.exist( 11, i, $9))
   tirag = source.value( 11, i, ($9?", "$9))
 }
 if(ndpl)
  doc.out(price + tirag, Zone9)

doc.setfont(Zone9,"Arial Unicode MS", 10)  
'				начало вставки - предмет

var s = 0
if(MARCEXIST(SOURCE, 461, 0, 600, 0))
{
 s = 1
 k = MARCCOUNT(SOURCE, 461, 0, 600)
 for(var i = 0; i < k; i= i+1)
 {
headcount = headcount +1  
doc.out(tostr(headcount), zone9)
 doc.out(". ", zone9)    
 doc.out(MARC(SOURCE, 461, 0, 600, i, $a($g?" "$g)(!$g?" "$b)($d?" "$d)($c?"("$c") ")($f?", "$f)"+"), zone9)
 }
 doc.out(MARC(SOURCE, 461, 0, 600, k, $a($g?" "$g)(!$g?" "$b)($d?" "$d)($c?"("$c") ")($f?", "$f)),zone9)
}
if(MARCEXIST(SOURCE, 461, 0, 601, 0))
{
 if(s == 1)

 s = 1
 k = MARCCOUNT(SOURCE, 461, 0, 601)
 for(var i = 0; i < k; i= i+1)
 {
headcount = headcount +1  
doc.out(tostr(headcount), zone9)
 doc.out(". ", zone9)    
 doc.out(MARC(SOURCE, 461, 0, 601, i, $a($b?" - "$b)($y?". "$y)"+"), zone9)
 }
 doc.out(MARC(SOURCE, 461, 0, 601, k, $a($b?" - "$b)($y?". "$y)), zone9)
}

if(MARCEXIST(SOURCE, 461, 0, 606, 0))
{
 if(s == 1)

 s = 1
 k = MARCCOUNT(SOURCE, 461, 0, 606)
 for(var i = 0; i < k; i= i+1)
 {
'  if(MARC(SOURCE, 461, 0, 606, i, $2) == "nlrb_sh")
'  {
headcount = headcount +1  
doc.out(tostr(headcount), zone9)
 doc.out(". ", zone9)    
 doc.out(MARC(SOURCE, 461, 0, 606), i, $a, zone9)
   for(var j = 0; j <= marccount(source, 461, 0, 606, i, $x); j = j + 1)
    doc.out(MARC(SOURCE, 461, 0, 606, i, ($x[j]?" -- "$x[j])), zone9)
   doc.out(MARC(SOURCE, 461, 0, 606, i, ($z?" -- "$z)($y?" -- "$y)" + "), zone9)
'  }
 }
' if(MARC(SOURCE, 461, 0, 606, k, $2) == "nlrb_sh")
'{
   doc.out(MARC(SOURCE, 461, 0, 606), k, $a, zone9)
   for(var i = 0; i <= marccount(source, 461, 0, 606, k, $x); i = i + 1)
    doc.out(MARC(SOURCE, 461, 0, 606, k, ($x[i]?" -- "$x[i])), zone9)
   doc.out(MARC(SOURCE, 461, 0, 606, k, ($z?" -- "$z)($y?" -- "$y)),zone9)
' }
}
if(MARCEXIST(SOURCE, 461, 0, 607, 0))
{
 if(s == 1)

 s = 1
 k = MARCCOUNT(SOURCE, 461, 0, 607) 
 for(var i = 0; i < k; i= i+1)
 {
headcount = headcount +1  
doc.out(tostr(headcount), zone9)
 doc.out(". ", zone9)    
 doc.out(MARC(SOURCE, 461, 0, 607, i, $x($y?".--"$y)($z?".--"$z)"+"), zone9)
 }
 doc.out(MARC(SOURCE, 461, 0, 607, k, $x($y?".--"$y)($z?".--"$z)), zone9)
}

if(MARCEXIST(SOURCE, 600, 0))
{
 if(s == 1)

 s = 1
 k = MARCCOUNT(SOURCE, 600)

 for(var i = 0; i < k; i= i+1)
 {
headcount = headcount +1  
doc.out(tostr(headcount), zone9)
 doc.out(". ", zone9)
 doc.out(MARC(SOURCE, 600, i, $a($g?", "$g)(!$g?" "$b)($d?" "$d)($c?"("$c") ")($f?", "$f)" "), zone9)
 doc.out(". ", zone9)  
 }
 doc.out(MARC(SOURCE, 600, k, $a($g?", "$g)(!$g?" "$b)($d?" "$d)($c?"("$c") ")($f?", "$f)), zone9)
}
if(MARCEXIST(SOURCE, 601, 0))
{
 if(s == 1)

 s = 1
 k = MARCCOUNT(SOURCE, 601)
 for(var i = 0; i < k; i= i+1)
 {
headcount = headcount +1  
doc.out(tostr(headcount), zone9)
 doc.out(". ", zone9)  
 doc.out(MARC(SOURCE, 601, i, $a($b?" - "$b)($y?". "$y)"+"), zone9)
 doc.out(". ", zone9)  
 }
 doc.out(MARC(SOURCE, 601, k, $a($b?" - "$b)($y?". "$y)), zone9)
}
if(MARCEXIST(SOURCE, 606, 0))
{
 if(s == 1)

'  doc.out(" - -", zone9)
'  doc.out("+", zone9)
 s = 1
 k = MARCCOUNT(SOURCE, 606)
 for(var i = 0; i < k; i= i+1)
 {
'  if(MARC(SOURCE, 606, i, $2) == "nlrb_sh")
'  {
headcount = headcount +1  
doc.out(tostr(headcount), zone9)
 doc.out(". ", zone9)  
   doc.out(MARC(SOURCE, 606, i, $a), zone9)
   for(var j = 0; j <= marccount(source, 606, i, $x); j = j + 1)
    doc.out(MARC(SOURCE, 606, i, ($x[j]?" -- "$x[j])),zone9)
   doc.out(MARC(SOURCE, 606, i, ($z?" -- "$z)($y?" -- "$y)" "), zone9)

' doc.out(tostr( j+1), zone9)
 doc.out(". ", zone9)
'  }
 }
' if(MARC(SOURCE, 606, k, $2) == "nlrb_sh")
' {
   doc.out(MARC(SOURCE, 606, k, $a), zone9)
   for(var i = 0; i <= marccount(source, 606, k, $x); i = i + 1)
    doc.out(MARC(SOURCE, 606, k, ($x[i]?" -- "$x[i])), zone9)
   doc.out(MARC(SOURCE, 606, k, ($z?" -- "$z)($y?" -- "$y)), zone9)
' }
}

' конец вставки -предмет

 doc.out(source.value(999, 0,$i), Zone7)
 doc.out("\n\n\n\n\n\n\n\n", Zone7)
 var count686 = source.count(686)
 var ns = 0
 for(var i = 0; i < count686; i = i + 1)
 {
  if(source.value(686, i, $2) == "tspusrl")
  {
   if(ns == 1)
    doc.out(" + ", zone7)
   doc.out(source.value(686, i, $a), zone7)
   ns = 1
  }
 }


 k = source.count(686) - 1

 for(var i =0; i< k; i =i +1)
 {
  if(source.value(686, i, $2) == "rubbk") 
doc.out("ББК ", Zone92)       
doc.out(source.value(686, i, $a) + "+", Zone92)
 }
 if(source.value(686, k, $2) == "rubbk")
  doc.out("ББК ", Zone92)    
doc.out(source.value(686, k, $a), Zone92)

 k = source.count(675) - 1
 for(var i =0; i< k; i =i +1)
  doc.out(source.value(675, i, $a) + "+", Zone92)
 doc.out(source.value(675, k, $a), Zone92)

}
 
 
 
 
 
 
 
 
 
 