program project1;
uses crt;
type
    Plis = ^lista;
    lista = record
      imie: string;
      pkt: integer;
      next: Plis;
      prev: Plis;
    end;
var
   poczatek: Plis;
   koniec: Plis;
procedure info(var imie: string; var pkt: integer);
var
   im: string;
   pp: integer;
begin
  writeln('Podaj imie studenta: '); readln(im);
  writeln('Podaj punkty studenta ',im,' :'); readln(pp);
  imie:=im;
  pkt:=pp;
end;

procedure dodaj_poczatek();
var
   imie: string;
   pkt: integer;
   tmp: Plis;
Begin
     new(tmp);
     info(imie,pkt);
     tmp^.imie:=imie;
     tmp^.pkt:=pkt;
     if ((poczatek=koniec)and(poczatek= nil)) then begin
        tmp^.next:=nil;
        tmp^.prev:=nil;
        koniec:=tmp;
     end
        else begin
          tmp^.next:=poczatek;
          tmp^.prev:=nil;
        end;
     poczatek:=tmp;
end;
procedure dodaj_koniec();
var
   imie: string;
   pkt: integer;
   tmp: Plis;
Begin
     new(tmp);
     info(imie,pkt);
     tmp^.imie:=imie;
     tmp^.pkt:=pkt;
     tmp^.next:=nil;
     if poczatek= nil then begin

        tmp^.prev:=nil;
        poczatek:=tmp;
        koniec:=tmp;
     end
        else begin
            koniec^.next:=tmp;
            tmp^.prev:=koniec;
            koniec:=tmp
        end;

end;
procedure po_elemencie();
var
   imie, nazwa: string;
   pkt: integer;
   tmp, tmp22: Plis;
Begin if poczatek<>nil then begin
     writeln('Podaj nazwisko po jakim chcesz wstawic studenta: '); readln(nazwa);
     tmp22:=poczatek;
     while tmp22^.imie <> nazwa do begin
           if tmp22^.next = nil then begin
              writeln('Nie ma takiego sdtudenta!');
              exit;
           end;
           tmp22:=tmp22^.next;

     end;

     new(tmp);
     info(imie,pkt);
     tmp^.imie:=imie;
     tmp^.pkt:=pkt;
     if tmp22 = koniec then  begin
        koniec^.next:=tmp;
        tmp^.prev:=koniec;
        tmp^.next:=nil;
        koniec:=tmp;
     end
        else begin
                tmp^.prev:=tmp22;
                tmp^.next:=tmp22^.next;
              tmp22^.next:=tmp;


        end;
     END;
end;
procedure usun_pocz();
var
tmp: Plis;
Begin
     if poczatek<>nil then begin
        if poczatek^.next<>nil then begin
           tmp:= poczatek;
           poczatek:=tmp^.next;
           poczatek^.prev:=nil;
           dispose(tmp);
        end
           else begin
           tmp:= poczatek;
           poczatek:=nil;
           koniec:=nil;
           dispose(tmp);
           end;
     end;
end;
procedure usun_koniec();
var
tmp: Plis;
Begin
     if koniec<>nil then begin
        if koniec^.prev<>nil then begin
           tmp:= koniec;
           koniec:=tmp^.prev;
           koniec^.next:=nil;
           dispose(tmp);
        end
           else begin
           tmp:= koniec;
           poczatek:=nil;
           koniec:=nil;
           dispose(tmp);
           end;
     end;
end;

procedure print();
var
tmp: Plis;
begin
     tmp:=poczatek;
     while tmp<>nil do begin
         writeln('Student ',tmp^.imie,' zdobyl ',tmp^.pkt,' pkt');
         tmp:=tmp^.next;
     end;
     readkey;

end;
procedure menu();
var n: integer;
begin
     repeat
     clrscr;
     writeln('Jesli chcesz dodac studenta na poczatek - 1, na koniec 2, usunac go z poczatku 3, z konca 4, wyswietlic liste -5 // zakonczyc wprowadzanie  - 6 // wprowadzic po elemencie - 7   ');

     readln(n);

     case n of
     1:dodaj_poczatek();
     2:dodaj_koniec();
     3:usun_pocz();
     4:usun_koniec();
     5:print();
     7:po_elemencie();
     end;

     until n=6;

end;



Begin
  poczatek:=nil;
  koniec:=nil;
  menu();
readln;
end.

