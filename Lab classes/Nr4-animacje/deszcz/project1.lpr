program project1;
uses crt;
var
   wys, szer, i, j, prandom: Integer;
   t: array[1..1000] of char;

Begin
  writeln('Podaj wysokosc ramki: '); readln(wys); writeln('Podaj szer ramki: '); readln(szer);
  randomize;
  clrscr;
  for i:= 1 to szer*wys do t[i]:='o';
  repeat
    prandom:= random(szer)+1;



    for i:=wys downto 2 do
        for j:=szer downto 1 do
                    t[i*szer - j +1]:=t[(i-1)*szer - j + 1];


    for i:=1 to szer do
        if i=prandom then t[i]:='X'
        else t[i]:='o';

    for i:=1 to szer*wys do
        if i mod szer = 0 then writeln(t[i])
           else write(t[i]);


    delay(700);
    clrscr;
  until keypressed;

end.

