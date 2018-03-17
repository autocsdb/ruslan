include "templates\bibdesc.tpl"

'************************************************************************************************************************************************

define function common(source, _outzone)
{
 var current_data
 if(source.exist(461, 0))
 { 
  current_data = get_author_single(source, 461, 0)
  if(sizeof(current_data) > 0)
   doc.out(current_data + "\n", _outzone, Обычный)
  
  doc.out("\t" + get_title_single(source, 461, 0), _outzone, Обычный)
  doc.out(get_date_line_single(source, 461, 0), _outzone, Обычный)
  doc.out(get_serial_single(source, 461, 0), _outzone, Обычный)
  
  current_data = get_note_single(source, 461, 0)
  if(sizeof(current_data) > 0)
   doc.out("\n" + current_data, _outzone, Обычный)
   
  doc.out("\n", _outzone, Обычный)
 }

 current_data = get_author(source)
 if(sizeof(current_data) > 0)
  doc.out(current_data + "\n", _outzone, Обычный)
  
 doc.out("\t" + get_title(source), _outzone, Обычный)
 doc.out(get_date_line(source), _outzone, Обычный)
 doc.out(get_serial(source), _outzone, Обычный)

 current_data = get_note(source)
 if(sizeof(current_data) > 0)
  doc.out("\n" + current_data, _outzone, Обычный)

 if(source.exist(29) & pos(substring(source.value(105, 0, $a), symbol, 5, 8), "l") > 0)
 {
  doc.out(source.value(675, 0, ($a?" УДК "$a". ")), _outzone, Обычный)
  for(var i = 0; i < source.count(686); i = i + 1)
  {
   if(source.value(686, i, $2) == "oks")
   {
    doc.out(source.value(686, i, ($a?" Группа "$a". ")), _outzone, Обычный)
   }
  }
 }

 var k = source.count(461, 0, 10)
 for(var i = 0; i < k; i= i+1)
  doc.out("\n" + source.value(461, 0, 10, i, ($a?"ISBN "$a)($b?" "$b)($d?": "$d)), _outzone, Обычный)

 k = source.count(10)
 for(var i = 0; i < k; i= i+1)
  doc.out("\n" + source.value(10, i, ($a?"ISBN "$a)($b?" "$b)($d?": "$d)), _outzone, Обычный)

 k = source.count(225)
 for(var i = 0; i < k; i= i+1)
 {
  var k1 = source.count(225, i, $x)
  for(var i1 = 0; i1 < k1; i1= i1 + 1)
   doc.out("\n" + "ISSN " + source.value(225, i, $x[i1]), _outzone, Обычный)
 }

 k = source.count(461, 0, 11)
 for(var i = 0; i < k; i= i+1)
  doc.out("\n" + source.value(461, 0, 11, i, ($a?"ISSN "$a)($b?" "$b)($d?": "$d)), _outzone, Обычный)

 k = source.count(11)
 for(var i = 0; i < k; i= i+1)
  doc.out("\n" + source.value(11, i, ($a?"ISSN "$a)($b?" "$b)($d?": "$d)), _outzone, Обычный)

}

'************************************************************************************************************************************************

define function load_abridgments_list(_filename)
{
 var tmp = loadfromfile(_filename)
 var result = newmass(2)
 result[0] = newmass(0)
 result[1] = newmass(0)
 var pos
 for(var i = 0; i < sizeof(tmp); i = i + 1)
 {
  pos = pos(tmp[i], "=")
  add(result[0], trim(substring(tmp[i], symbol, 1, pos - 1)))
  add(result[1], trim(substring(tmp[i], symbol, pos + 1)))
 }
 return result
}


'************************************************************************************************************************************************

define function short_periodic_title(_source, _abridgments_list)
{
 var marker = _source.value()
 var result = source[i].value(461, 0, 200, 0, $a)
 
 var index = indexof(_abridgments_list[0], result)
 if(index != -1)
  result = _abridgments_list[1][index]
 
 if(_source.exist(462))
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
 }
 return result
}

'************************************************************************************************************************************************

define function short_periodic_year(_source)
{
 

 
}

'************************************************************************************************************************************************

define function short_periodic_number(_source)
{
 var marker = _source.value()
 if(_source.exist(462))
  return _source.value(462, 0, 200, 0, $v)
 else
  return _source.value(461, 0, 200, 0, $v)
}

'************************************************************************************************************************************************
