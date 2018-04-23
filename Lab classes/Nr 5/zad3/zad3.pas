program zad3;
 uses crt;
var
  a,b:integer;


procedure test(a:integer;var b:integer);
begin
  a:=2*a;
  b:=2*b;
  writeln(a,' ',b);
end;

begin
  a:=4;
  b:=5;
  test(a,b);
  writeln(a,' ',b);
  readln;
end.


