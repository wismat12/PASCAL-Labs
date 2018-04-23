program liczby_pierwsze;

uses dos, crt;

const
  zakres = 100;
var

 // godz1,godz2,min1,min2,sek1,sek2,ssek1,ssek2,a,c:word; //zmienne do czasu
  tab : array[2..zakres] of boolean; //tablica - wartosci logiczne dla liczb z zakresu
  i,w,p: integer;     //liczby z zakresu, ich wielkorotnosci, ilosc liczb pierwszych
  //plik:Text;                               //zmienna odpowiedzialna za plik tekstowy
begin
 // GetTime(godz1,min1,sek1,ssek1);
  writeln('Zakres liczb jest rowny: ',zakres);

  for i := 2 to zakres do tab[i] := true;  //petla, dla wszystkich wartosci prawda

  i:= 1;
  repeat
    i := i+1;                              //liczba ktorej rozpatrujemy wielkorotnosci
    w := i*2;                              //okresla wielkorotnosci i, wieksze i
      repeat
        tab[w] := false;                   //wielkrotnosc i (wieksza od i) otrzymuje falsz
        inc(w,i);                          //zwiekszenie w o liczbe i
      until (w > zakres);
  until (i > sqrt(zakres));                //powtarzamy petle az i bedzie wieksza od
 // assign(plik,'liczbypierwsze.txt');       //pierwiastka z zakresu
 // rewrite(plik);                           //utworzenie pliku gdzie beda wypisane liczby
 // p := 0;                                  //ilosc liczb pierwszych z zakresu
  for i := 2 to zakres do begin
    if (tab[i]) then
    begin
        //inc(p);
     //   Writeln(plik, i);
        writeln(i);
    end;
  end;
 // Close(plik);

  //writeln('Dla zakresu rownego ',zakres,' wygenerowano ',p,' liczb pierwszych');

 // GetTime(godz2,min2,sek2,ssek2);
 //// a:= (100*sek1+ssek1);
 // c:= (100*sek2+ssek2);
 // Writeln('W czasie : ',c-a,' setnych sekund');
  readln;
end.
