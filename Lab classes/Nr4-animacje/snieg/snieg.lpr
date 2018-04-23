program snieg;

uses crt;

type
    ai = Array[1..10000] of Char;

var
    i, j, dx, dy, p :integer;
    m :ai;

begin
    ClrScr;
    writeln('Podaj wymiar poziomy ekranu: ');
    read(dx);
    writeln('Podaj wymiar pionowy ekranu: ');
    read(dy);

    for i := 1 to dx*dy do
        m[i] := ' ';

    randomize;
    repeat
        ClrScr;
        p := random(dx)+1;
        for i := dy downto 2 do
            for j := dx downto 1 do
                m[(i*dx)-j+1] := m[((i-1)*dx)-j+1];
        for i := 1 to dx do
            m[i] := ' ';
        m[p] := 'x';
        for i := 1 to dx*dy do
            if i Mod dx = 0 then
                writeln(m[i])
            else
                write(m[i]);
        writeln();
        delay(300);
    until KeyPressed;
end.

