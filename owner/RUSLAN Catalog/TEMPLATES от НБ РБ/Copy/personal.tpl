define function main()
{
 doc.out("\n   " + marc(source, 200, 0, $a), side1)
 doc.out(marc(source, 310, 0, ($a?" ("$a")")), side1)
 doc.out(marc(source, 200, 0, (!$g?" "$b)($g?" "$g)($f?" ("$f") ")($c?" --"$c)), side1)
 doc.out("\n   " + marc(source, 810, 0, $a), side1)
 doc.out("\n   " + marc(source, 300, 0, $a), side1)
}