program project1;
uses crt;
const SIZE = 50;
var
  liczby: array[1..SIZE] of Integer;
  i,j, xmin,adres: Integer;

procedure swap(x,onx: Integer);
var tmp: integer;
begin
  tmp:=liczby[onx];
  liczby[onx]:=liczby[x];
  liczby[x]:=tmp;
end;

procedure wstawianie();
var i,j:Integer;
Begin
  for i:=2 to SIZE do
      if liczby[i-1]>liczby[i] then begin
        for j:=i downto 2 do
            if liczby[j]<liczby[j-1] then swap(j-1,j);
      end;
end;

procedure wybieranie();
var i,j:Integer;
Begin

  for i:=1 to SIZE do begin
      xmin:=liczby[i];
      adres:=i;
       for j:=i to SIZE do begin
           if xmin>liczby[j] then begin
             xmin:=liczby[j];
             adres:=j;
           end;
       end;
       swap(i,adres);
  end;
end;
procedure babel();
var i,j:Integer;
Begin

  for i:=1 to SIZE - 1 do
       for j:=1 to SIZE - i do
           if liczby[j]>liczby[j+1] then swap(j,j+1);



end;


Begin
  randomize;
  for i:=1 to SIZE do liczby[i]:= random(10);
   for i:=1 to SIZE do write(liczby[i]);
 // wstawianie;
 //wybieranie;
 babel;
  writeln;
  for i:=1 to SIZE do write(liczby[i]);




 readln;
end.

