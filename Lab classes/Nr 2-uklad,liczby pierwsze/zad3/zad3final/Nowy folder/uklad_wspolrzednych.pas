program uklad_wspolrzednych;
  uses crt;
var
  x,y:real;  //Wspolrzedne punktu
  w:integer; //Zmienna okresla polozenie punktu
  z:char;    //Zmienna okresla koniec programu
begin
  repeat
  writeln('Podaj wspolrzedna punktu na OX: ');
  readln(x);
  writeln('Podaj wspolrzedna punktu na OY: ');
  readln(y);
  if x=0 then
     if y=0 then w:=1
     else  w:=2
  else if y=0 then  w:=3
       else  if x>0 then
             if y>0 then w:=4
             else w:=5
                else if y>0 then w:=6
                     else w:=7;
  case w of
  1: writeln('Twoj punkt znajduje sie w poczatku ukladu');
  2: writeln('Twoj punkt znajduje sie na osi OY ');
  3: writeln('Twoj punkt znajduje sie na osi OX ');
  4: writeln('Twoj punkt znajduje sie w I cwiartce ');
  5: writeln('Twoj punkt znajduje sie w IV cwiartce');
  6: writeln('Twoj punkt znajduje sie w II cwiartce');
  7: writeln('Twoj punkt znajduje sie w III cwiartce');
  end;
  writeln('Czy chcesz sprawdzic kolejny punkt?');
  repeat
  writeln('y-tak n-wyjscie z programu');
  readln(z);
  until(z='y')or(z='n');
  until z='n';
end.


