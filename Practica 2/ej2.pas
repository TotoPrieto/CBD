{
  Se necesita contabilizar los CD vendidos por una discográfica. Para ello se dispone de
un archivo con la siguiente información: código de autor, nombre del autor, nombre
disco, género y la cantidad vendida de ese CD. Realizar un programa que muestre un
listado como el que se detalla a continuación. Dicho listado debe ser mostrado en
pantalla y además listado en un archivo de texto. En el archivo de texto se debe listar
nombre del disco, nombre del autor y cantidad vendida. El archivo origen está
ordenado por código de autor, género y nombre disco.
}

program ej2;
type
  disco = record
    codAutor: integer;
    nombreAutor: string;
    nombreDisco: string;
    genero: string;
    cantidadVendida: integer;
  end;

  archivo = file of disco;

procedure crearArchivo(var a: archivo; var t: text);
var
  d: disco;
begin
  reset(t);
  Rewrite(a);
  while not eof(t) do begin
    readln(t, d.codAutor);
    readln(t, d.nombreAutor);
    readln(t, d.genero);
    readln(t, d.cantidadVendida);
    readln(t, d.nombreDisco);
    write(a, d);
    end;  
  close(a);
  close(t);
end;

procedure imprimir(var a: archivo);
var
  d:disco;
  cantG: integer;
  cantA: integer;
  cantD: integer;
  nombreG: string;
  nombreA: string;
  termino: boolean;
begin
  WriteLn('-------------------');
  reset(a);
  cantD:= 0;
  read(a, d);
  termino:=false;
  while termino = false do begin
    writeln(d.nombreAutor);
    WriteLn('Autor: ', d.nombreAutor);
    cantA:= 0;
    nombreA:= d.nombreAutor;
    while (termino = false) and (d.nombreAutor = nombreA) do begin
      cantG:= 0;
      WriteLn('Genero: ', d.genero);
      nombreG:= d.genero;
      writeln(nombreG);
      while (termino = false) and (d.nombreAutor = nombreA) and (d.genero = nombreG) do begin
        writeln('Nombre del disco: ', d.nombreDisco, '. Cantidad vendida: ', d.cantidadVendida, '.');
        cantD+=1;
        cantG+=1;
        cantA+=1;
        if(eof(a)) then begin
          termino:=true;
          break;
          end;
        read(a, d);
        end;
        WriteLn('Total Genero: ', cantG);
        WriteLn();
      end;
      WriteLn('Total Autor: ', cantA);
      WriteLn('------------------------------------');
    end;
    WriteLn('Total Discos: ', cantD);
    Close(a);
  end;

var
  a: archivo;
  origen: text;
  lista: text;
begin
  assign(a, 'discos.dat');
  Assign(lista, 'listado.txt');
  assign(origen, 'discos.txt');
  crearArchivo(a,origen);
  imprimir(a);
end.