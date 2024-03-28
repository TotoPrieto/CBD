{
  Desarrollar un programa que permita la apertura de un archivo de números enteros
no ordenados. La información del archivo corresponde a la cantidad de votantes
de cada ciudad de la provincia de buenos aires en una elección presidencial.
Recorriendo el archivo una única vez, informe por pantalla la cantidad mínima y
máxima de votantes. Además durante el recorrido, el programa deberá listar el
contenido del archivo en pantalla. El nombre del archivo a procesar debe ser
proporcionado por el usuario.

}
Program ej2;
var
  archivo: Text;
  nombre: String;
  votantes, min, max: Integer;
begin
  writeln('Ejercicio 2');
  writeln('-----------'); 
  min:=999;
  max:=0;
  writeln('Ingrese el nombre del archivo a procesar: ');
  readln(nombre);
  assign(archivo,nombre);
  reset(archivo);
  while not eof(archivo) do begin
    read(archivo,votantes);
    writeln(votantes);
    if votantes<min then begin
      min:=votantes;
      end else begin
    if votantes>max then
      max:=votantes; 
      end;
  end;
  WriteLn('El minimo de votantes es: ',min);
  WriteLn('El maximo de votantes es: ',max);
  close(archivo);
  WriteLn('Presione ENTER para finalizar...');
end.