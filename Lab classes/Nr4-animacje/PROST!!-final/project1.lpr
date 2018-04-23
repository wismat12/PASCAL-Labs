program project1;

uses crt, math;

var
    i, dx, dy, m, n, xs, ys, x, y, k:integer;
    wmin :real;

begin
    ClrScr;
    repeat
        writeln('Podaj wymiar poziomy ekranu (liczba nieparzysta): ');
        read(dx);
    until (dx Mod 2) <> 0;
    repeat
        writeln('Podaj wymiar pionowy ekranu (liczba nieparzysta): ');
        read(dy);
    until (dy Mod 2) <> 0;

    n := dx*dy;
    xs := (dx Div 2) + 1;
    ys := (dy Div 2) + 1;
    i := 0;
    k := -1;
    if dx < dy then
        wmin := dx Div 2

    else
        wmin := dy Div 2;
    repeat
        ClrScr;
        for m :=1 to n do
        begin
            x := (m Mod dx);
                if x = 0 then
                    x := dx;
            y := ((m-1) Div dx) + 1;

            if (((Abs(x-xs) = i) And (Abs(y-ys) <= i)) Or ((Abs(y-ys) = i) And (Abs(x-xs) <= i))) Then
                Write('X')
            else
                Write('+');
            if x = dx then
                Writeln;
        end;
        delay(300);
        if (i = 0) Or (i = wmin) then
            k := k * (-1);
        i := i + k*1;
    until KeyPressed;
end.

