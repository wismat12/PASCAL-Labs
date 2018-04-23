program liczb;

uses crt;

var
reszty: array[1..100] of integer;
st:string[10];
pods,w,i,pot,liczba,liczbac,resz,j,sys,g: integer;




begin

writeln('Podaj system liczbowy w jakim wprowadzisz liczbe');
readln(pods);
writeln('Podaj swoja liczbe');
readln(st);
writeln('Poadj system w jakim chcesz zobaczyc swoja liczbe');
readln(sys);
w:=0;
pot:=1;
for i:=length(st) downto 1 do begin
     w:= w + (integer(st[i]) - 48)*pot;
     pot:=pot*pods;
end;

    w:=liczbac;
    j:=1;
    repeat
          resz:= liczbac mod sys;
          liczbac:= (liczbac - resz) div sys;
          reszty[j]:=resz;
          inc(j);


    until liczbac = 0;
    writeln;
    for g:=j-1 downto 1 do begin
         write(reszty[j]);
    end;

readln;



end.

