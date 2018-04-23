program trojkatpascala;
uses crt;
var
  wiersz,k,i:integer;

function pascal(i,k:integer): integer;
begin
  if ((k=0) or (k=i)) then
     pascal:= 1
  else
     pascal:= pascal(i-1, k-1) + pascal(i-1,k);
end;


begin
  writeln('Podaj nr wiersza dla jakiego trojkat ma byc narysowany');
  readln(wiersz);

  for i:=0 to wiersz do begin
        for k:=1 to (wiersz-i) do begin
            write(' ':4);
        end;
        for k:=0 to i do begin
            write(pascal(i,k):4);
            write(' ':4);
        end;
  writeln;
  end;

readln;
end.

