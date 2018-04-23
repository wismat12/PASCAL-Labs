
program project1;




uses  crt, dos, sysutils, math;

var
  szerokosc, wysokosc, srodekszer, srodekwys, i, j ,maxk,krok,k,mnoznik,t: integer;
  tab: array[1..1000] of char;


begin
  writeln ('Podaj nieparzysta szerokosc');
  read(szerokosc);
  while NOT odd(szerokosc) do
  begin
    writeln ('Podaj nieparzysta szerokosc');
    read(szerokosc);
  end;
  writeln('Podaj nieparzysta wysokosc');
  read(wysokosc);
  while NOT odd(wysokosc) do
  begin
    writeln('Podaj nieparzysta wysokosc');
    read(wysokosc);
  end;
  clrscr;
  writeln(szerokosc);
  writeln(wysokosc);

  srodekszer:= (szerokosc div 2)+1;
  srodekwys:= (wysokosc div 2)+1;
  if szerokosc>=wysokosc then maxk:=wysokosc div 2
     else maxk:=szerokosc div 2;

  krok:=0;
  mnoznik:=-1;
  for i:=1 to szerokosc*wysokosc do tab[i]:='o';
  repeat


      //for k:=0 to krok do begin
    k:=krok;
         for i:=1 to wysokosc do
         begin
           for j:=1 to szerokosc do
           begin
             if (i=srodekwys)and(j=srodekszer) then tab[((i-1)*szerokosc)+j]:='X'//write('X')
             else
             tab[((i-1)*szerokosc)+j]:='o';
             for t:=0 to k do
             if ((i=srodekwys-k+t)and(j=srodekszer-k+t))or((i=srodekwys-k+t)and(j=srodekszer+k-t))or((i=srodekwys+k-t)and(j=srodekszer-k+t))or((i=srodekwys+k-t)and(j=srodekszer+k-t)) then tab[((i-1)*szerokosc)+j]:='X'//write ('X');
             //else if mnoznik<0 then tab[((i-1)*szerokosc)+j]:='o';//write ('o');
            // if((i=srodekwys-k)and(j=srodekszer-k))or((i=srodekwys-k)and(j=srodekszer+k))or((i=srodekwys+k)and(j=srodekszer-k))or((i=srodekwys+k)and(j=srodekszer+k)) then tab[((i-1)*szerokosc)+j]:='X';


           end;
       //  writeln;
         end;
    for i:=1 to szerokosc*wysokosc do begin
    if (i mod szerokosc) = 0 then writeln(tab[i])
    else
        write(tab[i]);
    end;
         delay(1000);

    clrscr;
    //end;


    if (krok =0 )or (krok=maxk )then
      mnoznik:=mnoznik*(-1);

      krok:=krok + 1*mnoznik;



    until (keypressed);




  readkey;


end.

