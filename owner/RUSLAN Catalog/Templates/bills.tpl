define function main()
{
 doc.clear()
 doc.out("���� �", "C1")
 doc.out(ToStr(BillNumb), "D1")
 doc.out(BillOpenDate, "F1")
 doc.out("����� �����������", "A4")
 doc.out(ToStr(BillSumCount), "C4")
 doc.out("�����", "A5")
 doc.out(ToStr(BillSumPrice), "C5")
 doc.out("��������������", "A7")
 doc.out("����������,����������� �� ������� ���������,", "C10")
 doc.out("  ������� � �������� � ��������� ���������", "C11")
 doc.out("    ������� ��������������� ����������", "C12")
 doc.out("�����", "A14")
 doc.out("����������� ������", "B14")
 doc.out("���-��", "G14")
 doc.out("�����", "H14")
 var Res = BILLSPSTU(Source, ToStr(BillNumb) + "/" + ToStr(Billdate), 999, $e, $b, $p, $v, $u, 30)
 var CurDep
 var s = 15
 var LastRow = 14
 var AllSumPrice = "0"
 var AllSumCount = "0"
 doc.drawborder("A" + ToStr(LastRow) + ":A" + ToStr(s - 1))

 var oleobject = doc.oleobject()
 oleobject = oleobject.propertyget(activesheet)

 
 var rangetext = "H" + ToStr(LastRow + 1) + ":H" + ToStr(LastRow + s)
 var range = oleobject.exec(propertyget, range, rangetext)
 range.exec(propertyset, Numberformat, "0,00")

 for(var i = 0; i < Sizeof(Res);i = i + 1)
 {
  CurDep = Res[i]
  if(CurDep[0] != "")
  { 
   doc.drawborder("A" + ToStr(s) + ":H" + ToStr(s))
   if(LastRow > 14)
   {
    doc.out("�����:", "F" + ToStr(s))
    doc.out("=SUM(G" + ToStr(LastRow) + ":G" + ToStr(S - 1) + ")"  , "G" + ToStr(s))
    doc.out("=SUM(H" + ToStr(LastRow) + ":H" + ToStr(S - 1) + ")"  , "H" + ToStr(s))
    AllSumCount = AllSumCount + "+G" + ToStr(s)	
    AllSumPrice = AllSumPrice + "+H" + ToStr(s)	
    doc.drawborder("A" + ToStr(LastRow) + ":A" + ToStr(s - 1))
   } 
   s = s + 1
   LastRow = s
  }
  doc.out(CurDep[0], "A" + ToStr(s))
  doc.out(CurDep[1], "B" + ToStr(s))
  doc.out(ToStr(CurDep[2]), "G" + ToStr(s))
  doc.out(ToStr(CurDep[3]), "H" + ToStr(s))
  s = s + 1
 }

 if(LastRow > 0)
 {
  doc.out("�����:", "F" + ToStr(s))
  doc.out("=SUM(G" + ToStr(LastRow) + ":G" + ToStr(S - 1) +")" , "G" + ToStr(s))
  doc.out("=SUM(H" + ToStr(LastRow) + ":H" + ToStr(S - 1) +")" , "H" + ToStr(s))
  AllSumCount = AllSumCount + "+G" + ToStr(s)	
  AllSumPrice = AllSumPrice + "+H" + ToStr(s)	
  doc.drawborder("A" + ToStr(LastRow) + ":A" + ToStr(s - 1))
  doc.drawborder("A" + ToStr(s) + ":H" + ToStr(s))
 } 
 doc.out("�����:", "F" + ToStr(s + 2))
 doc.out("=" + AllSumCount, "G" + ToStr(s + 2))
 doc.out("=" + AllSumPrice, "H" + ToStr(s + 2))

 doc.drawborder("A14:H" + ToStr(s + 2))
 doc.drawborder("A" + ToStr(s) + ":H" + ToStr(s + 1))
 doc.drawborder("H14:H" + ToStr(s + 2))
 doc.drawborder("G14:G" + ToStr(s + 2))
}