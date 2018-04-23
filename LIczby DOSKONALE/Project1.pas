program Project1;
uses crt;
const //LICZBY DOSKONALE
zakres = 1000;
var
   liczba,i,j,dzielniki, p: integer;
   tab: array[1..1000] of Integer;


Begin
  p:=1;
  For i:=1 to zakres do begin
  dzielniki:=0;


    for j:=1 to i do begin

    if(i mod j) = 0 then begin
      if j<i then dzielniki:= dzielniki + j;
      end;


    end;

    if dzielniki = i then begin
      tab[p]:=i;
      inc(p);
      end;
    end;


  for i:=1 to p-1 do writeln(tab[i]);





readln;
end.

