program zad5;
uses dos, crt;
var
liczba,w1,w2:integer;
godz1,godz2,min1,min2,sek1,sek2,ssek1,ssek2,p,k,p2,k2:word;
godz11,godz22,min11,min22,sek11,sek22,ssek11,ssek22:word;

function iteracja(liczba: integer): integer;
var
  a, b, c, i: integer;
begin
  a:=1;
  b:=1;
  if liczba=0 then iteracja:=0
  else
  if liczba<=2 then iteracja:=a
  else
    for i:=3 to liczba do
    begin
      c:=a+b;
      a:=b;
      b:=c;
    end;
    iteracja:=c;
end;

function rekurencja(liczba:integer): integer;
begin
  if (liczba=1) or (liczba=0) then
    rekurencja:=liczba
  else
    if liczba>1 then
      rekurencja:=rekurencja(liczba-1)+rekurencja(liczba-2);
end;

begin
  writeln('Podaj ktora liczbe z ciagu Fibonacciego chcesz zobaczyc: ');
    readln(liczba);
  GetTime(godz1,min1,sek1,ssek1);
  w1:= iteracja(liczba);
  write(w1);
  GetTime(godz2,min2,sek2,ssek2);
  p:= 100*sek1+ssek1;
  k:= 100*sek2+ssek2;
  write(' Czas trwania iteracji: ',k-p);
  writeln;
  GetTime(godz11,min11,sek11,ssek11);
  w2:= rekurencja(liczba);
  write(w2);
  GetTime(godz22,min22,sek22,ssek22);
  p2:= 100*sek11+ssek11;
  k2:= 100*sek22+ssek22;
  write(' Czas trwania rekurencji: ',k2-p2);

readln;
end.

