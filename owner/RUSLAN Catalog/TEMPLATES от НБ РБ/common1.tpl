' ����� ����� ��� ���� ��������
define function common(source)
{
 var marker = source.value()
 var k
 var k1
 if(source.exist(461, 0))
 {
  if(source.exist(461, 0, 500))
  {
   if(source.exist(461, 0, 710))
    doc.out(source.value(461, 0, 710, 0, $a($b?" ")$b". "), zone9, �������)
   doc.out(source.value(461, 0, 500, 0, ($a?$a".")), zone9, �������)
  }
  else
  {
   if((source.count(461, 0, 700) + source.count(461, 0, 701) + source.count(461, 0, 710) + source.count(461, 0, 711)) < 5)
   {
    if(source.exist( 461,0, 700, 0))
     doc.out(source.value(461, 0, 700, 0, $a($g?", "$g)(!$g?", "$b)"\n"), zone9, �������)
    else
    {
     if(source.value(461, 0, 710, 0, #1) == "1")
     {
      doc.out(source.value(461, 0, 710, 0, ($a?$a", ")($c?$c)(!$g?$b)($g?$g)"\n"), Zone9, �������)
      doc.out(source.value(461, 0, 710, 0, ($h?", "$h" ")($e|$f|$d?"("($d?$d",")($f?$f",")$e")")"\n"), Zone9, �������)
     }
     else
      doc.out(source.value(461, 0, 710, 0, ($a?$a". "(!$g?$b)($g?$g)"\n")), Zone9, �������)
    }
   } 
  }
  doc.out("    ", Zone9, �������)
  var s
'  for(s = 0; s < source.count(461, 0, 200,0,$a) - 1; s = s + 1)
'   doc.out(source.value(461, 0, 200,0,($a[s]?$a[s]"; ")), Zone9, �������)
'  doc.out(source.value(461, 0, 200,0,($a[s]?$a[s])), Zone9, �������)
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
       bookname = ".--" + source.value(225, j, (@sis$a?@s)(@sis$e?@s)(@sis$d?@s)(@sis$h?@s)(@sis$i?@s)(@sis$v?@s))
     }
     doc.out(bookname, Zone9, �������)
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
     doc.out(bookname, zone9, �������)
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
      doc.out(bookname, zone9, �������)
     }
    }
   }
  }else
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
    doc.out(bookname, zone9, �������)
   }
  }

  var count461200f = source.count(461, 0, 200, 0, $f)
  var nextotv = source.value(461, 0, 200, 0,($f|$g?"/ "$f[0]))
  for(var i = 1; i < count461200f; i = i + 1)
   nextotv = nextotv + source.value(461, 0,  200, 0,($f[i]?"; "$f[i]))

  var count461200g = source.count(461, 0, 200, 0, $g)
  for(var i = 0; i < count461200g; i = i + 1)
   nextotv = nextotv + source.value(461, 0, 200, 0,($g[i]?"; "$g[i]))
  
  doc.out(nextotv, Zone9, �������)
  var altotv=""
  if(source.exist( 461, 0, 712, 0, $a))
  {
   var podrc = source.count(461, 0, 712, 0, $b)
   altotv = source.value(461, 0, 712, 0, $b[0])
   for(var i = 1; i < podrc; i = i + 1)
    altotv = altotv + ". " + source.value(461, 0, 712, 0, $b[i])
  }

  if(POS(nextotv, altotv) == 0)
   doc.out(altotv, Zone9, �������)
  k = source.count(461, 0, 205)
  for(var i = 0; i< k;i=i+1)
   doc.out(source.value(461, 0, 205, i, ($a|$b?".-- "$a($b?", "$b))), Zone9, �������)


  doc.out(source.value(461, 0, 210, 0, ($a?".--")), zone9, �������)
  k = source.count(461, 0, 210, 0)

  var outstring = ""
  var last = ""
  for(var i = 0; i < k; i = i + 1)
  {
   var l = i + 1

   if(last == "a")
    outstring = outstring + source.value(461, 0, 210, 0, (@iis$a?"; "@i)(@iis$c?": "@i))
   else
   {
    if(last == "c")
     outstring = outstring + source.value(461, 0, 210, 0, (@iis$a?"; "@i)(@iis$c?": "@i))
    else
     outstring = outstring + source.value(461, 0, 210, 0, (@iis$a?@i)(@iis$c?@i))
   }
   if(source.exist(461, 0, 210, 0, (@iis$a?@i)))
    last = "a"
   if(source.exist(461, 0, 210, 0, (@iis$c?@i)))
    last = "c"
  }

  doc.out(outstring, zone9, �������)

  doc.out(source.value(461, 0, 210, 0, ($d?", "$d)(!$d?", �.�. ") ), Zone9, �������)
  if(source.exist(461, 0, 126))
  {
   doc.out(source.value(461, 0, 215, 0, ($a?".-- "$a)), Zone9, �������)
   if(source.exist(461, 0, 127, 0))
   {
    var len = source.value(461, 0, 127, 0, $a)
    doc.out(" (" + substring(len, symbol, 1, 2) + "� " + substring(len, symbol, 3, 2) + "� " + substring(len, symbol, 5, 2) + "�) ", Zone9, �������)
    doc.out(source.value(461, 0, 215, 0, ($c?": "$c)), Zone9, �������)
   }
  }
  else
   doc.out(source.value(461, 0, 215, 0, ($a?".-- "$a($c?" : "$c)($d?"; "$d)($e?" + "$e)) "."), Zone9, �������)
 
  if((substring(marker, symbol, 8, 1) != "s") | (substring(marker, symbol, 9, 1) != "2"))
  {
   var count225 = source.count(461, 0, 225)
   for(var j = 0 ; j < count225; j = j + 1)
    doc.out(source.value(461, 0, 225, j, ($a?".-- ("$a($e?": "$e)($f?"/ "$f)($h?"; "$h)($i?". "$i)($v?"; "$v)").") ), Zone9, �������)
  }
  doc.out(source.value(461, 0, 320, 0, ($a?".-- "$a) ), Zone9, �������)
  doc.out(source.value(461, 0, 305, 0, ($a?".-- "$a) ), Zone9, �������)

  doc.out("\n", Zone9, �������)
 }
 else
 {

  if(source.exist(500))
  {
   if(source.exist(710))
    doc.out(source.value(710, 0, $a($b?" ")$b". "), zone9)
   doc.out(source.value(500, 0, ($a?$a".")), zone9)
  }
  else
  {
   if((source.count(700) + source.count(701) + source.count(710) + source.count(711)) < 5)
   {
    if(source.exist( 700, 0))
     doc.out(source.value(700, 0, $a($g?", "$g)(!$g?", "$b)"\n"), Zone9, "�������")
    else
    {
     if(source.value(710, 0, #1) == "1")
     {
      doc.out(source.value(710, 0, ($a?$a", ")(!$g?$b)($g?$g)"\n"), Zone9, "�������")
      doc.out(source.value(710, 0, ($h?", "$h" ")($e|$f|$d?"("($d?$d",")($f?$f",")$e")")"\n"), Zone9, "�������")
     }
     else
      doc.out(source.value(710, 0, ($a?$a($c?", "$c)($d?" ("$d)($e?", "$e)($f?", "$f")")(!$g?$b)($g?$g)"\n")), Zone9, "�������")
    }
   }
  }
 }
 doc.out("    ", Zone9, "�������")
 if(source.exist(462))
 {
  if((substring(marker, symbol, 8, 1) == "s") & (substring(marker, symbol, 9, 1) == "2"))
   doc.out(source.value(210,0,($d?$d"  ")), Zone9, "�������")
  doc.out(source.value(461, 0, 200,0,$v), Zone9, "�������")
  if(source.value(200, 0, #1) != "0")
   doc.out(": ", Zone9, "�������")
 }
 else
 {
  if(source.exist( 461))
  {
   var flag = 0
   if((substring(marker, symbol, 8, 1) == "s") & (substring(marker, symbol, 9, 1) == "2"))
   { 
    doc.out(source.value(210,0,($d?$d",  ")), Zone9, "�������")
    flag = 1
   }
   doc.out(source.value(461, 0, 200,0,($v?$v"")), Zone9, "�������")
   if(source.exist( 461, 0, 200, 0, $v) & (flag==0) & (source.value(200, 0, #1) != "0"))
    doc.out(": ", Zone9, "�������")
  }
 }

 if(!source.exist( 423,0))
 {
  if(source.value(200, 0, #1) != "0")
  {
   var s
   var count200 = source.count(200, 0)
   var bookname = ""
   for(s = 0; s < count200; s = s + 1)
   {
    if(sizeof(bookname) > 0)
     bookname = bookname + source.value(200, 0, (@sis$a?"; "@s)(@sis$b?" :["@s"]")(@sis$e?": "@s)(@sis$d?"="@s)(@sis$h?". "@s)(@sis$i?". "@s))
    else
     bookname = source.value(200, 0, (@sis$a?@s)(@sis$b?" :["@s"]")(@sis$e?": "@s)(@sis$d?@s)(@sis$h?@s)(@sis$i?@s))
   }
   doc.out(bookname, zone9, "�������")
  }

  var count200f = source.count(200, 0, $f)
  var nextotv = source.value(200, 0,($f|$g?"/ "$f[0]))
  for(var i = 1; i < count200f; i = i + 1)
   nextotv = nextotv + source.value(200, 0,($f[i]?"; "$f[i]))

  var count200g = source.count(200, 0, $g)
  for(var i = 0; i < count200g; i = i + 1)
   nextotv = nextotv + source.value(200, 0,($g[i]?"; "$g[i]))

  doc.out(nextotv, Zone9, "�������")
  var altotv=""
  if(source.exist( 712, 0, $a))
  {
   var podrc = source.count(712, 0, $b)
   altotv = source.value(712, 0, $b[0])
   for(var i = 1; i < podrc; i = i + 1)
    altotv = altotv + ". " + source.value(712, 0, $b[i])
  }
  if(POS(nextotv, altotv) == 0)
   doc.out(altotv, Zone9, "�������")
 }
 else
 {
  k = source.count(200, 0, $a)
  doc.out("    " + source.value(200, 0,$a[0]), zone9, "�������")
  for(var j = 1; j < k; j = j + 1)
   doc.out(source.value(200, 0,"; "$a[j]), zone9, "�������")
 k = source.count(200, 0, $e)
  doc.out(source.value(200, 0,($e?": "$e[0])), zone9, "�������")
  for(var j = 1; j < k; j = j + 1)
   doc.out(source.value(200, 0,": "$e[j]), zone9, "�������")   
  doc.out(source.value(200, 0, ($f?"/"$f)), zone9, "�������")
  if(source.exist(200, 0, $a$f))
   doc.out(". ",zone9)
  var k2 = source.count(423) - 1
  for(var j =0 ; j < k2; j = j + 1)
  {
   k = source.count(423, j, 200, 0, $a)
   doc.out(source.value(423, j, 200, 0," "$a[0]), zone9, "�������")
   for(var l = 1; l < k; l = l + 1)
    doc.out(source.value(423, j, 200, 0,"; "$a[l]), zone9, "�������")
 k = source.count(423, j,200, 0, $e)
  doc.out(source.value(423, j,200, 0,($e?": "$e[0])), zone9, "�������")
  for(var j = 1; j < k; j = j + 1)
   doc.out(source.value(423, j,200, 0,": "$e[j]), zone9, "�������")   
doc.out(source.value(423,j, 200, 0, ($f?"/"$f)), zone9, "�������")
   if(source.exist(423, j, 200, 0, $a$f))
    doc.out(". ",zone9)
  }
  k = source.count(423, k2, 200, 0, $a)
  doc.out(source.value(423, k2, 200, 0," "$a[0]), zone9, "�������")
  for(var j = 1; j < k; j = j + 1)
   doc.out(source.value(423, k2, 200, 0,"; "$a[j]), zone9, "�������")
  k = source.count(423, k2,200, 0, $e)
  doc.out(source.value(423, k2,200, 0,($e?": "$e[0])), zone9, "�������")
  for(var j = 1; j < k2; j = j + 1)
   doc.out(source.value(423, j,200, 0,": "$e[j]), zone9, "�������")   
  doc.out(source.value(423, k2, 200, 0, ($f?"/"$f)), zone9, "�������")
  if(source.exist(423, k2, 200, 0 , $f))
   doc.out(source.value(200, 0,($g?"; "$g)), zone9, "�������")
  else
   doc.out(source.value(200, 0,($g?"/ "$g)), zone9, "�������")
 }

 k = source.count(205)
 for(var i = 0; i<k;i=i+1)
  doc.out(source.value(205, i, ($a|$b?".-- "$a($b?", "$b))), Zone9, "�������")

 doc.out(source.value(208, 0, ($a?".-- "$a)), Zone9, "�������")

 doc.out(source.value(210, 0, ($a?".--")), zone9, "�������")
 k = source.count(210, 0)

 var outstring = ""
 var last = ""
 for(var i = 0; i < k; i = i + 1)
 {
  var l = i + 1

  if(last == "a")
   outstring = outstring + source.value(210, 0, (@iis$a?"; "@i)(@iis$c?": "@i))
  else
  {
   if(last == "c")
    outstring = outstring + source.value(210, 0, (@iis$a?"; "@i)(@iis$c?": "@i))
   else
    outstring = outstring + source.value(210, 0, (@iis$a?@i)(@iis$c?@i))
  }

  if(source.exist(210, 0, (@iis$a?@i)))
   last = "a"
  if(source.exist(210, 0, (@iis$c?@i)))
   last = "c"
 }
 doc.out(outstring, zone9, "�������")

 if((substring(marker, symbol, 8, 1) != "s") | (substring(marker, symbol, 9, 1) != "2"))
 {
  if(source.exist( 461, 0))
   doc.out(source.value(210, 0, ($d?".-- "$d)), Zone9, "�������")
  else
   doc.out(source.value(210, 0, ($d?", "$d) ), Zone9, "�������")
 }
 if(source.exist(126))
 {
  doc.out(source.value(215, 0, ($a?".-- "$a)), Zone9, "�������")
  if(source.exist(127, 0))
  {
   var len = source.value(127, 0, $a)
   doc.out(" (" + substring(len, symbol, 1, 2) + "� " + substring(len, symbol, 3, 2) + "� " + substring(len, symbol, 5, 2) + "�) ", Zone9, "�������")
   doc.out(source.value(215, 0, ($c?": "$c)), Zone9, "�������")
  }
 }
 else
  doc.out(source.value(215, 0, ($a?".-- "$a($c?" : "$c)($d?"; "$d)($e?" + "$e)) ), Zone9, "�������")

 if((substring(marker, symbol, 8, 1) != "s") | (substring(marker, symbol, 9, 1) != "2"))
 {
  var count225 = source.count(225)
  for(var j = 0 ; j < count225; j = j + 1)
   doc.out(source.value(225, j, ($a?".-- ("$a($e?": "$e)($f?"/ "$f)($h?"; "$h)($i?". "$i)($v?"; "$v)").")), Zone9, "�������")
 }


 var needspace = 1
 for(var d = 0; d < 100; d = d + 1)
 {
  if(d == 90 | d == 18)
   continue
  if(d == 27)
  {
   if(!source.exist(327) | (source.value(327, 0, #1) == 0))
   { 
    var count464 = source.count(464)
    var end = ""
    if(count464 > 5)
    {
     count464 = 5
     end = " � ��."
    }
    var last = ""
    if(count464 > 0)
    { 
     doc.out("\n        ������: ", Zone9, "�������")
     if(source.exist(464, 0, 700) & (source.exist(464, 0, 200, 0, $a)))
     {
      doc.out(source.value(464, 0, 700, 0, $a" "$b"/ "), zone9, "�������")
      doc.out(source.value(464, 0, 200, 0, $a), zone9, "�������")
      last = ". "
     }
     if(source.exist(464, 0, 700) & (!source.exist(464, 0, 200, 0, $a)))
     {
      doc.out(source.value(464, 0, 700, 0, $a" "$b), zone9, "�������")
      last = ", "
     }
     if((!source.exist(464, 0, 700)) & (source.exist(464, 0, 200, 0, $a)))
     {
      doc.out(source.value(464, 0, 200, 0, $a), zone9, "�������")
      last = "; "
     }
    
     for(var i = 1; i < count464; i = i + 1)
     {
      if(source.exist(464, i, 700) & (source.exist(464, i, 200, 0, $a)))
      {
       doc.out(last + source.value(464, i, 700, 0, $a" "$b"/ "), zone9, "�������")
       doc.out(source.value(464, i, 200, 0, $a), zone9, "�������")
       last = ". "
      }
      if(source.exist(464, i, 700) & (!source.exist(464, i, 200, 0, $a)))
      {
       doc.out(last + source.value(464, i, 700, 0, $a" "$b), zone9, "�������")
       last = ", "
      }
      if((!source.exist(464, i, 700)) & (source.exist(464, i, 200, 0, $a)))
      {
       doc.out(last + source.value(464, i, 200, 0, $a), zone9, "�������")
       last = "; "
      }
     }
    }
   }
  }
  var k = source.count(300 + d) 
  for(var i = 0; i < k; i = i+1)
  {
   if(source.exist(300 + d, i, $a))
   {
    if(needspace == 1)
    { 
     needspace = 0
     doc.out("\n    ", Zone9, "�������")
    }
    else
     doc.out(".--", Zone9, "�������")
   if(d!=16)
   doc.out(source.value(300 + d, i, $a), Zone9, "�������")

   }
  }
 }
 doc.out("\n", zone9)
}
