include "templates\common.tpl"
define function main()
{
 doc.Document(100, 180)
 doc.out(MARC(SOURCE, 999,0,$h"\n"$i), Side1)
 common(source)
}