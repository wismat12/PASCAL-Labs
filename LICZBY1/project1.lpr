program project1;
uses crt;
var
   tab: array of boolean;
   i,w,n: integer;
begin
  writeln('Podaj zakres liczb peirwszych: '); readln(n);
  setlength(tab,n);

  for i:= 2 to n do tab[i]:=true;

  i:=1;
  repeat
    i:=i+1;
    w:=i*2;

           repeat
             tab[w]:=false;
             inc(w,i);
           until w>n;

  until i>sqrt(n);

  for i:=2 to n do if tab[i] then writeln(i);

readln;
end.

