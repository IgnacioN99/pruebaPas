program prueba;
type
  producto=record
    cod:1..30;
    cantVendida:integer;
    costo:integer;
    precioDeVenta:integer;
  end;
  productosEnVenta=array [1..10] of producto;
  ganancias=array [1..30]of integer;
  sucursal:record
    cod:integer;
    prod:productosEnVenta;
  end;
begin
end.
