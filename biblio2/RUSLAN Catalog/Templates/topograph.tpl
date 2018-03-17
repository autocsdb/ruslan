'Топографическая карточка 2
define function main()
{
 doc.Document(100, 180)
 var bookcount = 1
 if(source.exist(910, 0, $a))
  bookcount  = tonumber(source.value(910, 0, $a))
 
 var marker = source.value()
 var k
 var i
 var k2
 var j
  doc.ZoneSeparate(Side1, 7, HOR, Sideleft, Side1)
 doc.ZoneSeparate(Side1, 10, VER, Zone1, Zone2)
' doc.ZoneSeparate(Zone1, 35, HOR, Zone1, Zone7)
 doc.ZoneSeparate(zone2, 10, VER, Zone2, Zone3)
 doc.ZoneSeparate(zone3, 10, VER, Zone3, Zone4)
' doc.ZoneSeparate(Zone2, 17, HOR, Zone2, Zone5)
 doc.ZoneSeparate(Zone3, 12, HOR, Zone3, Zone6)
 doc.ZoneSeparate(Zone4, 10, VER, Zone4, Zone7) 

 
 ' авторский знак 093 a
doc.out(marc(source,093,0,$a), Zone3)  
 
 
 ' вывод классификационной части шифра
doc.out(source.value(686, 0, $a), Zone2)
 
 'Автор и инициалы



if(source.exist(461, 0))
{
	if(source.exist(461, 0, 500))
		{
			if(source.exist(461, 0, 710))
			doc.out(source.value(461, 0, 710, 0, $a($b?" ")$b". "), zone6, обычный)
			doc.out(source.value(461, 0, 500, 0, ($a?$a".")), zone6, обычный)
		}
	else
		{
			if((source.count(461, 0, 700) + source.count(461, 0, 701) + source.count(461, 0, 710) + source.count(461, 0, 711)) < 5)
				{
					if(source.exist( 461,0, 700, 0))
					doc.out(source.value(461, 0, 700, 0, $a($g?", "$g)(!$g?", "$b)"\n"), zone6, Обычный)
					else
						{
							if(source.value(461, 0, 710, 0, #1) == "1")
								{
									doc.out(source.value(461, 0, 710, 0, ($a?$a", ")($c?$c)(!$g?$b)($g?$g)"\n"), Zone6, Обычный)
									doc.out(source.value(461, 0, 710, 0, ($h?", "$h" ")($e|$f|$d?"("($d?$d",")($f?$f",")$e")")"\n"), Zone6, Обычный)
								}
							else
									doc.out(source.value(461, 0, 710, 0, ($a?$a". "(!$g?$b)($g?$g)"\n")), Zone6, Обычный)
						}
				} 
		}
	doc.out("    ", Zone9, Обычный)
	var s
'  for(s = 0; s < source.count(461, 0, 200,0,$a) - 1; s = s + 1)
'   doc.out(source.value(461, 0, 200,0,($a[s]?$a[s]"; ")), Zone6, Обычный)
'  doc.out(source.value(461, 0, 200,0,($a[s]?$a[s])), Zone6, Обычный)
	if((substring(marker, symbol, 8, 1) == "s") & (substring(marker, symbol, 9, 1) == "2"))
		{
			if(source.exist( 225))
			{
				var s
				for(var j = 0; j < source.count(225), j = j + 1)
				{
					var count225 = source.count(225, j)
					var bookname = ""
					for(s = 0; s < count225; s = s + 1)
					{
						if(sizeof(bookname) > 0)
							bookname = bookname + source.value(225, j, (@sis$a?"; "@s)(@sis$e?": "@s)(@sis$d?"="@s)(@sis$h?". "@s)(@sis$i?". "@s)(@sis$v?"; "@s))
						else
							bookname = ".-" + source.value(225, j, (@sis$a?@s)(@sis$e?@s)(@sis$d?@s)(@sis$h?@s)(@sis$i?@s)(@sis$v?@s))
					}
					doc.out(bookname, Zone6, Обычный)
				}
			}
			else
			{
				if(source.exist( 462))
				{
					var count200 = source.count(462, 0, 200, 0)
					var bookname = ""
					for(s = 0; s < count200; s = s + 1)
					{
						if(sizeof(bookname) > 0)
							bookname = bookname + source.value(462, 0, 200, 0, (@sis$a?"; "@s)(@sis$b?" :["@s"]")(@sis$e?": "@s)(@sis$d?"="@s)(@sis$h?". "@s)(@sis$i?". "@s))
						else
							bookname = source.value(462, 0, 200, 0, (@sis$a?@s)(@sis$b?" :["@s"]")(@sis$e?@s)(@sis$d?@s)(@sis$h?@s)(@sis$i?@s))
					}
					doc.out(bookname, zone6, Обычный)
				}
				else
				{
					if(source.exist(461))
					{
						var count200 = source.count(461, 0, 200, 0)
						var bookname = ""
						for(s = 0; s < count200; s = s + 1)
						{ 
							if(sizeof(bookname) > 0)
								bookname = bookname + source.value(461, 0, 200, 0, (@sis$a?"; "@s)(@sis$b?" :["@s"]")(@sis$e?": "@s)(@sis$d?"="@s)(@sis$h?". "@s)(@sis$i?". "@s))
							else
								bookname = source.value(461, 0, 200, 0, (@sis$a?@s)(@sis$b?" :["@s"]")(@sis$e?@s)(@sis$d?@s)(@sis$h?@s)(@sis$i?@s))
						}
						doc.out(bookname, zone6, Обычный)
					}
				}
			}
		}
  
  'конец автор и инициалы
 
 
 



	doc.setfont(zone1, "", -1, -1, 1)
	doc.setfont("Arial Unicode MS", 11) ' шрифт  Arial Unicode MS размер 11
'  doc.out("\n", zone6)

	var mass999 = newmass(0)
	k = source.count(999)
 'если есть поле 999 то выводим сиглу и инвентарный номер
	if(k > 1)
	{
		for(i =0; i < k; i = i + 1)
			add(mass999,marc(source,999, i,$p "   "$b)) 	
		k = userselect(mass999)
		doc.out(marc(source,999, k, $b), Zone1)
		doc.out(marc(source,999, 0, "  "$p), Zone1)
  
	}
	else
		doc.out(marc(source,999, 0, $b[0]"  "$p), Zone1)
 
 

'если есть поле 106 пишем букву Б
	if(Marcexist(source,106,0))
		doc.out("Б", Zone7)
	else
	{ ' если есть поле 126
		if(Marcexist(source,126,0))
		{
			if(SubString(marc(source,126,0,$a), symbol, 1, 1) == "b")
				doc.out("P", Zone7)
			if(SubString(marc(source,126,0,$a), symbol, 1, 1) == "c")
				doc.out("К", Zone7)
		}
	}
 
' вывод классификационной части шифра
 doc.out(source.value(686, 0, $a), Zone2)
 
 ' первичная интелектуальная ответственность не нужна
 'if(MARCEXIST(SOURCE,461, 0))
 '{
 ' if((source.count(461, 0, 700) + source.count(461, 0, 701) + source.count(461, 0, 710) + source.count(461, 0, 711)) < 5)
 ' {
 '  if(marcexist(source, 461,0, 700, 0))
 '   doc.out(MARC(SOURCE, 461, 0, 700, 0, $a" "$g), zone6)
 '  else
 '   doc.out(MARC(SOURCE, 461, 0, 710, 0, $a". "$g), zone6)
 ' }
  
  ' автор заглавие
	doc.out("    ", zone4)
  'var s
	for(s = 0; s < MARCCOUNT(SOURCE,461, 0, 200,0,$a) - 1; s = s + 1)
		doc.out(MARC(SOURCE,461, 0, 200,0,($a[s]?$a[s]"; ")), zone4)
	doc.out(MARC(SOURCE,461, 0, 200,0,($a[s]?$a[s])), zone4)
	doc.out("\n", zone4)
 }
 ' если 461 поля нет
 else
 {
	doc.setfont(zone1, "", -1, -1, 1)
	doc.setfont("Arial Unicode MS", 11) ' шрифт  Arial Unicode MS размер 11
	var mass999 = newmass(0)
	k = source.count(999)
 'если есть поле 999 то выводим сиглу и инвентарный номер
	if(k > 1)
	{
		for(i =0; i < k; i = i + 1)
			add(mass999,marc(source,999, i,$p "   "$b)) 	
		k = userselect(mass999)
		doc.out(marc(source,999, k, $b), Zone1)
		doc.out(marc(source,999, 0, "  "$p), Zone1)
  
	}
	else
		doc.out(marc(source,999, 0, $b[0]"  "$p), Zone1)
 
 
 
	if((source.count(700) + source.count(701) + source.count(710) + source.count(711)) < 5)
	{
		if(marcexist(source, 700, 0))
			doc.out(MARC(SOURCE, 700, 0, $a($g?", "$g)(!$g?" "$b)), zone6)
		else
			doc.out(MARC(SOURCE, 710, 0, $a". "($g?$g)(!$g?$b)), zone6)
	}
 }
 
doc.out("    ", zone4)
 
 
if(marcexist(source, 462))
{
	if((substring(marker, symbol, 8, 1) == "s") & (substring(marker, symbol, 9, 1) == "2"))
		doc.out(MARC(SOURCE,210,0,($d?$d".  ")), zone4)
	doc.out(MARC(SOURCE,462, 0, 200,0,$v), zone4)
	if(marc(source, 200, 0, #1) != "0")
		doc.out(": ", zone4)
 }
else
{
	if(marcexist(source, 461))
	{
		if((substring(marker, symbol, 8, 1) == "s") & (substring(marker, symbol, 9, 1) == "2"))
			doc.out(MARC(SOURCE,210,0,($d?$d",  ")), zone4)
		doc.out(MARC(SOURCE,461, 0, 200,0,$v"."), zone4)
		'if(marc(source, 200, 0, #1) != "0")			
			'doc.out(": ", zone4)
  }
}

 
 
 
 
 
 
 
 
 
 'отдельный код
 
if (!source.exist(461))
{
' вывод поля 200

	if(marc(source, 200, 0, #1) != "0")
	{
		var s = 0	
		for(s = 0; s < MARCCOUNT(SOURCE, 200,0,$a) - 1; s = s + 1)
			doc.out(MARC(SOURCE, 200,0,($a[s]?$a[s]"; ")), zone4)
		doc.out(MARC(SOURCE, 200,0,($a[s]?$a[s]" ")), zone4)
}
}

 
 if(source.exist(126))
  doc.out("\n" + marc(source,215, 0, ($a?"На "$a)), zone4)
  
 if(source.exist(106))
 {
  if(bookcount > 1)
  {
   var books = newmass(0)
   for(var i = 1; i <= bookcount; i = i + 1)
    add(books, "Кн. " + tostr(i))
   var book = userselect(books)
   doc.out("\n" + marc(source,215, 0, ($a?"В "$a)) + " " + books[book], zone4)
  }
 }


 
 'возраст
 doc.out("\n\n", Sideleft)
 
	
if(substring (source.value(100, 0, $a), symbol, 17, 2)	== " c")
	doc.out( "МЛ", Sideleft)
if(substring (source.value(100, 0, $a), symbol, 17, 2)	== " d")
	doc.out( "СР", Sideleft)
if(substring (source.value(100, 0, $a), symbol, 17, 2)	== " a")
	doc.out( "СТ", Sideleft)
	
	'substring (source.value(100, 0, $a), symbol, 17, 2)


' место издания год издания цена	 
if (source.exist(461, 0, 210, 0, $a))
	doc.out("       "+source.value(461, 0, 210, 0, $a) + " ", zone7)
else
	doc.out("       "+marc(source,210, 0, $a[0]) + " ", zone7)


if (source.exist(461, 0, 210, 0, $d))
	doc.out(source.value(461, 0, 210, 0, $d) + " ", zone7)
else
	doc.out(marc(source,210, 0, $d) + " ", zone7)

'doc.out(marc(source,210, 0, $a[0]) + " ", zone7)
doc.out(marc(source,999, 0, $u) + "р.", zone7)

	 
}