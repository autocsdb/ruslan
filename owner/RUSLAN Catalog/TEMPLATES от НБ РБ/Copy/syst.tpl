include "templates\common.tpl"
define function main()
{
 doc.Document(100, 180)
 var k = MARCCOUNT(SOURCE, 999)
 var k1
 for(var i = 0; i < k; i = i+1)
 {
  if((MARC(SOURCE,999,i,$b) == "ÎÍË") | (MARC(SOURCE,999,i,$b) == "ÖÄÈ") | (MARC(SOURCE,999,i,$b) == "Í×Ç") | (MARC(SOURCE,999,i,$b) == "ÎÝÏÁ"))
   doc.out(MARC(SOURCE, 999,i,($p?$p"   ")), Side1)
 }
 common(source)
 doc.out("\n ", side1)
 if(MARCEXIST(SOURCE,675, 0))
 {
  k = MARCCOUNT(SOURCE,675) - 1
  for(var i = 0; i < k; i= i+1)
   doc.out(MARC(SOURCE,675, i, ($a?$a" + ")), side1)
  doc.out(MARC(SOURCE,675, k, $a), side1)
 }
 if(MARCEXIST(SOURCE,461, 0, 675, 0))
 {
  k = MARCCOUNT(SOURCE,461, 0, 675) - 1
  for(var i = 0; i < k; i= i+1)
   doc.out(MARC(SOURCE,461, 0, 675, i, ($a?$a" + ")), side1)
  doc.out("\n" + MARC(SOURCE,461, 0, 675, k, $a), side1)
 }
 if(MARCEXIST(SOURCE, 686, 0))
 {
  doc.out("\n ", side1)
  k = MARCCOUNT(SOURCE, 686) - 1
  for(var i = 0; i < k; i= i+1)
  {
   if(MARC(SOURCE, 686, i, $2) == "rubbk")
    doc.out(MARC(SOURCE, 686, i, ($a?"ÁÁÊ "$a" + ")), side1)
  }
  if(MARC(SOURCE, 686, k, $2) == "rubbk")
   doc.out(MARC(SOURCE, 686, k, ($a?"ÁÁÊ "$a)), side1)
 }
 if(MARCEXIST(SOURCE, 461, 0, 686, 0))
 {
  k = MARCCOUNT(SOURCE, 461, 0, 686) - 1
  for(var i = 0; i < k; i= i+1)
  {
   if(MARC(SOURCE, 461, 0, 686, i, $2) == "rubbk")
    doc.out(MARC(SOURCE, 461, 0, 686, i, ($a?"ÁÁÊ "$a" + ")), side1)
  }
  if(MARC(SOURCE, 461, 0, 686, k, $2) == "rubbk")
   doc.out(MARC(SOURCE, 461, 0, 686, k, ($a?"ÁÁÊ "$a)), side1)
 }
}