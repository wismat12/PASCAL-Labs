program Project1;
uses crt;
const zakres = 10000;
var
   i,ii,j,dzielnik,ddzielnik,g: integer;
   wynik: array[1..100] of Integer;
   p: integer;
begin
  dzielnik:=0;
  ddzielnik:=0;
  P:=1;

  for i:=1 to zakres do begin

      for j:=i downto 1 do begin
          if(i mod j) = 0 then begin
            if j<i then dzielnik:=dzielnik+j;    //284
          end;
      end;

      for j:=dzielnik downto 1 do begin
          if(dzielnik mod j) = 0 then begin
            if j<dzielnik then ddzielnik:=ddzielnik+j;   //220
          end;
      end;
      if (i = ddzielnik)and(i<>dzielnik) then begin
      wynik[p]:=ddzielnik;
      inc(p);
      wynik[p]:= dzielnik;
      inc(p);
      end;//writeln(i,'zaprzyjaznione z ',dzielnik);

      dzielnik:=0;
      ddzielnik:=0;




  end;
  for g:=1 to p-1 do begin
      if ((g mod 2 )<> 0) and ( wynik[g-1]<>wynik[g]) then write(wynik[g],' zaprzyjaznione z ');
      if (g mod 2 = 0) and ( wynik[g-3]<>wynik[g])  then begin
         write(wynik[g]);
         writeln();
      end;
  end;
  //writeln(wynik[1]);


readln;
end.

