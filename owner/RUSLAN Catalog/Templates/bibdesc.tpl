'************************************************************************************************************************************************

define function get_author(_source)
{
 return get_author_single(_source, -1, -1)
}

'************************************************************************************************************************************************

define function get_author_single(_source, _tag, _count)
{
 var result = ""
 
 if(_source.exist(_tag, _count, 500))
 {
  if(_source.exist(_tag, _count, 710))
   result = result + _source.value(_tag, _count, 710, 0, $a($b?" ")$b($a|$b?". "))
  result = result + _source.value(_tag, _count, 500, 0, ($a?$a"."))
 }
 else
 {
  if((_source.count(_tag, _count, 700) + _source.count(_tag, _count, 701) + _source.count(_tag, _count, 710)) < 5)
  {
   if(_source.exist(_tag, _count, 700, 0))
    result = result + _source.value(_tag, _count, 700, 0, $a($g?($a?", ")$g)(!$g?($a?" ")$b)($c?($a|$g|$b?", ")$c))
   else
   {
    if(_source.value(_tag, _count, 710, 0, #1) == "1")
     result = result + _source.value(_tag, _count, 710, 0, $a($g?($a?", ")$g)(!$g?($a?" ")$b)($h?($a|$b|$g?", ")$h" ")($a|$b?($e|$f|$d?"("($d?$d",")($f?$f",")$e")")))
    else
     result = result + _source.value(_tag, _count, 710, 0, $a($g?($a?", ")$g)(!$g?($a?" ")$b)($a$c?", "$c))
   }
  }
 }
 if(_source.exist(_tag, _count, 29) & (pos(substring(_source.value(_tag, _count, 105, 0, $a), symbol, 5, 4), "l") > 0) | pos(substring(_source.value(_tag, _count, 105, 0, $a), symbol, 5, 4), "n") > 0)
 {
   var str = ""
   var end = ""
   for(var i = 0; i < _source.count(_tag, _count, 29); i = i + 1)
   {
    if(_source.value(_tag, _count, 29, i, #1) == "1")
    {
     result = result + str + _source.value(_tag, _count, 29, i, $c" "$b) + end
     str = "("
     end = ") "
    }
   }
 }
 return result
}

'************************************************************************************************************************************************

define function get_title(_source)
{
 return get_title_single(_source, -1, -1)
}

'************************************************************************************************************************************************

define function get_title_single(_source, _tag, _count)
{
 var result = ""
 var marker = _source.value()

 if((_tag == -1) & (_source.exist(462)))
 {
  if((substring(marker, symbol, 8, 1) == "s") & (substring(marker, symbol, 9, 1) == "2"))
   result = result + _source.value(210,0,($d?$d"  "))
  result = result + _source.value(462, 0, 200,0,$v)
  if(_source.value(200, 0, #1) != "0")
   result = result + ": "
 }
 else
 {
  if((_tag == -1) & (_source.exist(461)))
  {
   if((substring(marker, symbol, 8, 1) == "s") & (substring(marker, symbol, 9, 1) == "2"))
    result = result + _source.value(210, 0, ($d?$d"  "))
   result = result + _source.value(461, 0, 200, 0, $v)
   if((_source.value(200, 0, #1) != "0") & (_source.exist(461, 0, 200, 0, $v)))
    result = result + ": "
  }
 }

 if(_source.value(_tag, _count, 200, 0, #1) != "0")
 {
  var count200 = _source.count(_tag, _count, 200, 0)
  var bookname = ""
  for(var s = 0; s < count200; s = s + 1)
  {
   if(sizeof(bookname) > 0)
    bookname = bookname + _source.value(_tag, _count, 200, 0, (@sis$a?"; "@s)(@sis$b?" ["@s"]")(@sis$e?": "@s)(@sis$d?"="@s)(@sis$h?". "@s)(@sis$i?". "@s))
   else
    bookname = _source.value(_tag, _count, 200, 0, (@sis$a?@s)(@sis$b?" ["@s"]")(@sis$e?@s)(@sis$d?@s)(@sis$h?@s)(@sis$i?@s))
  }
  if(sizeof(bookname) > 0)
  {
   if(sizeof(result) > 0)
    result = result + " " + bookname
   else
    result = bookname
  }
 }
 var nextotv = _source.value(_tag, _count, 200, 0,($f|$g?"/ "$f($f&$g?"; ")$g))
 result = result + nextotv
 var altotv = ""
 if(_source.exist(_tag, _count, 712, 0, $a))
 {
  var podrc = _source.count(_tag, _count, 712, 0, $b)
  altotv = _source.value(_tag, _count, 712, 0, $b[0])
  for(var i = 1; i < podrc; i = i + 1)
   altotv = altotv + ". " + _source.value(_tag, _count, 712, 0, $b[i])
 }
 if((sizeof(altotv) > 0) & (POS(nextotv, altotv) == 0))
  result = result + " " + altotv
 
 if((_tag == -1) & (_source.exist(423)))
 {
  var s = _source.count(423)
  for(var i = 0; i < s; i = i + 1)
  {
   if(_source.value(423, i, 200, 0, #1) != "0")
   {
    var count200 = _source.count(423, i, 200, 0)
    var bookname = ""
    for(var s = 0; s < count200; s = s + 1)
    {
     if(sizeof(bookname) > 0)
      bookname = bookname + _source.value(423, i, 200, 0, (@sis$a?"; "@s)(@sis$b?" ["@s"]")(@sis$e?": "@s)(@sis$d?"="@s)(@sis$h?". "@s)(@sis$i?". "@s))
     else
      bookname = _source.value(423, i, 200, 0, (@sis$a?@s)(@sis$b?" ["@s"]")(@sis$e?@s)(@sis$d?@s)(@sis$h?@s)(@sis$i?@s))
    }
    if(sizeof(bookname) > 0)
     result = result + " " + bookname
   }
   var nextotv = _source.value(423, i, 200, 0,($f|$g?"/ "$f($f&$g?"; ")$g))
   result = result + nextotv
   var altotv = ""
   if(_source.exist(423, i, 712, 0, $a))
   {
    var podrc = _source.count(423, i, 712, 0, $b)
    altotv = _source.value(423, i, 712, 0, $b[0])
    for(var i = 1; i < podrc; i = i + 1)
     altotv = altotv + ". " + _source.value(423, i, 712, 0, $b[i])
   }
   if((sizeof(altotv) > 0) & (POS(nextotv, altotv) == 0))
    result = result + " " + altotv
    
   if((i < s - 1) & (result[sizeof(result) - 1] != "."))
    result = result + "."
  }
 }

 var k = _source.count(_tag, _count, 205)
 for(var i = 0; i< k; i = i + 1)
  result = result + _source.value(_tag, _count, 205, i, ($a|$b?". -  "$a($b?", "$b)))

 if(_source.exist(_tag, _count, 229) & (pos(substring(_source.value(_tag, _count, 105, 0, $a), symbol, 5, 4), "l") > 0) | pos(substring(_source.value(_tag, _count, 105, 0, $a), symbol, 5, 4), "n") > 0)
 {
  var startstring = ". -  "
  for(var i =0; i < _source.count(_tag, _count, 229); i = i +1)
  {
   for(var j = 0; j < _source.count(_tag, _count, 229, i, $a); j = j + 1)
   {
    result = result + _source.value(229, i, $a[j])
    startstring = "; "
   }
  }
 }
  
 return result
}

'************************************************************************************************************************************************

define function get_date_line(_source)
{
 return get_date_line_single(_source, -1, -1)
}

'************************************************************************************************************************************************
define function get_date_line_single(_source, _tag, _count)
{
 var result = _source.value(_tag, _count, 210, 0, ($a?". - "))
 var k = _source.count(_tag, _count, 210, 0)
 var outstring = ""
 var last = ""
 for(var i = 0; i < k; i = i + 1)
 { 
  var l = i + 1
  if(last == "a")
   outstring = outstring + _source.value(_tag, _count, 210, 0, (@iis$a?": "@i)(@iis$c?": "@i))
  else
  {
   if(last == "c")
    outstring = outstring + _source.value(_tag, _count, 210, 0, (@iis$a?"; "@i)(@iis$c?": "@i))
   else
    outstring = outstring + _source.value(_tag, _count, 210, 0, (@iis$a?@i)(@iis$c?@i))
  }
  if(_source.exist(_tag, _count, 210, 0, (@iis$a?@i)))
   last = "a"
  if(_source.exist(_tag, _count, 210, 0, (@iis$c?@i)))
   last = "c"
 }
 result = result + outstring
 result = result + _source.value(_tag, _count, 210, 0, ($d?", "$d)(!$d?", Б.г. ")($e|$g?"(")$e($g?($e?": ")$g)($e|$g?")") )
 result = result + _source.value(_tag, _count, 215, 0, ($a|$c|$d|$e?". -  ")$a($c?($a?" : ")$c)($d?($a|$c?"; ")$d)($e?($a|$c|$d?" + ")$e))
 
 return result
}

'************************************************************************************************************************************************

define function get_serial(_source)
{
 return get_serial_single(_source, -1, -1)
}

'************************************************************************************************************************************************

define function get_serial_single(_source, _tag, _count)
{
 var result = ""
 var marker = _source.value()
 
' if((substring(marker, symbol, 8, 1) == "s") & (substring(marker, symbol, 9, 1) == "2"))
 {
  if(_source.exist(_tag, _count, 225))
  {
   var s
   for(var j = 0; j < _source.count(_tag, _count, 225); j = j + 1)
   {
    var count225 = _source.count(_tag, _count, 225, j)
    if(count225 > 0)
    {
     var bookname = ""
     for(s = 0; s < count225; s = s + 1)
     {
      if(sizeof(bookname) > 0)
       bookname = bookname + _source.value(_tag, _count, 225, j, (@sis$a?"; "@s)(@sis$e?": "@s)(@sis$d?"="@s)(@sis$h?". "@s)(@sis$i?". "@s)(@sis$f?"/ "@s)(@sis$v?"; "@s))
      else
       bookname = ". - (" + _source.value(_tag, _count, 225, j, (@sis$a?@s)(@sis$e?@s)(@sis$d?@s)(@sis$h?@s)(@sis$i?@s)(@sis$f?"/ "@s)(@sis$v?@s))
     }
     if(sizeof(bookname) > 0)
      result = result + bookname + ")"
    }
   }
  }
  else
  {
   if(_tag == -1)
   {
    if(_source.value(462, 0, 200, 0, #1) != "0")
    {
     var count200 = _source.count(462, 0, 200, 0)
     var bookname = ""
     for(var s = 0; s < count200; s = s + 1)
     {
      if(sizeof(bookname) > 0)
       bookname = bookname + _source.value(462, 0, 200, 0, (@sis$a?"; "@s)(@sis$b?" ["@s"]")(@sis$e?": "@s)(@sis$d?"="@s)(@sis$h?". "@s)(@sis$i?". "@s))
      else
       bookname = ". " + _source.value(462, 0, 200, 0, (@sis$a?@s)(@sis$b?" ["@s"]")(@sis$e?@s)(@sis$d?@s)(@sis$h?@s)(@sis$i?@s))
     }
     result = result + bookname
    }
    var nextotv = _source.value(462, 0, 200, 0,($f|$g?"/ "$f($f&$g?"; ")$g))
    result = result + nextotv
    var altotv = ""
    if(_source.exist(462, 0, 712, 0, $a))
    {
     var podrc = _source.count(462, 0, 712, 0, $b)
     altotv = _source.value(462, 0, 712, 0, $b[0])
     for(var i = 1; i < podrc; i = i + 1)
      altotv = altotv + ". " + _source.value(462, 0, 712, 0, $b[i])
    } 
    if((sizeof(altotv) > 0) & (pos(nextotv, altotv) == 0))
     result = result + " " + altotv
   }
  }
 }
 return result
}

'************************************************************************************************************************************************

define function get_note(_source)
{
 return get_note_single(_source, -1, -1)
}

'************************************************************************************************************************************************

define function get_note_single(_source, _tag, _count)
{
 var result = ""
 var subresult = ""

 var k = _source.count(_tag, _count, 320)
 for(var i = 0; i < k; i= i + 1)
 {
  if(sizeof(subresult) > 0)
   subresult = subresult + _source.value(_tag, _count, 320, i, ($a?". -  "$a))
  else
   subresult = _source.value(_tag, _count, 320, i, $a)
 }
 result = subresult

 subresult = ""
 k = _source.count(_tag, _count, 305)
 for(var i = 0; i < k; i= i + 1)
 {
  if(sizeof(subresult) > 0)
   subresult = subresult + _source.value(_tag, _count, 305, i, ($a?". -  "$a))
  else
   subresult = _source.value(_tag, _count, 305, i, $a)
 }
 if((sizeof(result) > 0) & (sizeof(subresult) > 0))
  result = result + "\n"
 result = result + subresult

 subresult = ""
 k = _source.count(_tag, _count, 300)
 for(var i = 0; i < k; i= i + 1)
 {
  if(sizeof(subresult) > 0)
   subresult = subresult + _source.value(_tag, _count, 300, i, ($a?". -  "$a))
  else
   subresult = _source.value(_tag, _count, 300, i, $a)
 }
 if((sizeof(result) > 0) & (sizeof(subresult) > 0))
  result = result + "\n"
 result = result + subresult

 subresult = ""
 
 if(!_source.exist(327) | (_source.value(327, 0, #1) == 0))
 {
  var count464 = _source.count(464)
  var end = ""
  if(count464 > 5)
  {
   count464 = 5
   end = " и др."
  }
  var last = ""
  if(count464 > 0)
  {
   subresult = subresult + "\nСодерж: "
   if(_source.exist(464, 0, 700) & (_source.exist(464, 0, 200, 0, $a)))
   {
    subresult = subresult + _source.value(464, 0, 700, 0, $a" "$b"/ ")
    subresult = subresult + _source.value(464, 0, 200, 0, $a)
    last = ". "
   }
   if(_source.exist(464, 0, 700) & (!_source.exist(464, 0, 200, 0, $a)))
   {
    subresult = subresult + _source.value(464, 0, 700, 0, $a" "$b)
    last = ", "
   }
   if((!_source.exist(464, 0, 700)) & (_source.exist(464, 0, 200, 0, $a)))
   {
    subresult = subresult + _source.value(464, 0, 200, 0, $a)
    last = "; "
   }

   for(var i = 1; i < count464; i = i + 1)
   {
    if(_source.exist(464, i, 700) & (_source.exist(464, i, 200, 0, $a)))
    {
     subresult = subresult + last + _source.value(464, i, 700, 0, $a" "$b"/ ")
     subresult = subresult + _source.value(464, i, 200, 0, $a)
     last = ". "
    }
    if(_source.exist(464, i, 700) & (!_source.exist(464, i, 200, 0, $a)))
    {
     subresult = subresult + last + _source.value(464, i, 700, 0, $a" "$b)subresult = subresult + 
     last = ", "
    }
    if((!_source.exist(464, i, 700)) & (_source.exist(464, i, 200, 0, $a)))
    {
     subresult = subresult + last + _source.value(464, i, 200, 0, $a)
     last = "; "
    }
   }
  }
 }else
 {
  k = _source.count(_tag, _count, 327)
  for(var i = 0; i < k; i= i + 1)
  {
   if(sizeof(subresult) > 0)
    subresult = subresult + _source.value(_tag, _count, 327, i, ($a?". -  "$a))
   else
    subresult = _source.value(_tag, _count, 327, i, $a)
  }
 }
 
 if((sizeof(result) > 0) & (sizeof(subresult) > 0))
  result = result + "\n"
 result = result + subresult
 
 return result
}

'************************************************************************************************************************************************