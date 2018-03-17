define function main()
{
doc.clear()
var s  = doc.oleobject()
s = s.propertyget(activesheet)
doc.out("��� � " + grs(grsrec, 22, "______"), "A2")

var actdate = Grs(grsrec, 23, "________")
var actyear = substring(actdate, symbol, 1, 4)
var actmonth = substring(actdate, symbol, 5, 2)
if(actmonth == 01)
 actmonth = "������"	
if(actmonth == 02)
 actmonth = "�������"	
if(actmonth == 03)
 actmonth = "�����"	
if(actmonth == 04)
 actmonth = "������"	
if(actmonth == 05)
 actmonth = "���"	
if(actmonth == 06)
 actmonth = "����"	
if(actmonth == 07)
 actmonth = "����"	
if(actmonth == 08)
 actmonth = "�������"	
if(actmonth == 09)
 actmonth = "��������"	
if(actmonth == 10)
 actmonth = "�������"	
if(actmonth == 11)
 actmonth = "������"	
if(actmonth == 12)
 actmonth = "�������"	
var actday = substring(actdate, symbol, 7, 2)

actdate = "\"" + actday + "\" " + actmonth + " " + actyear + " �."

doc.out(actdate + " ���������_________________________________________________________", "A4")
doc.out("���������� ���, __________________________________________________________���.�������", "A5")
doc.out("��������������, __________________________________________���.�������� ����� ����������", "A6")
doc.out("_________________________��������� ��� � ������ � ������-����������� ���������� ��������", "A7")
doc.out("���������������� ������������ ����������, ���������� ��_________________________________", "A8")
doc.out("____________________________________________________________________________________", "A9")
doc.out("____________________________________________________________________________________", "A10")
doc.out("� ���������� " + tostr(tonumber(grs(grsrec, 27, "0")) + tonumber(grs(grsrec, 40, "0"))) + " ���. �� ����� " + tostr(tonumber(grs(grsrec, 28, "0")) + tonumber(grs(grsrec, 41, "0"))) + " ���.", "A11")


doc.out("������ � ����� ���������� �����:", "A14")
doc.out("�" + grs(grsrec, 22) + " �� " + actdate, "A15")

doc.out("���������� ���. "+ grs(grsrec, 27) + " �� " + grs(grsrec, 28) + " ���.", "A18")
doc.out("�������� � ��������� ��� ��", "A20")


var resultstring = ""
var Res = BILLSPSTU(Source, ToStr(BillNumb) + "/" + ToStr(Billdate), 999, $e, $b, $p, $v, $u, 30)
for(var i = 0; i < Sizeof(Res);i = i + 1)
{
 var CurDep = Res[i]
 resultstring = resultstring + " " + CurDep[1]
}
doc.out(resultstring, "b20")

doc.out("____________________________________________________________________________________", "A22")
doc.out("�� ������ ��� �� ������� " + grs(grsrec, 40, "0") + " ���. �� ����� " + grs(grsrec, 41, "0") + " ���.", "A24")
doc.out("____________________________________________________________________________________", "A25")
doc.out("___________________________________________", "A27")
doc.out("___________________________________________", "A29")
doc.out("�������� ���:", "A32")
doc.out("���.������� ��������������:", "A34")
doc.out("���.�������� �����", "A36")

var cols = s.exec(function, columns)
var col = cols.exec(propertyget, item, 1)
col.exec(propertyset, columnwidth, 35)

col = cols.exec(propertyget, item, 2)
col.exec(propertyset, columnwidth, 50)

var range = s.exec(propertyget, range, "a2:b2")
range.exec(Procedure, merge)
range.exec(propertyset, VerticalAlignment, -4108)
range.exec(propertyset, HorizontalAlignment, -4108)

for(var i = 3; i < 12; i = i +1)
{
 var rangetext = "a" + tostr(i) + ":b" + tostr(i)
 range = s.exec(propertyget, range, rangetext)
 range.exec(Procedure, merge)
 range.exec(propertyset, VerticalAlignment, -4108)
}

for(var i = 12; i < 20; i = i +1)
{
 var rangetext = "a" + tostr(i) + ":b" + tostr(i)
 range = s.exec(propertyget, range, rangetext)
 range.exec(Procedure, merge)
 range.exec(propertyset, VerticalAlignment, -4108)
 range.exec(propertyset, HorizontalAlignment, -4108)
}


range = s.exec(propertyget, range, "a20:b20")
range.exec(propertyset, wraptext, 1)
range.exec(propertyset, VerticalAlignment, -4160)

for(var i = 21; i < 40; i = i +1)
{
 var rangetext = "a" + tostr(i) + ":b" + tostr(i)
 range = s.exec(propertyget, range, rangetext)
 range.exec(Procedure, merge)
 range.exec(propertyset, VerticalAlignment, -4108)
}

}