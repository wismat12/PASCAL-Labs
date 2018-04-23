program z8na2;

uses crt;
{var
   reszty: array[1..60] of Integer;
   i,g,h,j,liczbac,podstawa1, podstawa2,len,potega,reszta: Integer;
   wprowadzona: string;
   error: boolean;




Begin
  podstawa1:=8;
  error:=false;
  podstawa2:=2;
  writeln('Podaj liczbe w systemie 8: ');
  readln(wprowadzona);
  len:= length(wprowadzona);
  for i:=1 to len do begin
      if ((Integer(wprowadzona[i]))>= 55) then error:=true;
  end;
  if not(error) then begin
    potega:=1;
    liczbac:=0;

    for g:=len downto 1 do begin
    liczbac:= liczbac + (Integer(wprowadzona[g])-48)*potega;
    potega:=potega*8;
    end;
    writeln(liczbac);
    h:=0;
    repeat
      inc(h);
      reszta:=liczbac mod 2;
      liczbac:= (liczbac - reszta) div 2;
      reszty[h]:=reszta;
    until(liczbac = 0) ;

    writeln('Twoja liczba z 8 na 2 to:');
    for j:=h downto 1 do begin
        write(reszty[j]);
    end;

  end
      else
          writeln('Podales zle parametry!');

readln;  }

var


end.

