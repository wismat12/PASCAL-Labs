program dziesiatkowy;

uses crt;

type
    ai = Array[1..1000] of Char;

var
    i, j, dx, dy, np, op :integer;
    m :ai;

begin
    ClrScr;
    writeln('Podaj wwymiar poziomy ekranu: ');
    read(dx);
    writeln('Podaj wymiar pionowy ekranu: ');
    read(dy);

    for i := 1 to dx*dy do
        m[i] := 'o';

    op := 1;
    np := 1;
    repeat
        ClrScr;
        randomize;
        op := np;
        np := random(dx*dy-1)+1;
        m[op] := 'o';
        m[np] := 'X';
        for i := 1 to dx*dy do
            if i Mod dx = 0 then
                writeln(m[i])
            else
                write(m[i]);
        writeln();
        delay(300);
    until KeyPressed;
end.

