define function main()
{
 if(!doc.isempty() )
 {
  var s = messagebox("���� ����� ��� ������. ������� �����?", "�������� ����������� �����", 4132)
  if(s != 6)
   return
 }

 doc.newfile("docs\invtemplates\invbook.xls")
}
