program Full_wypas;
uses crt;

type
    tab1 = array[1..100] of integer;
var
    i, j, g:integer;                              //Liczniki
    liczbac, podstawa, podstawa2, reszta:integer;
    p:integer;                                   //Potega przy zamianie liczby na 10
    w:integer;                                   //Wynik liczby w (10)
    n: integer;                                  //Ilosc znakow pierwszej liczby
    reszty: tab1;
    st1: string[100];
    error :boolean;
begin
     writeln('Podaj system liczbowy w jakim wprowadzisz Swoja liczbe w zakresie (2-20)');
     readln(podstawa);
     writeln('Podaj Swoja liczbe w systemie (',podstawa,')');
     readln(st1);
     writeln('Podaj nowy system Twojej liczby');
     readln(podstawa2);

     error:=true;

     i:= 1;
     n:= 0;

     for i:= 1 to length(st1) do begin  //Sprawdzenie czy dany znak nalezy do systemu liczbowego
       if (((integer(st1[i]) >= 48) and (integer(st1[i]) <= ((57 - (10 - podstawa))))) or ((podstawa >= 10) and ((integer(st1[i]) >= 97) and (integer(st1[i]) <= (97 + (podstawa - 10)))))) then inc(n)
          else  error:=false
     end;
     if error then begin
     writeln('Podales liczbe ',st1,' w systemie (',podstawa,') - ktora zostanie zamieniona na liczbe w systemie (',podstawa2,')');

     i:= 1;
     w:= 0;
     p:= 1;

     for i:= 1 to n do begin                                                     {zamiana liczby na postac (10)}
       if (integer(st1[n-i+1]) <= 57) then w:= w + (integer(st1[n-i+1])-48)*p    {Mnozenie kazdego znaku przez podstawe systemu w odp potedze}
          else  w:= w + (integer(st1[n-i+1])-87)*p;
          p:=p*podstawa;
     end;
     g:= 1;
     liczbac:=w;                                                                {Liczba z (10) przechodzi na wprowadzony drugi system}
     repeat
           reszta:= liczbac mod podstawa2;
           liczbac:= (liczbac - reszta) div podstawa2;
           reszty[g]:=reszta;
           inc(g);
     until liczbac = 0;

     writeln('Liczba ',st1,'(',podstawa,') w systemie (',podstawa2,') przyjmuje postac: ');
     for j := g - 1 downto 1 do
        if ((reszty[j] >= 0) and (reszty[j] <=9)) then
            write(reszty[j])
        else
            write(Char(87+(reszty[j])));
    writeln();

     end;
    if not error then  writeln('...Ale, - Popelniles blad przy wprowadzaniu zmiennych, - podana liczba nie pasuje do jej systemu!!!');
readln;
end.


