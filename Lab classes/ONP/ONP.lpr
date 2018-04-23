program ONP;
uses crt;
type
    num = ^lista;
    lista = record
      liczba: Real;
      next: num;
    end;
var
   head: num;
   i,j: integer;
   symbol: string;
   v1,v2 : real;
   c: word;

procedure push(liczb: real);
var tmp: num;
begin
     new(tmp);
     tmp^.liczba:=liczb;
     tmp^.next:=nil;
     if head<>nil then begin
       tmp^.next:=head;
     end;
     head:=tmp;
end;
function pop(): Real;
var
   tmp: num;
   zwrotny: real;
begin
     if head<>nil then begin
      tmp:=head;
     zwrotny:=tmp^.liczba;
     head:=tmp^.next;
     dispose(tmp);
     pop:=zwrotny;
end;
end;

Begin
  head:=nil;
  repeat
  writeln('Podaj liczbe lub wyrazenie dla ONP'); readln(symbol);
  if symbol = '=' then break;

  val(symbol,v1,c);

   if c = 0 then  push(v1)
      else begin
      v2 := pop();    // pobieramy ze stosu dwa argumenty
      v1 := pop();
      case symbol of        // wykonujemy operacje wg operatora
        '+' : v1 := v1 + v2;
        '-' : v1 := v1 - v2;
        '*' : v1 := v1 * v2;
        '/' : v1 := v1 / v2;
      end;
   push(v1);

   end;
  until false;
  writeln(head^.liczba);
readln;
end.

