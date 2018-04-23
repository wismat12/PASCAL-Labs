program trojkatpascala;

function pascal(n,k:integer):integer;
begin
  if (k=0) or (k=n) then
     pascal := 1
  else
     pascal := pascal(n-1, k-1) + pascal(n-1,k);
end;
