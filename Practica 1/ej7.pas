{
  Realizar un programa con opciones para:
a. Crear un archivo de registros no ordenados con la información
correspondiente a los alumnos de la facultad de ingeniería y cargarlo con
datos obtenidos a partir de un archivo de texto denominado “alumnos.txt”.
Los registros deben contener DNI, legajo, nombre y apellido, dirección, año
que cursa y fecha de nacimiento (longInt).
b. Listar en pantalla toda la información de los alumnos cuyos nombres
comiencen con un carácter proporcionado por el usuario.
c. Listar en un archivo de texto denominado “alumnosAEgresar.txt” todos los
registros del archivo de alumnos que cursen 5º año.
d. Añadir uno o más alumnos al final del archivo con sus datos obtenidos por
teclado.
e. Modificar el año que cursa un alumno dado. Las búsquedas son por legajo
del alumno.
}

Program ej7;
Uses sysutils;
Type
  alumno = record
    DNI: longInt;
    legajo: longInt;
    nombre: string[20];
    apellido: string[20];
    direccion: string[20];
    anio: integer;
    fechaNac: longInt;
  end;
  archAlum = file of alumno;


  procedure crearArchivo(var archivo: archAlum);
  var
    texto: text;
    reg: alumno;
  begin
    Rewrite(archivo);
    Assign(texto, 'alumnos.txt');
    reset(texto);
    while not eof(texto) do begin
      readln(reg.DNI, reg.legajo, reg.nombre, reg.apellido, reg.direccion, reg.anio, reg.fechaNac);
      write(archivo, reg);
    end;
    Close(texto);
    close(archivo);
  end;

  procedure listarPorNombre(var archivo: archAlum);
  var
    reg: alumno;
    letra: char;
  begin
    writeln('Ingrese la letra por la que comienza el nombre');
    readln(letra);
    reset(archivo);
    while not eof(archivo) do begin
      read(archivo, reg);
      if reg.nombre[1] = letra then begin
        writeln('DNI: ', reg.DNI);
        writeln('Legajo: ', reg.legajo);
        writeln('Nombre: ', reg.nombre);
        writeln('Apellido: ', reg.apellido);
        writeln('Direccion: ', reg.direccion);
        writeln('Anio: ', reg.anio);
        writeln('Fecha de nacimiento: ', reg.fechaNac);
        writeln('');
      end;
    end;
    close(archivo);
  end;


  procedure listarAlumnosDeQuintoAnio(var archivo: archAlum);
  var
    reg: alumno;
    texto: text;
  begin
    Assign(texto, 'alumnosAEgresar.txt');
    rewrite(texto);
    reset(archivo);
    while not eof (archivo) do begin
      read(archivo, reg);
      if (reg.anio = 5)then begin
        writeln(texto, 'DNI: ', reg.DNI);
        writeln(texto, 'Legajo: ', reg.legajo);
        writeln(texto, 'Nombre: ', reg.nombre);
        writeln(texto, 'Apellido: ', reg.apellido);
        writeln(texto, 'Direccion: ', reg.direccion);
        writeln(texto, 'Anio: ', reg.anio);
        writeln(texto, 'Fecha de nacimiento: ', reg.fechaNac);
        write(texto, '---------------------------------');
      end;
    end;
    close(texto);
    close(archivo);
  end;

  procedure agregarAlumno(var archivo: archAlum);
  var
    reg: alumno;
    cant: integer;
  begin
    reset(archivo);
    seek(archivo, filesize(archivo));
    writeln('Cuantos alumnos desea agregar?');
    readln(cant);
    for cant:= 1 to cant do begin
      writeln('Ingrese el DNI');
      readln(reg.DNI);
      writeln('Ingrese el legajo');
      readln(reg.legajo);
      writeln('Ingrese el nombre');
      readln(reg.nombre);
      writeln('Ingrese el apellido');
      readln(reg.apellido);
      writeln('Ingrese la direccion');
      readln(reg.direccion);
      writeln('Ingrese el anio');
      readln(reg.anio);
      writeln('Ingrese la fecha de nacimiento');
      readln(reg.fechaNac);
      write(archivo, reg);
    end;
    close(archivo);
  end;

  procedure modificarAnio(var archivo: archAlum);
  var
    reg: alumno;
    legajo: longInt;
    anio: integer;
  begin
    reset(archivo);
    writeln('Ingrese el legajo del alumno que desea modificar');
    readln(legajo);
    while not eof(archivo) do begin
      read(archivo, reg);
      if reg.legajo = legajo then begin
        writeln('Ingrese el nuevo anio');
        readln(anio);
        reg.anio:= anio;
        seek(archivo, filepos(archivo) - 1);
        write(archivo, reg);
      end;
    end;
    close(archivo);
  end;



  var
    archivo: archAlum;
    opcion: char;
  begin
    Assign(archivo, 'alumnos.dat');
     repeat
        writeln('Ingrese la opcion que desea realizar');
        writeln('a. Crear un archivo');
        writeln('b. Listar alumnos cuyos nombres comiencen con "X" caracter');
        writeln('c. Listar en archivo de texto los registros del archivo de alumnos que cursen 5to anio');
        writeln('d. Anadir uno o mas alumnos');
        writeln('e. Modificar el anio que cursa un alumno');
        writeln('f. Salir');
        readln(opcion);
        case opcion of
            'a': crearArchivo(archivo);
            'b': listarPorNombre(archivo);
            'c': listarAlumnosDeQuintoAnio(archivo);
            'd': agregarAlumno(archivo);
            'e': modificarAnio(archivo);
        end;
    until opcion = 'f';
end.