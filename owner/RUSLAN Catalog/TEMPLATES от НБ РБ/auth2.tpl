include "templates\common.tpl"
define function main()
{
 doc.Document(100, 180)
 var k1
 var marker = marc(source)
 if(marcexist(source, 461, 0))
  doc.out(MARC(SOURCE, 461, 0, 701,1,"                                             "($a?$a" ")($b?$b" ") ($d?$d" ")($c?$c" ")($f?"("$f")")), Side1)
 else
  doc.out(MARC(SOURCE, 701,1,"                                             "($a?$a" ")($b?$b" ") ($d?$d" ")($c?$c" ")($f?"("$f")")), Side1)
 doc.out("\n", Side1)
 var k = MARCCOUNT(SOURCE, 999)
 for(var i = 0; i < k; i = i+1)
 {
  if((MARC(SOURCE,999,i,$b) == "���") | (MARC(SOURCE,999,i,$b) == "���") | (MARC(SOURCE,999,i,$b) == "���") | (MARC(SOURCE,999,i,$b) == "����"))
   doc.out(MARC(SOURCE, 999,i,($p?$p"   ")), Side1)
 }
 common(source)
}