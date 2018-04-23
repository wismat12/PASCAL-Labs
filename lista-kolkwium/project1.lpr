program project1;
uses crt;
type
    Pkol = ^lista;
    lista = record
      nazwisko: string;
      pkt: integer;
      next: Pkol;
      ID: integer;
    end;
var
   head: Pkol;
   pmin, pmax: Pkol;

procedure dodaj_poID();
var
   tmp,tmp22: Pkol;
   nazwisko:string;
   pkt,ID: integer;
begin
     new(tmp);
     writeln('Podaj nazwisko studenta: '); readln(nazwisko);
     writeln('Podaj punkty student ',nazwisko,' :'); readln(pkt);
     writeln('Podaj jego ID: '); readln(ID);
     tmp^.ID:=ID;
     tmp^.nazwisko:= nazwisko;
     tmp^.pkt:=pkt;
     tmp^.next:=nil;

     if (head=nil)or (head^.ID > tmp^.ID )then begin
                     if head<>nil then tmp^.next:=head;
                     head:=tmp;
     end
        else begin
             tmp22:=head;

             while (tmp22^.next<>nil)and(tmp22^.next^.ID < tmp^.ID) do tmp22:=tmp22^.next;
             tmp^.next:=tmp22^.next;
             tmp22^.next:=tmp;
        end;


     clrscr;
end;
procedure dodaj_poczatek();
var
   tmp: Pkol;
   nazwisko:string;
   pkt: integer;
begin
     new(tmp);
     writeln('Podaj nazwisko studenta: '); readln(nazwisko);
     writeln('Podaj punkty student ',nazwisko,' :'); readln(pkt);
     tmp^.nazwisko:= nazwisko;
     tmp^.pkt:=pkt;
     tmp^.next:=nil;
     if head<>nil then tmp^.next:= head;
     head:=tmp;
     clrscr;
end;
procedure dodaj_koniec();
var
   tmp,tmp2: Pkol;
   nazwisko:string;
   pkt: integer;
begin
     new(tmp);
     writeln('Podaj nazwisko studenta: '); readln(nazwisko);
     writeln('Podaj punkty student ',nazwisko,' :'); readln(pkt);
     tmp^.nazwisko:= nazwisko;
     tmp^.pkt:=pkt;
     tmp^.next:=nil;
     tmp2:=head;
     if tmp2<>nil then begin
       while tmp2^.next<>nil  do begin
           tmp2:=tmp2^.next;
         end;
         tmp2^.next:=tmp;
     end
        else
        head:=tmp;
        clrscr;
end;
procedure usun_poczatek();
var
   tmp: Pkol;

begin
     if head<>nil then begin
     tmp:=head;
     head:=tmp^.next;
     dispose(tmp);
     end;
end;

procedure usun_koniec();
var
   tmp,tmp2: Pkol;

begin
     tmp:=head;
     if head^.next<>nil then begin
     tmp:=head;
     tmp2:=head^.next;
     while tmp2^.next<>nil  do begin
           tmp:=tmp^.next;
           tmp2:=tmp2^.next;
     end;
     dispose(tmp2);
     tmp^.next:=nil;
     end
        else if tmp<> nil then begin
             dispose(tmp);
             head:=nil;
        end;
end;
procedure wyswietl();
var
   tmp: Pkol;
begin clrscr;
     tmp:= head;
     while tmp<>nil do begin
        writeln('Student ',tmp^.nazwisko,' zdobyl pkt: ',tmp^.pkt);
        tmp:=tmp^.next;
     end;
end;
procedure minmax(var pmin, pmax: Pkol);
var
   tmp: Pkol;
   min, max: Integer;
begin

     if head<> nil then begin
     tmp:=head;
     min:=tmp^.pkt;
     max:=min;
     pmin:=head;
     pmax:=pmin;
     while tmp^.next<>nil  do begin
           tmp:=tmp^.next;
           if tmp^.pkt<min then begin
                           min:=tmp^.pkt;
                           pmin:=tmp;
           end;
          if tmp^.pkt>max then begin
                                     max:=tmp^.pkt;
                                     pmax:=tmp;
          end;
     end;
end;
end;

procedure menu();
var n: integer;
begin
     repeat
     writeln('Jesli chcesz dodac studenta na poczatek - 1, na koniec 2, usunac go z poczatku 3, z konca 4, wyswietlic liste -5 // zakonczyc wprowadzanie i wyswietlic max/min wynik - 6// Jesli dodac po ID to 7');

     readln(n);

     case n of
     1:dodaj_poczatek();
     2:dodaj_koniec();
     3:usun_poczatek();
     4:usun_koniec();
     5:wyswietl();
     6:minmax(pmin,pmax);
     7:dodaj_poID();
     end;

     until n=6;
     clrscr;
end;



Begin
  head:=nil;
  menu();
  writeln('Najlepszy student to: ',pmax^.nazwisko,' z pkt: ',pmax^.pkt);
  writeln('Najgorszy student to: ',pmin^.nazwisko,' z pkt: ',pmin^.pkt);

readln;
end.

