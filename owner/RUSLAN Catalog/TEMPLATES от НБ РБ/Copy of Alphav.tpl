include "templates\common1.tpl"
include "common1.tpl"
'ќсновна€
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
 doc.ZoneSeparate(Side1, 10, VER, Side1, side11)
 doc.ZoneSeparate(Side1, 10, VER, Zone1, Zone2)
 doc.ZoneSeparate(Zone1, 90, HOR, Zone3, Zone4)
 doc.ZoneSeparate(Zone2, 15, HOR, Zone7, Zone9)
 doc.ZoneSeparate(side2,50,ver,zone222,zone223)
 doc.ZoneSeparate(zone223,23,HOR,Zone21,Zone2n1)

 doc.ZoneSeparate(zone2n1,33,HOR,Zone22,Zone2n2)
 doc.ZoneSeparate(zone2n2,50,HOR,Zone23,Zone24)
 
 doc.out(source.value(999, 0, $h), Zone3)
 
 common(source)
 
 var price = ""
 if(source.exist(999))
  price = ":" + source.value(999, 0, $u )
 var tirag = ""
 
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

 var count606 = source.count(606)
 for(var i = 0; i < count606; i = i + 1)
  doc.out(source.value(606, i, $a) + "\n", zone9)

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

 doc.out("\n\n", Zone9)

 k = source.count(686) - 1
 'сколько надо пробелов?
 for(var i =0; i < k; i =i +1)
 {
  if(source.value(686, i, $2) == "rubbk") 
   dlina_stroki=dlina_stroki+sizeof(source.value(686,i,$a))
 }

 'выводим пробелы
 if (k==0) dlina_stroki=dlina_stroki+sizeof(source.value(686,0,$a))+sizeof(source.value(999,0,$u))
 if (k>0) dlina_stroki=dlina_stroki+sizeof(source.value(999,0,$u))
 for (i=0; i<55-dlina_stroki; i=i+1)
  doc.out(" ", Zone9)

 for(var i =0; i< k; i =i +1)
 {
  if(source.value(686, i, $2) == "rubbk") 
   doc.out(source.value(686, i, $a) + "+", Zone9)
 }
 if(source.value(686, k, $2) == "rubbk")
  doc.out(source.value(686, k, $a), Zone9)

 k = source.count(675) - 1
 for(var i =0; i< k; i =i +1)
  doc.out(source.value(675, i, $a) + "+", Zone9)
 doc.out(source.value(675, k, $a), Zone9)

 k = source.count(999)
' var jj=0
 for(i =0; i < k; i = i + 1)
 {
  doc.out(source.value(999, i, $b"-"$p"  "), side11)
  

'  jj=jj+1 
'  if(source.value(999, i, $p) != "15")
'  {
'   
'   if ((jj>6) &  (jj<13)) doc.out(source.value(999, i, $b"  "$p"\n"), Zone22)
'   if ((jj>12) & (jj<19)) doc.out(source.value(999, i, $b"  "$p"\n"), Zone23)
'   if (jj>18)doc.out(source.value(999, i, $b"  "$p"\n"), Zone24)
'   if (jj<7) doc.out(source.value(999, i, $b"  "$p"\n"), Zone21)
'  }else
'  {
'   if ((jj>6) &  (jj<13)) doc.out(source.value(999, i, $b"\n"), Zone22)
'   if ((jj>12) & (jj<19)) doc.out(source.value(999, i, $b"\n"), Zone23)
'   if (jj>18)doc.out(source.value(999, i, $b"\n"), Zone24)
'   if (jj<7) doc.out(source.value(999, i, $b"\n"), Zone21)
'  }
 }
}
 
 
 
 
 
 
 
 
 
 