{Realizar un programa que permita crear un archivo de texto. El archivo se debe
cargar con la información ingresada mediante teclado. La información a cargar
representa los tipos de dinosaurios que habitaron en Sudamérica. La carga finaliza
al procesar el nombre ‘zzz’ que no debe incorporarse al archivo.}
Program ej3;
var
  archivo:text;
  dinosaurios,nombreArchivo: String;
begin
  writeln('Ejercicio 3');
  writeln('-----------');
  WriteLn('Ingresar nombre del archivo:');
  ReadLn(nombreArchivo);
  Assign(archivo,nombreArchivo);
  Rewrite(archivo);
  WriteLn('Ingresar nombre del dinosaurio:');
  ReadLn(dinosaurios);
  while (dinosaurios <> 'zzz') do begin
    WriteLn(archivo, dinosaurios);
    WriteLn('Ingresar nombre del dinosaurio:');
    ReadLn(dinosaurios);
  end;
  Close(archivo);
  WriteLn('Archivo creado correctamente.');
end.