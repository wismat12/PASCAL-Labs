program trojkatpascala;
uses crt;
var
  wiersz,k,i:integer;

function pascal(n,k:integer): integer;
begin
  if ((k=0) or (k=n)) then
     pascal:= 1
  else
     pascal:= pascal(n-1, k-1) + pascal(n-1,k);
end;


begin
  writeln('Podaj nr wiersza dla jakiego trojkat ma byc narysowany');
  readln(wiersz);

  for i:=0 to wiersz do begin
          for k:=0 to i do begin
                    write('   ',pascal(i,k),'   ');
          end;
  writeln;
  end;

readln;
end.

