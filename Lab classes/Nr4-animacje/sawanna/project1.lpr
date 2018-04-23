program zad2;
uses
  crt;
var
  rand: integer;
  i, j, k, full,szer,wys: integer;
  tak: boolean;
  t: array[1..50] of integer;

begin
  writeln('Podaj wysokosc ramki: '); readln(wys); writeln('Podaj szer ramki: '); readln(szer);
  randomize;


  for i := 1 to szer do
  begin
    t[i]:=0;  //wartosc glowy
//inicjalizacja
  end;
clrscr;
full:=0;
repeat
   //losowanie kolumny
  if full <szer then begin
    tak:=true;
    while tak do begin
      rand:= random(szer)+1;
      if t[rand]=0 then begin
        full:=full+1;
        t[rand]:=1;
        tak:= false;
      end;
    end;
  end;

  //rysowanie planszy
  for i:=1 to wys do  begin
      for j:=1 to szer do begin
        if (t[j]=i) then write('X')
        else
        if (t[j]-1=i) then write('X')
        else
        if (t[j]-2=i) then write('X')
        else
        write(' ');
      end;
   writeln();
  end;

      // modyfikacja wspolrzednych
  for i:=1 to szer do begin
      if t[i]>0 then t[i]:= t[i]+1;
      if t[i] > wys+2 then begin
          t[i]:=0;
          full:=full-1;
      end;
  end;

writeln(full);
delay(500);
clrscr;
until keypressed;

readkey;
end.


  {//losowanie kolumny
  if full <szer then begin
    tak:=true;
    while tak do begin
      rand:= random(szer)+1;
      if t[rand].istnieje=false then begin
        full:=full+1;
        t[rand].istnieje:=true;
        t[rand].head:=1;
        tak:= false;
      end;
    end;
  end;

  //rysowanie planszy
  for i:=1 to wys do  begin
      for j:=1 to szer do begin
        if (t[j].head=i) then write('X')
        else
        if (t[j].head-1=i) then write('X')
        else
        if (t[j].head-2=i) then write('X')
        else
        write(' ');
      end;
   writeln();
  end;

      // modyfikacja wspolrzednych
  for i:=1 to szer do begin
      if t[i].head>0 then t[i].head:= t[i].head+1;
      if t[i].head > wys+2 then begin
          t[i].head:=0;
          t[i].istnieje:=false;
          full:=full-1;
      end;
  end;

writeln(full);
delay(500);
clrscr;
until keypressed;

readkey;
end. }

