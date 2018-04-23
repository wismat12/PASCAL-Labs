program zad4_silnia;
Uses  crt,dos;

var
   godz1,godz2,min1,min2,sek1,sek2,ssek1,ssek2,p,k,p2,k2:word;
   godz11,godz22,min11,min22,sek11,sek22,ssek11,ssek22:word;
   a:integer;

function rekurencja( c:integer): integer;
var w:integer;
begin
  if((c=0)or(c=1)) then rekurencja:= 1
  else
      result:= c*rekurencja(c-1);
end;

function iteracja(a:integer): integer;
var w,i:integer;
begin
  w:=1;
  if((a=0)or(a=1)) then iteracja:= w;
       for i:=a downto 1 do
           w:=w*i;
       result:=w;
end;

begin
  writeln('Podaj liczbe dla jakiej chcesz obliczyc silnie: ');
  readln(a);
  GetTime(godz1,min1,sek1,ssek1);
  write(rekurencja(a));
  GetTime(godz2,min2,sek2,ssek2);
  p:= 100*sek1+ssek1;
  k:= 100*sek2+ssek2;
  write(' Czas trwania rekurencji: ',k-p);
  writeln;
  GetTime(godz11,min11,sek11,ssek11);
  write(iteracja(a));
  GetTime(godz22,min22,sek22,ssek22);
  p2:= 100*sek11+ssek11;
  k2:= 100*sek22+ssek22;
  write(' Czas trwania iteracji: ',k2-p2);

  readln;

end.




