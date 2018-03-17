define function common(source)
{
 var k
 var k1
 var marker = source.value()
doc.out("\n", Side1, Обычный)
 if(source.exist(461, 0))
 { 
  if((source.count(461, 0, 700) + source.count(461, 0, 701)) < 5)
  {
   if(source.exist( 461,0, 700, 0))
    doc.out("\n" + source.value( 461, 0, 700, 0, $a($a?" ")$b), Side1, Автор)
   else
   {
    if(source.exist( 461,0, 710, 0))
    doc.out("\n" + source.value( 461, 0, 710, 0, $a($a?". ")$b), Side1, Автор)
   }
  }
  doc.out("\n    ", Side1, Обычный)
  var count200 = source.count(461, 0, 200, 0)
  var bookname = ""
  for(var s = 0; s < count200; s = s + 1)
  {
   if(sizeof(bookname) > 0)
    bookname = bookname + source.value(461, 0, 200, 0, (@sis$a?"; "@s)(@sis$b?" ["@s"]")(@sis$e?": "@s)(@sis$d?"="@s)(@sis$h?". "@s)(@sis$i?". "@s))
   else
    bookname = source.value(461, 0, 200, 0, (@sis$a?@s)(@sis$b?" ["@s"]")(@sis$e?@s)(@sis$d?@s)(@sis$h?@s)(@sis$i?@s))
  }
  doc.out(bookname, side1, Обычный)
  
  if((substring(marker, symbol, 8, 1) == "s") & (substring(marker, symbol, 9, 1) == "2"))
  {
   if(source.exist( 225))
   {
    var s
    for(var j = 0; j < source.count(225); j = j + 1)
    {
     var count225 = source.count(225, j)
     if(count225 > 0)
     {
      var bookname = ""
      for(s = 0; s < count225; s = s + 1)
      {
       if(sizeof(bookname) > 0)
        bookname = bookname + source.value(225, j, (@sis$a?"; "@s)(@sis$e?": "@s)(@sis$d?"="@s)(@sis$h?". "@s)(@sis$i?". "@s)(@sis$v?"; "@s))
       else
        bookname = ".--(" + source.value(225, j, (@sis$a?@s)(@sis$e?@s)(@sis$d?@s)(@sis$h?@s)(@sis$i?@s)(@sis$v?@s))
      }
      doc.out(bookname + ")", side1, Обычный)
     }
    }
   }
   else
   {
    var s
    var count200 = source.count(462, 0, 200, 0)
    var bookname = ""
    for(s = 0; s < count200; s = s + 1)
    {
     if(sizeof(bookname) > 0)
      bookname = bookname + source.value(462, 0, 200, 0, (@sis$a?"; "@s)(@sis$b?" ["@s"]")(@sis$e?": "@s)(@sis$d?"="@s)(@sis$h?". "@s)(@sis$i?". "@s))
     else
      bookname = ". " + source.value(462, 0, 200, 0, (@sis$a?@s)(@sis$b?" ["@s"]")(@sis$e?@s)(@sis$d?@s)(@sis$h?@s)(@sis$i?@s))
    }
    doc.out(bookname, side1, Обычный)
   }
  }
  
  var nextotv = source.value( 461, 0, 200, 0,($f|$g?"/ "$f($f&$g?"; ")$g))
  doc.out(nextotv, Side1, Обычный)
  var altotv=""
  if(source.exist( 461, 0, 712, 0, $a))
  { 
   var podrc = source.count( 461, 0, 712, 0, $b)
   altotv = source.value( 461, 0, 712, 0, $b[0])
   for(var i = 1; i < podrc; i = i + 1)
    altotv = altotv + ". " + source.value( 461, 0, 712, 0, $b[i])
  }

  if(POS(nextotv, altotv) == 0)
   doc.out(altotv, Side1, Обычный)
  k = source.count(461, 0, 205)
  for(var i = 0; i< k;i=i+1)
   doc.out(source.value(461, 0, 205, i, ($a|$b?".-- "$a($b?", "$b))), Side1, Обычный)

  doc.out(source.value( 461, 0, 210, 0, ($a?".--")), Side1, Обычный)
  k = source.count(461, 0, 210, 0)
  var outstring = ""
  var last = ""
  for(var i = 0; i < k; i = i + 1)
  { 
   var l = i + 1

   if(last == "a")
    outstring = outstring + source.value(461, 0, 210, 0, (@iis$a?": "@i)(@iis$c?": "@i))
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
  doc.out(outstring, Side1, Обычный)

  doc.out(source.value( 461, 0, 210, 0, ($d?", "$d)(!$d?", Б.г. ")($e|$g?"(")$e($g?($e?": ")$g)($e|$g?")") ), Side1, Обычный)
  doc.out(source.value(461, 0, 215, 0, ($a?".-- "$a($c?" : "$c)($d?"; "$d)($e?" + "$e)) ), Side1, Обычный)
  if((substring(marker, symbol, 8, 1) != "s") | (substring(marker, symbol, 9, 1) != "2"))
  {
   var s
   for(var j = 0; j < source.count(461, 0, 225); j = j + 1)
   {
    var count225 = source.count(461, 0, 225, j)
    if(count225 > 0)
    {
     var bookname = ""
     for(s = 0; s < count225; s = s + 1)
     {
      if(sizeof(bookname) > 0)
       bookname = bookname + source.value(461, 0, 225, j, (@sis$a?"; "@s)(@sis$e?": "@s)(@sis$d?"="@s)(@sis$h?". "@s)(@sis$i?". "@s)(@sis$v?"; "@s))
      else
       bookname = ".--(" + source.value(461, 0, 225, j, (@sis$a?@s)(@sis$e?@s)(@sis$d?@s)(@sis$h?@s)(@sis$i?@s)(@sis$v?@s))
     }
     doc.out(bookname + ")", side1, Обычный)
    }
   }
  }
  doc.out(source.value(461, 0, 320, 0, ($a?".-- "$a) ), Side1, Обычный)
  doc.out(source.value(461, 0, 305, 0, ($a?".-- "$a) ), Side1, Обычный)
  k = source.count(461,0,300)
  for(var i = 0; i < k; i= i+1)
   doc.out(source.value(461,0,300, i, ($a?".-- "$a)), Side1, Обычный)
'  k = source.count(461, 0, 10)
'  for(var i = 0; i < k; i= i+1)
'   doc.out("\n" + source.value(461, 0, 10, i, ($a?" ISBN "$a)($b?" "$b)), Side1, Обычный)
'  k = source.count(461, 0, 11)
'  for(var i = 0; i < k; i= i+1)
'   doc.out("\n" + source.value(461, 0, 11, i, ($a?" ISSN "$a)($b?" "$b)), Side1, Обычный)
 }
 else
 {
  if((source.count(700) + source.count(701)) < 5)
  {
   if(source.exist( 700, 0))
    doc.out("\n" + source.value( 700, 0, $a($a?" ")$b), Side1, Автор)
   else
   {
    if(source.exist( 710, 0))
     doc.out("\n" + source.value( 710, 0, $a($a?". ")$b), Side1, Автор)
   }
  }
 }
 if(source.exist(29) & (pos(substring(source.value(105, 0, $a), symbol, 5, 4), "l") > 0) | pos(substring(source.value(105, 0, $a), symbol, 5, 4), "n") > 0)
 {
   var str = ""
   var end = ""
   for(var i = 0; i < source.count(29); i = i + 1)
   {
    if(source.value(29, i, #1) == "1")
    {
     doc.out(str + source.value(29, i, $c" "$b) + end, Side1, Автор)
     str = "("
     end = ") "
    }
   }
 }
 doc.out("\n    ", Side1, Обычный)
 if(source.exist( 462))
 {
  if((substring(marker, symbol, 8, 1) == "s") & (substring(marker, symbol, 9, 1) == "2"))
   doc.out(source.value(210,0,($d?$d"  ")), Side1, Обычный)
  doc.out(source.value(462, 0, 200,0,$v), Side1, Обычный)
  if(source.value( 200, 0, #1) != "0")
   doc.out(": ", Side1, Обычный)
 }
 else
 {
  if(source.exist( 461))
  {
   if((substring(marker, symbol, 8, 1) == "s") & (substring(marker, symbol, 9, 1) == "2"))
    doc.out(source.value(210,0,($d?$d"  ")), Side1, Обычный)
   doc.out(source.value(461, 0, 200,0,$v), Side1, Обычный)
   if(source.value( 200, 0, #1) != "0")
    doc.out(": ", Side1, Обычный)
  }
 }
 if(source.value( 200, 0, #1) != "0")
 {
   var count200 = source.count(200, 0)
   var bookname = ""
   for(var s = 0; s < count200; s = s + 1)
   {
    if(sizeof(bookname) > 0)
     bookname = bookname + source.value(200, 0, (@sis$a?"; "@s)(@sis$b?" ["@s"]")(@sis$e?": "@s)(@sis$d?"="@s)(@sis$h?". "@s)(@sis$i?". "@s))
    else
     bookname = source.value(200, 0, (@sis$a?@s)(@sis$b?" ["@s"]")(@sis$e?@s)(@sis$d?@s)(@sis$h?@s)(@sis$i?@s))
   }
   doc.out(bookname, side1, Обычный)
 }
 var nextotv = source.value( 200, 0,($f|$g?"/ "$f($f&$g?"; ")$g))
 doc.out(nextotv, Side1, Обычный)
 var altotv=""
 if(source.exist( 712, 0, $a))
 {
  var podrc = source.count( 712, 0, $b)
  altotv = source.value( 712, 0, $b[0])
  for(var i = 1; i < podrc; i = i + 1)
   altotv = altotv + ". " + source.value( 712, 0, $b[i])
 }
 if(POS(nextotv, altotv) == 0)
  doc.out(altotv, Side1, Обычный)
 k = source.count(205)
 for(var i = 0; i<k;i=i+1)
  doc.out(source.value(205, i, ($a|$b?".-- "$a($b?", "$b))), Side1, Обычный)
 if(source.exist(229) & (pos(substring(source.value(105, 0, $a), symbol, 5, 4), "l") > 0) | pos(substring(source.value(105, 0, $a), symbol, 5, 4), "n") > 0)
 {
  var startstring = ".-- "
  for(var i =0; i < source.count(229); i = i +1)
  {
   for(var j = 0; j < source.count(229, i, $a); j = j + 1)
   {
    doc.out(startstring + source.value(229, i, $a[j]), side1, Обычный)
    startstring = "; "
   }
  }
 }
 doc.out(source.value( 210, 0, ($a?".--")), Side1, Обычный)
 k = source.count( 210, 0)

 var outstring = ""
 var last = ""
 for(var i = 0; i < k; i = i + 1)
 {
  var l = i + 1

  if(last == "a")
   outstring = outstring + source.value(210, 0, (@iis$a?": "@i)(@iis$c?": "@i))
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
 doc.out(outstring, Side1, Обычный)


 if((substring(marker, symbol, 8, 1) != "s") | (substring(marker, symbol, 9, 1) != "2"))
 {
  if(source.exist( 461, 0))
   doc.out(source.value( 210, 0, ($d?".-- "$d)($e|$g?"(")$e($g?($e?": ")$g)($e|$g?")") ), Side1, Обычный)
  else
   doc.out(source.value( 210, 0, ($d?", "$d)($e|$g?"(")$e($g?($e?": ")$g)($e|$g?")") ), Side1, Обычный)
 }
 doc.out(source.value(215, 0, ($a?".-- "$a($c?" : "$c)($d?"; "$d)($e?" + "$e)) ), Side1, Обычный)
 if((substring(marker, symbol, 8, 1) != "s") | (substring(marker, symbol, 9, 1) != "2"))
 {
  var s
  for(var j = 0; j < source.count(225); j = j + 1)
  {
   var count225 = source.count(225, j)
   if(count225 > 0)
   {
    var bookname = ""
    for(s = 0; s < count225; s = s + 1)
    {
     if(sizeof(bookname) > 0)
      bookname = bookname + source.value(225, j, (@sis$a?"; "@s)(@sis$e?": "@s)(@sis$d?"="@s)(@sis$h?". "@s)(@sis$i?". "@s)(@sis$v?"; "@s))
     else
      bookname = ".--(" + source.value(225, j, (@sis$a?@s)(@sis$e?@s)(@sis$d?@s)(@sis$h?@s)(@sis$i?@s)(@sis$v?@s))
    }
    doc.out(bookname + ")", side1, Обычный)
   }
  }
 }
 doc.out(source.value(320, 0, ($a?".-- "$a)), Side1, Обычный)
 doc.out(source.value(305, 0, ($a?".-- "$a)), Side1, Обычный)
 k = source.count(300)
 for(var i = 0; i < k; i= i+1)
  doc.out(source.value(300, i, ($a?".-- "$a)), Side1, Обычный)
 k = source.count(327)
 for(var i = 0; i < k; i= i+1)
  doc.out(source.value(327, i, ($a?".-- "$a)), Side1, Обычный)
 if(source.exist(29) & pos(substring(source.value(105, 0, $a), symbol, 5, 8), "l") > 0)
{
  doc.out(source.value(675, 0, ($a?" УДК "$a". ")), Side1, Обычный)
  for(var i = 0; i < source.count(686); i = i + 1)
  {
   if(source.value(686, i, $2) == "oks")
   {
    doc.out(source.value(686, i, ($a?" Группа "$a". ")), Side1, Обычный)
   }
  }
}

 k = source.count(10)
' for(var i = 0; i < k; i= i+1)
'  doc.out("\n" + source.value(10, i, ($a?" ISBN "$a)($b?" "$b)), Side1, Обычный)
' k = source.count(11)
' for(var i = 0; i < k; i= i+1)
'  doc.out("\n" + source.value(11, i, ($a?" ISSN "$a)($b?" "$b)), Side1, Обычный)

doc.out("\n", zone9)
if(source.exist(999))
 {
  doc.out(source.value(999, 0, ($h?$h"  ")), Zone9, Обычный) 
  doc.out(source.value(999, 0, ($i?$i)), Zone9, Обычный) 
'  doc.out(source.value(999, 0, $h), Zone9, Обычный) 
 }
}