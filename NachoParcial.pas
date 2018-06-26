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
procedure estrcuraQueSeDispone(e:estructura;cod:integer;var n:nombre);
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
procedure Gananciasxd(var g:ganancias,s:sucursal);
var
  i:integer;
  ganancia:real;
begin
  for i := 1 to 10 do begin
    ganancia:=(s.prod[i].precioDeVenta-s.prod[i].costo)*s.prod[i].cantVendida;
    g[s.prod[i]]:=g[s.prod[i]]+ganancia;
  end;
end;
procedure creadorLista(var l:lista);
var
  s:sucursal;
begin
  read(s.codigo);
  while s.codigo <> 0 do begin
    EnVenta(s.prod);
    agregarALaLista(l,s);
    read(s.codigo);
  end;
end;
procedure maxGanancia(g:ganancia;var n:nombre;e:estructura);
var
  i,m:integer;
  max:real;
begin
  for i:=1 to 30 do begin
     if(max<g[i])then begin
       m:=i;
       max:=g[i];
    end;
    estrcuraQueSeDispone(e,m,n);
  end;
end;
procedure inicializar(var g:ganancia);
var
  i:integer;
begin
  for i:=1 to 30 do begin
    g[i]:=0;
  end;
end;
procedure recorridoLista(l:lista;var g:ganancias);
var
  aux:boolean
begin
  while l<> nil do begin
    aux:=codPar(l^.cod);{punto b}
    if (aux) then
      writeln(l^.cod, 'la suma de sus digitos es par');
    Gananciasxd(g,l^.datos);{punto c}
    l:=l^.sig;
  end;
end;
var
  l:lista;
  g:ganancias;
  n:nombre;
  e:estructura;
begin
  l:=nil;
  inicializar(g);
  creadorLista(l);{Punto a}
  recorridoLista(l,g);{Con una sola recorrida papu}
  maxGanancia(g,n,e);{punto d}
  writeln('el producto con mayor ganancia es: ',n);
  CleanMemory(l);
  {TERMINE PUTOS, porque no me salio asi en el parcial t.t}
end.
