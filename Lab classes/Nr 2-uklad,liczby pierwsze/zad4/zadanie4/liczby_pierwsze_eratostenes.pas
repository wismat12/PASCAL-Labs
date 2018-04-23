program liczby_pierwsze_eratostenes;

Uses DOS, crt;
const n = 1000000;

var

  godz1,godz2,min1,min2,sek1,sek2,ssek1,ssek2,a,c:word;
  tab : array[2..n] of integer;
  tab2 : array[2..n] of boolean;
  i,w,p: integer;
begin
  GetTime(godz1,min1,sek1,ssek1);
  WriteLn('Aktualna Godzina : ',godz1,':',min1,':',sek1,':',ssek1);

  for i := 2 to n do tab2[i] := true;

  i:= 1;
  repeat
    i := i+1;
    w := i*2;
      repeat
        tab2[w] := false;
        inc(w,i);
      until (w > n);
  until (i > sqrt(n));
  p:=1;
  for i := 2 to n do begin
        if (tab2[i]) then
           begin
          inc(p);
          tab[p]:=i;
           end;
  end;

  writeln(p,' liczb pierwszych');

  GetTime(godz2,min2,sek2,ssek2);
  a:= 100*sek1+ssek1;
  c:= 100*sek2+ssek2;
  Writeln('Czas trwania programu : ',c-a,' setnych sekund');
  readln;
end.
