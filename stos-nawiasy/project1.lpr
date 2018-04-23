program project1;
uses crt;
type
    Pnawias = ^nawias;
    nawias = record
      element: char;
      next: Pnawias;
    end;
var
  tymczasowy, zwrocony: char;
  wyrazenie: string;
  i: Integer;
  head: Pnawias;
  error: boolean;

procedure pop(element: char);
var
  tmp: Pnawias;
Begin
     new(tmp);
     tmp^.element:=element;
     tmp^.next:=nil;
     if head<>nil then tmp^.next:=head;
     head:=tmp;
end;
function IsEmpty(): boolean;
begin
     if head = nil then IsEmpty:=true
        else IsEmpty:=false;
end;

function push(): char;
var
  tmp: Pnawias;
  zwrotny: char;
Begin
     if not(IsEmpty()) then begin
       zwrotny:=head^.element;
       tmp:=head;
       head:=tmp^.next;
       dispose(tmp);
       push:=zwrotny;
     end
        else error:= true;

end;

begin
     head:= nil;
     writeln('Podaj wyrazenie: ');
     readln(wyrazenie);
     error:=false;
     for i:=1 to length(wyrazenie) do begin
       tymczasowy:=wyrazenie[i];
       if ((tymczasowy='(')or(tymczasowy='{')or (tymczasowy='[')) then pop(tymczasowy)
       else begin
          zwrocony:= push();
         if not(((zwrocony='(')and(tymczasowy=')'))or((zwrocony='{')and(tymczasowy='}'))or((zwrocony='[')and(tymczasowy=']'))) then error:= true;
         if error then break;
            end;
     end;

     if not(error) then writeln('Podales dobre wyrazenie')
     else writeln('Podales zle wyrazenie');
readln;
end.

