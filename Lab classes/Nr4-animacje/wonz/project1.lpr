program project1;




uses
  crt;

const
  szer = 11;
  wys = 7;
  il_klatek = 20;

var
  tab: array [1..szer] of integer;
  rand: integer;
  i, n, k: integer;
  jest: boolean;

begin
  randomize;


  for i := 1 to szer do
  begin
    tab[i] := 0;   //inicjalizacja
  end;

  repeat//for k := 1 to il_klatek do

    // losowanie kolomny dla nowego węża
    jest := True;
    while jest = True do
    begin
      rand := random(szer) + 1;

      if tab[rand] = 0 then
        jest := False;
    end;
      tab[rand] := 1;

    for i := 1 to szer do
    begin
      if tab[i] <> 0 then
        Inc(tab[i]);  //przesun weza
      if tab[i] > wys + 3 then   // waz wyszedl
        tab[i] := 0;

      for n := 1 to wys do   // rysuj plansze
      begin
        gotoxy(i, n);
        if tab[i] = n then
          Write('X')
        else if tab[i] - 1 = n then
          Write('X')
        else if tab[i] - 2 = n then
          Write('X')
        else
          Write(' ');
      end;

    end;
    delay(1000);
    clrscr;
  until keypressed;


  readkey;
end.

