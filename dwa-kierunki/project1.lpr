program project1;
uses crt;
type
  Pstudent = ^student;
  student = record
    nazwisko: string[30];
    pkt: integer;
    next: Pstudent;
    prev: Pstudent;
  end;
procedure dodaj_poczatek(nazwisko: string; pkt: integer; var poczatek,koniec: Pstudent);
var
  tmp: Pstudent;
begin
  clrscr;
  new(tmp);
  tmp^.nazwisko:=nazwisko;
  tmp^.pkt:=pkt;
  if poczatek = nil then
      begin
           tmp^.next := nil;
           tmp^.prev := nil;
           koniec:=tmp;
      end
  else
      begin
        tmp^.next:=poczatek;
        tmp^.prev:=nil;
        poczatek^.prev:=tmp;
      end;
  poczatek:=tmp;
end;
procedure dodaj_koniec(nazwisko: string; pkt: integer; var poczatek,koniec: Pstudent);
var
  tmp: Pstudent;
begin
  clrscr;
  new(tmp);
  tmp^.nazwisko:=nazwisko;
  tmp^.pkt:=pkt;
  tmp^.next:=nil;
     if poczatek = nil then
        begin
             tmp^.prev:=nil;
             poczatek:=tmp;
             koniec:=tmp;
        end
     else begin
       koniec^.next:=tmp;
       tmp^.prev:=koniec;
       koniec:=tmp;
     end;
end;
procedure usun_poczatek(var poczatek,koniec: Pstudent);
var
  tmp,pom: Pstudent;
begin
     clrscr;
     if poczatek=koniec then
        begin
             dispose(poczatek);
        end
     else begin
     tmp:=poczatek;
     pom:=tmp^.next;
     pom^.prev:=nil;
     dispose(tmp);
     poczatek:=pom;
     end;
end;
procedure usun_koniec(var poczatek,koniec: Pstudent);
var
  tmp,pom: Pstudent;
begin
     clrscr;
     if poczatek=koniec then
        begin
             dispose(koniec);
        end
     else begin
     tmp:=koniec;
     pom:=tmp^.next;
     pom^.prev:=nil;
     dispose(tmp);
     poczatek:=pom;
     end;
end;
procedure wyswietl(tmp : Pstudent);
begin
  clrscr;
  if tmp = nil then
     write('brak elementow')
  else begin
    while tmp <> nil do
    begin
         writeln(tmp^.nazwisko, ' zdobyl: ', tmp^.pkt,' punktow.');
         tmp := tmp^.prev;
    end;
  end;
  readln;
end;


var
  poczatek: Pstudent;
  koniec: Pstudent;
begin
  poczatek:=nil;
  koniec:=nil;
  dodaj_poczatek('aaaa',28,poczatek,koniec);
  dodaj_koniec('bbbbb',34,poczatek,koniec);
  dodaj_koniec('ccccc',54,poczatek,koniec);
  usun_poczatek(poczatek,koniec);
  wyswietl(koniec);


readln;
end.
