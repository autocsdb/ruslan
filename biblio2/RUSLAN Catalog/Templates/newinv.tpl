define function main()
{
 if(!doc.isempty() )
 {
  var s = messagebox("Файл книги уже открыт. Создать новый?", "Создание инвентарной книги", 4132)
  if(s != 6)
   return
 }

 doc.newfile("docs\invtemplates\invbook.xls")
}
