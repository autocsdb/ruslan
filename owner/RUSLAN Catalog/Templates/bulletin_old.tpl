include "templates\com_bul.tpl"


define function main()
{
 doc.NewFile("list.dot")
 if(sizeof(filename) == 0)
  filename = savedialog("Word файлы (*.doc)|*.doc", "doc")
 doc.Save(FileName)
 var objword = doc.oleobject()
 var app = objword.exec(propertyget, application)
 var options = app.propertyget(options)
 var CheckSpellingAsYouType = options.propertyget(CheckSpellingAsYouType)
 var CheckGrammarAsYouType = options.propertyget(CheckGrammarAsYouType)
 options.propertyset(CheckSpellingAsYouType, 0)
 options.propertyset(CheckGrammarAsYouType, 0)

 var splitter[2]
 splitter[0] = ":"
 splitter[1] = "("
 var udk = loadfromfile("UDK_BBK.txt")
 'var SOURCEsize = sizeof(SOURCE)
 var sizeudk = sizeof(udk)
 var k
 var i
 var i1
 var j
 var j1
 var Error
 var udkmass = newmass(0)
 var bbkmass = newmass(0)
 var udkSOURCE = newmass(0)
 var bbkSOURCE = newmass(0)
 var nobbk = newmass(0)
 var errbbk = newmass(0)
 var errudk = newmass(0)
 var errbbkname = newmass(0)
 var errudkname = newmass(0)
 var splitterplace
 var temstring
 var k1
 var curudk
 var Curudkname
 var class
 var curudkmass
 var e
 var minusflg
 var localcurudkname
 var nomerzapisi

 for(i = 0; i < sizeof(SOURCE); i = i + 1)
 {
 nomerzapisi = tostr(i+1)
 doc.out("\n"+tostr(i+1)+". ", Side1, Обычный) ' вывод номеров записей
 
 '!!!!!вставка из аналитической карточки!!!!
 
 var k = MARCCOUNT(SOURCE[i], 999)
 var headcount = 0 

 for(var i = 0; i < k ; i  = i + 1)
  doc.out(MARC(SOURCE[i], 999, 0, ($p?$p"   ")), Side1)
 'doc.out("\n", Side1)
 if(MARCEXIST(SOURCE[i], 710))
doc.out(SOURCE[i].value(710, 0, ($a?$a($c?", "$c)($d?" ("$d)($e?", "$e)($f?", "$f")")(!$g?$b)($g?$g))), Side1)
 if((SOURCE[i].count(700) + SOURCE[i].count(701)) < 5)
 {
'**************запятая после автора*********************
  if(MARCEXIST(SOURCE[i], 700, 0, $a))
	doc.out(MARC(SOURCE[i], 700, 0, $a", "$b), Side1)
'*******************************************************
 }
 if(!MARCEXIST(SOURCE[i], 200, 0, $f))
  doc.out(MARC(SOURCE[i], 200, 0, $g" "), Side1)
 if(MARCEXIST(SOURCE[i], 710))
 doc.out("\n"+MARC(SOURCE[i], 200, 0, ($a?$a)($e?": "$e)), Side1)
else
 doc.out("\n   "+MARC(SOURCE[i], 200, 0, ($a?" "$a)($e?": "$e)), Side1)
 if((MARCEXIST(SOURCE[i], 700, 0, $a)) | (MARCEXIST(SOURCE[i], 701, 0, $a)))
  doc.out(MARC(SOURCE[i], 200, 0, ($g|$f?" / "($f?$f($g?)" ")$g)), Side1)
 doc.out(" // ", Side1)
 if(MARCEXIST(SOURCE[i], 463, 0))
 {
  if((MARCEXIST(SOURCE[i], 700, 0, $a)) & (!(MARCEXIST(SOURCE[i],701, 2, $a))))
   doc.out(MARC(SOURCE[i], 463, 0, 200,0,$f), Side1)
  if((MARCEXIST(SOURCE[i], 700, 0, $a)) & MARCEXIST(SOURCE[i],701, 2, $a) & (MARCEXIST(SOURCE[i], 710, 0, $a)))
   doc.out(MARC(SOURCE[i], 463, 0, 200,0,$f), Side1)
  if((!(MARCEXIST(SOURCE[i], 700, 0, $a))) & (MARCEXIST(SOURCE[i], 710, 2, $a)))
   doc.out(MARC(SOURCE[i], 463, 0, 200,0,$f), Side1)
  if(MARCEXIST(SOURCE[i], 461, 0))
  {
   doc.out(MARC(SOURCE[i], 461, 0, 200,0,$a), Side1)
   if(marcexist(SOURCE[i], 462, 0))
    doc.out(marc(SOURCE[i], 462, 0, 200, 0, ($h$a?". "$h": "$a)), Side1)
   doc.out(MARC(SOURCE[i], 463, 0, 210,0,($d?". - ")), Side1)
   var year = ""
   var qwerty = marccount(SOURCE[i], 463)
   for(var i = 0; i < qwerty; i = i+1)
   {
    if(MARC(SOURCE[i], 463, i, 210,0,$d) == year)
     doc.out(MARC(SOURCE[i], 463, i, 200,0,$a), Side1)
    if(MARC(SOURCE[i], 463, i, 210,0,$d) != year)
    {
     year = MARC(SOURCE[i], 463, i, 210,0,$d)
     doc.out(year, Side1)
     doc.out(MARC(SOURCE[i], 463, i, 200,0,($a?". - "$a)), Side1)
    }
    doc.out(MARC(SOURCE[i], 463, i, 200,0,($v?". - "$v)), Side1)
    if(i != qwerty - 1)
     doc.out("; ", Side1)
   }
  }
  k = MARCCOUNT(SOURCE[i], 463, 0, 205)
  for(var i = 0; i<k;i=i+1)
   doc.out(MARC(SOURCE[i], 463, 0, 205, i, ($a|$b?". - "$a($b?", "$b))), Side1)
  doc.out(MARC(SOURCE[i], 463, 0, 320, 0, ($a?" - "$a) ), Side1)
  doc.out(MARC(SOURCE[i], 463, 0, 305, 0, ($a?". - "$a) ), Side1)
  doc.out(MARC(SOURCE[i], 463, 0, 300, 0, ($a?". - "$a) ), Side1)
  k = MARCCOUNT(SOURCE[i], 463, 0, 10)
  for(var i = 0; i < k; i= i+1)
   doc.out(MARC(SOURCE[i], 463, 10, i, ($a?"\n ISBN "$a)($b?"\n ISBN "$b)), Side1)
  k = MARCCOUNT(SOURCE[i], 463, 0, 11)
  for(var i = 0; i < k; i= i+1)
   doc.out(MARC(SOURCE[i], 463, 0, 11, i, ($a?"\n ISSN "$a)($b?"\n ISSN "$b)), Side1)
 }
 var r = marccount(SOURCE[i], 225)
 if(r > 0)
 {
  doc.out(". - (", Side1) 
  for(var i = 0; i < r; i = i +1)
  { 
   if(i > 0)
    doc.out(marc(SOURCE[i], 225, i, ($a?". -"$a)), Side1)
   else
    doc.out(marc(SOURCE[i],225, i, $a), Side1)
  }
  doc.out(")", Side1) 
 }
 doc.out(marc(SOURCE[i],320, 0, ($a?". -"$a)), Side1)
 doc.out(".", Side1)
  
'	примечание
var k1 = SOURCE[i].count(300) 
var needspace = 1  
for(var i = 0; i < k1; i = i+1)
  {
   if(SOURCE[i].exist(300, i, $a))
   {
    if(needspace == 1)
    { 
     needspace = 0
     doc.out("\n    ", Side1)
    }
    else
     doc.out(". -", Side1)
    doc.out(SOURCE[i].value(300, i, $a), Side1)
   }
  }

'В карточке у библиографов после того как шрифт увеличили, 
'не всегда аннотация помещается на карточку, 
'поэтому аннотацию надо поднять сразу  после 
'бибописания также с красной строки  
'doc.out("\n", Side1)

k1 = SOURCE[i].count(330) 
needspace = 1  
for(var l = 0; l < k1; l = i+1)
  {
   if(SOURCE[i].exist(330, l, $a))
   {
    if(needspace == 1)
    { 
     needspace = 0
     doc.out("\n    ", Side1)
    }
    else
     doc.out(". -", Side1)
    doc.out(SOURCE[i].value(330, l, $a), Side1)
   }
  }
doc.out("\n", Side1)



' ----------------- - ББК - ----------------------
 var dlina_stroki=0
k = SOURCE[i].count(686)
 'сколько надо пробелов?
 for(var i =0; i < k; i =i +1)
 {
  if(SOURCE[i].value(686, i, $2) == "rubbk") 
   dlina_stroki=dlina_stroki+sizeof(SOURCE[i].value(686,i,$a))
 }
 '--------------выводим пробелы
 'for (var i=0; i<55-dlina_stroki; i=i+1)
 doc.out(" ", Side1)

 doc.out("ББК ", Side1)  
'-------------цикл по количеству 686 полей -
 for(var i =0; i< k; i =i +1)
 {
  if(SOURCE[i].value(686, i, $2) == "rubbk") 
    {	
	 var m = MARCCOUNT(SOURCE[i], 686,i,$a)
'-------------цикл по количеству $a подполей 
	 for(var j = 0; j < m; j= j+1)
	 {
	     doc.out(MARC(SOURCE[i], 686,i, $a[j]" "), Side1)
	    if (j != m-1)
	     doc.out("+ ", Side1)  
	 }
  if (i != k-1)
  doc.out("+ ", Side1) 
     }
 }
doc.out("\n", Side1)
 
'вставка из аналитической карточки

 }
 
 options.propertyset(CheckSpellingAsYouType, CheckSpellingAsYouType)
 options.propertyset(CheckGrammarAsYouType, CheckSpellingAsYouType)

 doc.Save()
 app.exec(procedure, run, "final")
}