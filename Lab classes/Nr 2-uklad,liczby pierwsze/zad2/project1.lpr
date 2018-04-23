program project1;

var
i: integer;
suma: extended;

const
a=1/3;


BEGIN
  suma:=0;
  for i:=1 to 3000 do begin
    suma:=suma + a;
    end;
  writeln(suma:1:15);




readln;
end.
