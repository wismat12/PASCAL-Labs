program dwojkowy;

uses crt;

var
    w, i, n, p:integer;
    d: string[10];

begin
    writeln('Podaj liczbe w systemie dwojkowym: ');
    readln(d);
    i:=1;
    n:=0;
    for i:=1 to 10 do begin
        if (Integer(d[i]) >= 48) and (Integer(d[i]) <= 49) then begin
            n := n + 1;
        end else
            break;
    end;
    i:=1;
    w:=0;
    p:=1;
    for i:=1 to n do begin
        w := w + (Integer(d[n-i+1])-48)*p;
        p := p * 2;
    end;

    writeln('Podana liczba w systemie dziesiętnym to: ', w);
end.

