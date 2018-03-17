define function main()
{
 if(!doc.isempty() )
 {
  var s = messagebox("Файл книги уже открыт. Создать новый?", "Создание книги суммарного учета", 4132)
  if(s != 6)
   return
 }

 doc.newfile("docs\ksutemplates\ksu.xls")
}
