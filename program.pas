program prueba;
type
  producto=record
    cod:1..30;
    cantVendida:integer;
    costo:real;
    precioDeVenta:real;
  end;
  productosEnVenta=array [1..10] of producto;
  ganancias=array [1..30]of real;
  sucursal:record
    cod:integer;
    prod:productosEnVenta;
  end;
  lista:^nodo;
  nodo:record
    datos:sucursal;
    sig:lista;
  end;
{Se dispone de la estructura para acceder al nombre}
  nombre=string[100];
  estructura=array[1..30] of nombre;
procedure agregarALaLista(var l:lista;datos:sucursal)
var
  aux:lista;
begin
  new(aux);
  aux^.datos:=datos;
  aux^.sig:=l;
  l:=aux;
end;
procedure CleanMemory(var l:lista);
var
  aux:lista;
begin
  while(l<> nil) do begin
    aux:=l;
    l:=l^.sig;
    dispose(aux);
end;
procedure EnVenta(var a:productosEnVenta);
var
  i:integer;
begin
  for i:=1 to 10 do begin
    with a[i] do begin
      read(cod);
      read(cantVendida);
      read(costo);
      read(precioDeVenta);
    end;
  end;
end;
function codPar(cod:integer):boolean;
var
  digito,aux:integer;
begin
  aux:=0;
  while cod<>0 do begin
    digito:=cod MOD 10;
    cod:=cod DIV 10;
    aux:=aux+digito;
  end;
  codPar:=aux MOD 2=0;
end;
procedure Gananciasxd()
begin
end.
