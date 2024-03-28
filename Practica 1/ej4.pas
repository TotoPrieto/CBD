Program ej4;
{
  Crear un procedimiento que reciba como parámetro el archivo del punto 2, y
genere un archivo de texto con el contenido del mismo}

procedure generarArchivoTexto(var archivo: archivoDeEnteros);
var
  texto: text;
  entero: integer;
begin
  assign(archivo, 'archivoEnteros');
  reset(archivo);
  assign(texto, 'archivoTexto');
  rewrite(texto);
  while (not eof(archivo)) do begin
    read(archivo, entero);
    writeln(texto, entero);
  end;
  close(archivo);
  close(texto);

end;

begin
  
end.