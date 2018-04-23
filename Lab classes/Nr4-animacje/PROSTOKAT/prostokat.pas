program prostokat;
 uses crt;
var
  dx,dy,i,j,a,b,bok:integer;
  d:boolean;


  begin

    writeln('Podaj wymiar poziomy ekranu: ');
    readln(dx);
    writeln('Podaj wymiar pionowy ekranu: ');
    readln(dy);
    clrscr;
    a:=trunc(dx/2)+1;
    b:=trunc(dy/2)+1;
    //repeat
    bok:=3;
    gotoxy(a,b);

    for i:=1 to bok do begin
        for j:=1 to bok do begin
            if (i=1) or (i=bok) then begin
            write('x');
            if j=bok then gotoxy(a+1,b) end;


            if (i<>1) and (i<>bok) then if (j=1) or (j=bok) then
                                                     write('x')
                                                     else write('_');
            if j=bok then  gotoxy(a+1,b);
        end;
    end;
     bok:= bok + 2;
    dec(a);
    dec(b);

    //delay(1000);
    //ClrScr;
   // until ((a=0)or(b=0));


    readln;
  end.





