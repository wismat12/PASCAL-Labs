program project1;
uses crt;
type
    Ppoz = ^poz;
    poz = record
      pozycja: char;
      next: Ppoz;
    end;
var
  wyrazenie: string;
  head: Ppoz;
  tymczasowy,zwrocony: char;
  i: Integer;
  error: boolean;


procedure push(element: char);
var
   tmp: Ppoz;
Begin
     new(tmp);
     tmp^.pozycja:=element;
     if head = nil then begin
     tmp^.next:= nil;
     end
     else
         tmp^.next:=head;
     head:=tmp;
end;
function pop(): char;
var
   tmp: Ppoz;
   element: char;
Begin
     element:=head^.pozycja;
     if head^.next <>  nil then begin
        tmp:= head;
        head:=tmp^.next;
        dispose(tmp);
     end
        else begin
          tmp:=head;
          head:=nil;
          dispose(tmp);
        end;
     pop:=element;
end;
function IsEmpty(): boolean;
Begin
     if head = nil then IsEmpty:= true
        else IsEmpty:= false;
end;


begin

  head:=nil;
  writeln('Wprowadz wyrazenie nawiasowe');
  readln(wyrazenie);
   error:= false;
  for i:= 1 to length(wyrazenie) do begin
          tymczasowy:=  wyrazenie[i];

          if (tymczasowy = '(') or (tymczasowy = '{') or (tymczasowy = '[') then push(tymczasowy);
          if not(IsEmpty()) then begin
          if (tymczasowy = ')') or (tymczasowy = '}') or (tymczasowy = ']') then begin
          zwrocony:= pop();
         // if not(IsEmpty) then begin
                          if  not(((zwrocony = '{' )and (tymczasowy = '}')) or ((zwrocony = '(')and (tymczasowy = ')')) or ((zwrocony = '[') and (tymczasowy = ']'))) then error:= true;
         end;
          end
          else error:= true;
          if error then  break;
         // end;

  end;
  if not(error) then
     writeln('Wprowadziles dobre wyrazenie!')
  else
      writeln('Zle!');

readln;
end.

