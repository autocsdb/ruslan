'аналитика на журнал 
' Зеленина Г.Н. 

define function main()
{
'doc.Document(120, 180)

	var str=""
	var k
	var l
	var last
	if(source.exist(700, 0, $a))
		str=str + source.value(700, 0, $a)
	if(source.exist(700, 0, $b))
		str=str +", "+ source.value(700, 0, $b)
	if(source.exist(700, 0, $c)|source.exist(700, 0, $g))
	{
		str=str +" ("
		if(source.exist(700, 0, $g))
			str=str + source.value(700, 0, $g)
		if(source.exist(700, 0, $c))
			str=str +", "+ source.value(700, 0, $c)
		str=str +")."
	}
	if(source.exist(710, 0, $a))
		str=str +" "+ source.value(710, 0, $a)
	if(source.exist(710, 0, $b))
		str=str +". "+ source.value(710, 0, $b)
	if ((substring(str, symbol, sizeof(str), 1)!=".")&(str!=""))
		str=str+"."
	if(str!="")
		doc.out(str+"\n	", side1)
	str=""
'===============================
	if(source.exist(200, 0, $a))
		str=str + source.value(200, 0, $a)
	if(source.exist(200, 0, $b))
		str=str+" ["+source.value(200,0,$b)+"]"
	if(source.exist(200, 0, $d))
		str=str + " = " + source.value(200, 0, $d)
	if(source.exist(200, 0, $e))
		str=str + " : " + source.value(200, 0, $e)
	if(source.exist(200, 0, $f))
		str=str + " / " + source.value(200, 0, $f)
	if(source.exist(200, 0, $g))
		str=str+" ; "+source.value(200, 0, $g)
	if(source.exist(461,0,200,0,$a))
		str=str + " // " + source.value(461,0,200,0,$a)
	if(source.exist(461,0,200,0,$d))
		str=str + " = " + source.value(461,0,200,0,$d)
	if(source.exist(461,0,200,0,$h))
		str=str + ". " + source.value(461,0,200,0,$h)
	if(source.exist(461,0,200,0,$i))
		str=str + ", " + source.value(461,0,200,0,$i)
	if(source.exist(463,0,210,0,$d))
		str=str + ". - " + source.value(463,0,210,0,$d)
	if(source.exist(463,0,200,0,$a))
		str=str + ". - " + source.value(463,0,200,0,$a)
	if(source.exist(463,0,200,0,$v))
		str=str + ". - " + source.value(463,0,200,0,$v)
	if(source.exist(300, 0, $a))
		str=str + ". - " + source.value(300, 0, $a)
	if(source.exist(320, 0, $a))
		str=str + ". - " + source.value(320, 0, $a)
	if(source.exist(461,0,011,0,$a))
		str=str+". - "+source.value(461,0,011,0,$a)
	if ((substring(str, symbol, sizeof(str), 1)!=".")&(str!=""))
		str=str+"."
	if(str!="")
		doc.out(str+"\n	", side1)
	str=""
	if(source.exist(330,0,$a))
		str=str+"   "+source.value(330,0,$a)
	if ((substring(str, symbol, sizeof(str), 1)!=".")&(str!=""))
		str=str+"."
	if(str!="")
		doc.out(str+"\n	", side2)
	str=""
	if(source.exist(606,0,$a))
		str=str+source.value(606,0,$a)
	if(source.exist(606,0,$x))
		str=str+" - "+source.value(606,0,$x)
	if(source.exist(606,0,$y))
		str=str+" - "+source.value(606,0,$y)
	if(source.exist(606,0,$z))
		str=str+" - "+source.value(606,0,$z)
	if ((substring(str, symbol, sizeof(str), 1)!=".")&(str!=""))
		str=str+"."
	if(str!="")
		doc.out(str+"\n", side2)
	str=""

	if(source.exist(610,0,$a))
		str=str+source.value(610,0,$a)
	for(var j = 0; j < (MarcCount(source,610)-1); j = j + 1)
	{
		if(source.exist(610, j+1, $a))
		str=str+" + "+source.value(610,j+1,$a)
	}	
	if ((substring(str, symbol, sizeof(str), 1)!=".")&(str!=""))
		str=str+"."
	if(str!="")
		doc.out(str+"\n			", side2)
'30.03.2010 - добавлена проверка первого вхождения во избежании лишних плюсов
	str=""
	var tmp=0	
	if(source.exist(686,0,$a))
	{
		str=str+"ББК "+source.value(686,0,$a)
		tmp=1
	}
	for(var j = 0; j < (MarcCount(source,686)-1); j = j + 1)
	{
		if (tmp==1)
			doc.out(" + ")
		if (tmp==0)
			str=str+"ББК "
		if(source.exist(686, j+1, $a))
		{
			str=str+source.value(686,j+1,$a)
			tmp=1
		}
	}		
	if ((substring(str, symbol, sizeof(str), 1)!=".")&(str!=""))
		str=str+"."
	if(str!="")
		doc.out(str+"\n			", side2)
	str=""

	if(source.exist(675,0,$a))
		str=str+"УДК "+source.value(675,0,$a)
	for(var j = 0; j < (MarcCount(source,675)-1); j = j + 1)
	{
		if(source.exist(675, j+1, $a))
			str=str+" + "+source.value(675,j+1,$a)
	}		
	if ((substring(str, symbol, sizeof(str), 1)!=".")&(str!=""))
		str=str+"."
	if(str!="")
		doc.out(str+"\n			", side2)
	str=""

	if(source.exist(676,0,$a))
		str=str+"ДКД "+source.value(676,0,$a)
	for(var j = 0; j < (MarcCount(source,676)-1); j = j + 1)
	{
		if(source.exist(676, j+1, $a))
			str=str+" + "+source.value(676,j+1,$a)
	}		
	if ((substring(str, symbol, sizeof(str), 1)!=".")&(str!=""))
		str=str+"."
	if(str!="")
		doc.out(str, side2)
	str=""
}