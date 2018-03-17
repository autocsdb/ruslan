define function main()
{
 doc.NewFile("personal.dot")
 if(sizeof(filename) == 0)
  filename = savedialog("Word файлы (*.doc)|*.doc", "doc")
 doc.Save(FileName)

 var s = sizeof(source)
 for(var i = 0; i < s; i = i+ 1)
 {
  doc.out("\n\n\n   " + marc(source[i], 200, 0, $a), side1, Name)
  doc.out(marc(source[i], 310, 0, ($a?" ("$a")")), side1, normal)

  doc.out(marc(source[i], 200, 0, (!$g?" "$b)($g?" "$g)($f?" ("$f") ")($c?" --"$c)), side1, normal)
  doc.out("\n   " + marc(source[i], 810, 0, $a), side1, normal)
  doc.out("\n   " + marc(source[i], 300, 0, $a), side1, примечания)
 }
}