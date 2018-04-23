program project1;
uses crt;
var
   i,j,k,g, liczbac, wynik, len, podst: Integer;
   licz: string;
   reszty: array[1..60] of Integer;
   error: Boolean;
begin
  error:=false;
  Writeln('Podaj swoja liczbe w sys 8: ');
  readln(licz);
  liczbac:=0;
  len:= length(licz);

  for i:=1 to len do
           if (Integer(licz[i]))>=56 then error:= true;
  if not(error) then begin
  podst:=1;

  for j:=len downto 1 do begin
           liczbac:=liczbac + ((Integer(licz[j]))-48)*podst;
           podst:=podst*8;
  end;

  g:=0;
  repeat
    inc(g);
    reszty[g]:= liczbac mod 2;
    liczbac:= (liczbac - reszty[g]) div 2;
  until liczbac = 0 ;

  for k:=g downto 1 do
           write(reszty[k]);

  end
     else writeln('Podales nieprawdlowa liczbe!');
readln;
end.

