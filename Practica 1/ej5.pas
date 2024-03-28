{
  Realizar un programa, con la declaración de tipos correspondientes que permita
crear un archivo de registros no ordenados con información de especies de flores
originarias de América. La información será suministrada mediante teclado. De
cada especie se registra: número de especie, altura máxima, nombre científico,
nombre vulgar, color y altura máxima que alcanza. La carga del archivo debe
finalizar cuando se reciba como nombre científico: ’zzz’.
Además se deberá contar con opciones del programa que posibiliten:

a) Reportar en pantalla la cantidad total de especies y la especie de menor y de
mayor altura a alcanzar.
b) Listar todo el contenido del archivo de a una especie por línea.
c) Modificar el nombre científico de la especie flores cargada como: Victoria
amazonia a: Victoria amazónica.
d) Añadir una o más especies al final del archivo con sus datos obtenidos por
teclado. La carga finaliza al recibir especie “zzz”.
e) Listar todo el contenido del archivo, en un archivo de texto llamado “flores.txt”.
El archivo de texto se tiene que poder reutilizar.
f) ¿Qué cambiaría en la escritura del archivo de texto si no fuera necesario
utilizarlo?
}

Program ej5;
uses SysUtils;

type
  especie = record
    num: integer;
    altura: real;
    nombre_cientifico: string;
    nombre_vulgar: string;
    color: string;
  end;

  archivo = file of especie;

Procedure minMaxEspecies(var f: archivo);
var
  e: especie;
  min, max: real;
  cant: integer;
  min_especie, max_especie: string;
begin
  cant := 0;
  Reset(f);
  min := 9999;
  max := 0;
  while not eof(f) do
  begin
    cant := cant + 1;
    read(f, e);
    if e.altura < min then begin
      min := e.altura;
      min_especie := e.nombre_cientifico;
    end;
    if e.altura > max then begin
      max := e.altura;
      max_especie := e.nombre_cientifico;
    end;
  end;
  Close(f);
  WriteLn('Cantidad total de especies: ', cant, '.');
  WriteLn('Especie de menor altura: ', min_especie, ' con ', min:2:2, ' metros.');
  WriteLn('Especie de mayor altura: ', max_especie, ' con ', max:2:2, ' metros.');
end;

procedure agregarEspecie(var f: archivo);
var 
  e: especie;
  n: integer;
begin
  if FileExists('flores.dat') then begin
    Reset(f); // Abre el archivo para lectura si ya existe
    n := FileSize(f);
    Seek(f, n);
  
    writeln('El archivo ya existe.');
    end
  else begin
    Rewrite(f); // Crea el archivo si no existe
    writeln('El archivo no existe.');
  end;
  Write('Nombre cientifico: ');
  readln(e.nombre_cientifico);
  while e.nombre_cientifico <> 'zzz' do begin
    with e do begin
      Write('Numero de especie: ');
      readln(num);
      Write('Altura maxima: ');
      readln(altura);
      Write('Nombre vulgar: ');
      readln(nombre_vulgar);
      Write('Color: ');
      readln(color);
      writeln('');
    end;
    write(f, e);
    Write('Nombre cientifico: ');
    readln(e.nombre_cientifico);
  end;
end;

procedure listar(var f: archivo);
var
  e: especie;
  i: integer;
begin
  i := 1;
  Reset(f);
  while not eof(f) do begin
    read(f,e);
    with e do begin
      WriteLn('Especie ', i);
      WriteLn('Numero de especie: ', num);
      WriteLn('Altura maxima: ', altura:2:2);
      WriteLn('Nombre cientifico: ', nombre_cientifico);
      WriteLn('Nombre vulgar: ', nombre_vulgar);
      WriteLn('Color: ', color);
      i+=1;
      WriteLn('---------------------------------');
    end;
  end;
  close(f);
end;

Procedure Modificar(var f: archivo);
var
  e: especie;
  nombre: string;
  exito :integer;
begin
  exito :=0;
  Write('Ingrese el nombre científico de la especie a modificar: ');
  ReadLn(nombre);
  Reset(f);
  while not eof(f) do begin
    read(f, e);
    if (e.nombre_cientifico = nombre) then begin
      Write('Nombre encontrado. Ingrese el nuevo nombre cientifico: ');
      ReadLn(e.nombre_cientifico);
      Seek(f, FilePos(f) - 1);
      write(f, e);
      writeln('Cambiado con exito.');
      exito := 1;
    end;
  end;
  Close(f);
  if exito = 0 then begin
    writeln('Nombre no encontrado. Saliendo al menu...');
  end;
end;

Procedure listarEnTexto(var f: archivo; var t: Text);
var
  e: especie;
begin
  Assign(t, 'flores.txt');
  Rewrite(t);
  Reset(f);
  while not eof(f) do begin
    read(f, e);
    with e do begin
      WriteLn(t, 'Numero de especie: ', num);
      WriteLn(t, 'Altura maxima: ', altura:2:2);
      WriteLn(t, 'Nombre cientifico: ', nombre_cientifico);
      WriteLn(t, 'Nombre vulgar: ', nombre_vulgar);
      WriteLn(t, 'Color: ', color);
      WriteLn(t, '---------------------------------');
    end;
  end;
  Close(t);
  Close(f);

end;


var
  f: archivo;
  t: Text;
  i: Integer;
begin
  WriteLn('Bienvenido!');
  assign(f, 'flores.dat');
  while i <> 6 do begin
    WriteLn('Menu de opciones:');
    WriteLn('1. Reportar la cantidad total de especies y la especie de menor y de mayor altura a alcanzar.');
    WriteLn('2. Listar todo el contenido del archivo.');
    WriteLn('3. Modificar el nombre científico.');
    WriteLn('4. Crear/Agregar una o mas especies.');
    WriteLn('5. Listar todo el contenido del archivo en otro de texto.');
    WriteLn('6. Salir.');
    Write('Opcion: ');
    ReadLn(i);
    WriteLn('');
    case i of
      1: minMaxEspecies(f);
      2: listar(f);
      3: Modificar(f);
      4: agregarEspecie(f);
      5: listarEnTexto(f,t);
      6: Break;
      end;
      writeln('');
      writeln('');
      end;
      WriteLn('Programa finalizado.');
      end.