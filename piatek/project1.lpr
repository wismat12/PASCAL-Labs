program project1;
{uses crt;
var
   dzionek: string;
   dzien, miesiac, rok, d, m, r, luty: integer;


function next(var dzionek: string):string;
begin
    if dzionek ='pon' then  next:='wtr';
    if dzionek ='wtr' then  next:='srd';
    if dzionek ='srd' then  next:='czw';
    if dzionek ='czw' then  next:='ptk';
    if dzionek ='ptk' then  next:='sob';
    if dzionek ='sob' then  next:='nie';
    if dzionek ='nie' then  next:='pon';
end;



Begin
 dzionek:='pon';
 dzien:=0;
        for r:=1 to 20 do BEGIN
            if ((r=4)or(r=8)or(r=12)or(r=16)or(r=20)) then luty:= 29
            else luty:=28;


            for m:=1 to 12 do BEGIN


                if ((m=1)or(m=3)or(m=5)or(m=7)or(m=8)or(m=10)or(m=12)) then miesiac:= 31
                else if(m<>2) then miesiac:=30
                     else miesiac:=luty;

                     for d:=1 to miesiac do BEGIN

                         if ((d=13) and (dzionek = 'ptk')) then writeln('Piatek 13-tego jest w ',d,'.',m,'.',r);
                         dzionek:=next(dzionek);

                     end;



            end;


        end;




 readln;
end.  }

uses
  sysutils, crt;

var
  data : TDateTime;
  rok, miesiac : integer;

begin
  for rok := 2010 to 2016 do
  begin
    for miesiac := 1 to 12 do
    begin
      data := EncodeDate(rok, miesiac, 13);
      if DayOfWeek(data) = 6then
      begin
        if miesiac < 10 then
          writeln('13-0', miesiac, '-', rok,' to byl paitek!')
        else
          writeln('13-', miesiac, '-', rok,' to byl piatek!')
      end;
    end
  end;
  readkey;
end.



