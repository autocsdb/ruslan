include "templates\common.tpl"
define function main()
{
 doc.Document(100, 180)
 var k
 var k1
 if(MARCEXIST(SOURCE, 461, 0))
 {
  for(var i =0; i < marccount(source, 461, 0, 702); i = i + 1)
  { 
   if(MARC(SOURCE, 461, 0, 702,i,$4) == "340")
   {
    doc.out(MARC(SOURCE, 461, 0, 702,i,"                                             "($a?$a" ")($b?$b" ")($d?$d" ")($c?$c" ")($f?"("$f")")", ���.\n"), Side1)
    break
   }
  }
 }
 else
 {
  for(var i =0; i < marccount(source, 702); i = i + 1)
  {
   if(MARC(SOURCE, 702,i,$4) == "340")
   {
    doc.out(MARC(SOURCE, 702,i,"                                             "($a?$a" ")($b?$b" ")($d?$d" ")($c?$c" ")($f?"("$f")")", ���.\n"), Side1)
    break
   }
  }
 }
 k = MARCCOUNT(SOURCE, 999)
 doc.out("\n", Side1)
 for(var i = 0; i < k; i = i+1)
 {
  if((MARC(SOURCE,999,i,$b) == "���") | (MARC(SOURCE,999,i,$b) == "���") | (MARC(SOURCE,999,i,$b) == "���") | (MARC(SOURCE,999,i,$b) == "����"))
   doc.out(MARC(SOURCE, 999,i,($p?$p"   ")), Side1)
 }
 common(source)
}