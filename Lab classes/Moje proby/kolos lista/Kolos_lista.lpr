program Kolos_lista;
uses crt;
type
  Pstudent = ^student;
  student = record
    nazwisko: string[30];
    pkt: integer;
    next: Pstudent;
  end;




procedure dodaj_poczatek(var head : Pstudent);
var
      tmp : Pstudent;
begin
      new(tmp);
      write('Nazwisko: ');
      readln(tmp^.nazwisko);
      write('Liczba punktow studenta (',tmp^.nazwisko,'):');
      readln(tmp^.pkt);
      if head = nil then
        tmp^.next := nil
      else
        tmp^.next := head;
      head := tmp;
end;

procedure dodaj_na_koniec(var head : Pstudent);
var
  tmp, tmp2 : Pstudent;
begin
  clrscr;
  write('Nazwisko: ');
  readln(tmp^.nazwisko);
  write('Liczba punktow studenta (',tmp^.nazwisko,'):');
  readln(tmp^.pkt);
  tmp^.next := nil;
  if head = nil then
    head := tmp
  else begin
    tmp2 := head;
    while tmp2^.next <> nil do
          tmp2 := tmp2^.next;
    tmp2^.next := tmp;
  end;
end;

procedure wyswietl(head : Pstudent);
begin
  clrscr;
  if head = nil then
     write('brak elementow')
  else begin
    while head <> nil do
    begin
         writeln(head^.nazwisko, ' PKT: ', head^.pkt);
         head := head^.next;
    end;
  end;
  readln;
end;
procedure usun_pocz(var head : Pstudent);
var
  tmp : Pstudent;
begin
  if head = nil then
    write('brak elemntow do usuniecia')
  else
    begin
      tmp := head;
      head := head^.next;
      dispose(tmp);
    end;
end;
procedure usun_koniec(var head : Pstudent);
var
  tmp,tmp2 : Pstudent;
begin
  if head = nil then
    write('brak elemntow do usuniecia')
  else
    begin
      tmp:= head;
      tmp2:= head^.next;
      while tmp2^.next <> nil do begin
            tmp2:=tmp2^.next;
            tmp:=tmp^.next;
            end;
      tmp^.next:=nil;
      dispose(tmp2);
      end;

end;


var
   head,min,max: Pstudent;


begin
  head:=nil;









end.

