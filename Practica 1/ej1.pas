{Realizar un programa que permita crear un archivo conteniendo información de
nombres de materiales de construcción, el archivo no es ordenado. Efectúe la
declaración de tipos correspondiente y luego realice un programa que permita la
carga del archivo con datos ingresados por el usuario. El nombre del archivo debe
ser proporcionado por el usuario. La carga finaliza al procesar el nombre ‘cemento’
que debe incorporarse al archivo.}

Program ej1;
var
  archivo: Text;
  nombreArchivo, material: string;
begin
  writeln('Ejercicio 1');
  writeln('-----------');
  writeln('Ingrese el nombre del archivo: ');
  readln(nombreArchivo);
  assign(archivo, nombreArchivo);
  rewrite(archivo);
    repeat
      Write('Nombre del material:');
      ReadLn(material);
      WriteLn(archivo,material);
    until material='cemento';
  close(archivo);
  writeln('El archivo se ha cargado correctamente.');
  readln;
end.