program sortowania;
uses crt, dos;
const
SIZE = 50;
type
  tab = array[1..SIZE] of integer;
var
    godz1,godz2,min1,min2,sek1,sek2,ssek1,ssek2: word;
    i,nr_wypelnienia: integer;
    czas_trwania_sortowania: Real;

liczby: tab;
randomowa: tab;



procedure wypelnij;

begin
     if nr_wypelnienia = 1 then begin
            randomize;
            for i:=1 to SIZE do begin
                randomowa[i]:= random(100);
                liczby[i]:= randomowa[i];
            end;
            inc(nr_wypelnienia);
     end
     else
       for i:=1 to SIZE do begin
                  liczby[i]:= randomowa[i];
       end;

end;

procedure wypisz;
begin
   writeln;
  for i:=1 to SIZE do begin
         write(liczby[i],' ');
         end;
         writeln;
end;

function min(pocz: integer): integer;
var i,wynik,index: Integer;
begin
   index:= pocz;
   wynik:= liczby[pocz];
   for i:=pocz+1 to SIZE do
       if (wynik > liczby[i]) then begin
       wynik:=liczby[i];
       index:=i;
       end;
   min:=index;
end;

procedure swap(x,y: Integer);
var a:integer;
begin
   a:=liczby[y];
   liczby[y]:=liczby[x];
   liczby[x]:=a;
end;

procedure wybieranie;
var i,j :integer;
begin
    for i:=1 to SIZE do
    begin
    swap(i,min(i));
    end;
end;

procedure babelkowe;
var i,j: Integer;
begin
     for i:=1 to SIZE - 1   do
     begin
        for j:=1 to (SIZE - i) do
        begin
            if liczby[j] > liczby[j+1] then swap(j,j+1);
        end;
     end;
end;

procedure wstawianie;   {O(n^2)}
var i,j: Integer;
begin
     for i:=2 to SIZE do begin
        if liczby[i]<liczby[i-1] then begin
           for j:=i downto 2 do begin
               if liczby[j]<liczby[j-1] then swap(j,j-1);
           end;
        end;
     end;
end;

procedure porzadkowanie_kopiec(Nr_Rodzic, zadany_rozmiar: Integer);
var
Lewy_nr_Dziecka, Prawy_nr_Dziecka, Nr_MAX: integer;
begin
     Lewy_nr_Dziecka:=2*Nr_Rodzic;
     Prawy_nr_Dziecka:=2*Nr_Rodzic + 1;

     if((Lewy_nr_Dziecka <= zadany_rozmiar) and (liczby[Lewy_nr_Dziecka] > liczby[Nr_Rodzic])) then Nr_MAX:= Lewy_nr_Dziecka
     else Nr_MAX :=Nr_Rodzic;

     if((Prawy_nr_Dziecka <= zadany_rozmiar) and (liczby[Prawy_nr_Dziecka] > liczby[Nr_MAX])) then Nr_MAX:= Prawy_nr_Dziecka;

     if( liczby[Nr_MAX] <> liczby[Nr_Rodzic] ) then begin

     swap(Nr_Rodzic,Nr_MAX);
     porzadkowanie_kopiec(Nr_MAX, zadany_rozmiar);

     end;
end;

procedure sort_kopiec;
var
i, rozmiar_malejacy: Integer;
begin
rozmiar_malejacy:=SIZE;
                                            //Porzadkuje kopiec dla polowy elementów, takich, które mają dzieci
       for i:=(SIZE div 2)  downto 1 do begin
           porzadkowanie_kopiec(i, SIZE);
       end;

       for i:=rozmiar_malejacy downto 2 do begin

           swap(1,i);
           porzadkowanie_kopiec(1, i-1);
     end;
end;

Procedure Szybkie_sortowanie(var liczby: tab; index_lewy, Index_prawy: Integer);
 var
     Punkt,iteracja_lewa,iteracja_prawa,i:Integer;
 begin
     If index_lewy < Index_prawy Then
     begin
         Punkt := liczby[random(Index_prawy-index_lewy) + index_lewy+1];  { losowanie elementu dzielącego }

         iteracja_lewa := index_lewy-1;
         iteracja_prawa := Index_prawy+1;
         repeat
             repeat inc(iteracja_lewa) Until Punkt <= liczby[iteracja_lewa];
             repeat dec(iteracja_prawa) Until Punkt >= liczby[iteracja_prawa];

             if(iteracja_lewa<=iteracja_prawa) then swap(iteracja_lewa,iteracja_prawa);

         until iteracja_lewa >= iteracja_prawa;

         Szybkie_sortowanie(liczby,index_lewy,iteracja_lewa-1);
         Szybkie_sortowanie(liczby,iteracja_lewa,Index_prawy);
     end;


 end;



begin
     nr_wypelnienia:= 1;
     wypelnij;
     wypisz;
    { wybieranie;
     wypisz;
     wypelnij;
     babelkowe;
     wypisz;
     wypelnij;
     wstawianie;
     wypisz;
     wypelnij;
     sort_kopiec;
     wypisz;
     wypelnij; }
     szybkie_sortowanie(liczby,1,SIZE);
     wypisz;

     {GetTime(godz1,min1,sek1,ssek1);
      czas_trwania_sortowania:=((60*min2*100 + 100*sek2 + ssek2) - (60*min1*100 + 100*sek1 + ssek1))/100;
      writeln(czas_trwania_sortowania:4:2); }
readln;
end.

