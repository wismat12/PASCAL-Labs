program dziesiatkowy;

uses crt;

type
    ai = Array[1..100] of Integer;

var
    i, j, liczba, liczbac, podstawa, wynik, reszta :integer;
    reszty :ai;

begin
    ClrScr;
    writeln('Program zamienia liczbę podaną w systemie dziesiątkowym');
    writeln('na liczbę w systemie o zadanej podstawie p.');
    writeln('Podaj liczbe w systemie dziesiątkowym: ');
    read(liczba);
    writeln('Podaj podstawę p nowego systemu liczbowego:');
    read(podstawa);
    
    i := 1;
    liczbac := liczba;
    repeat
        reszta := liczbac Mod podstawa;
        liczbac := (liczbac - reszta) Div podstawa;
        reszty[i] := reszta;
        i := i + 1;
    until liczbac = 0;
   
    writeln('Liczba ', liczba, ' w systemie o podstawie ', podstawa, ' wynosi: ');
    for j := i-1 downto 1 do
        if ((reszty[j] >= 0) and (reszty[j] <=9)) then
            write(reszty[j])
        else
            write(Char(97+(reszty[j]-10)));
    writeln();
end.

