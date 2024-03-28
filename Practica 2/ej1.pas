{
  El área de recursos humanos de un ministerio administra el personal del mismo
distribuido en 10 direcciones generales.
Entre otras funciones, recibe periódicamente un archivo detalle de cada una de las
direcciones conteniendo información de las licencias solicitadas por el personal.
Cada archivo detalle contiene información que indica: código de empleado, la fecha y
la cantidad de días de licencia solicitadas. El archivo maestro tiene información de
cada empleado: código de empleado, nombre y apellido, fecha de nacimiento,
dirección, cantidad de hijos, teléfono, cantidad de días que le corresponden de
vacaciones en ese periodo. Tanto el maestro como los detalles están ordenados por
código de empleado. Escriba el programa principal con la declaración de tipos
necesaria y realice un proceso que reciba los detalles y actualice el archivo maestro
con la información proveniente de los archivos detalles. Se debe actualizar la cantidad
de días que le restan de vacaciones. Si el empleado tiene menos días de los que
solicita deberá informarse en un archivo de texto indicando: código de empleado,
nombre y apellido, cantidad de días que tiene y cantidad de días que solicita.

}

Program ej1;
Type
  empleado = record
    codigo: integer;
    nombre: string;
    apellido: string;
    fechaNacimiento: string;
    direccion: string;
    cantidadHijos: integer;
    telefono: string;
    cantidadDiasVacaciones: integer;
  end;

  detalle = record
    codigo: integer;
    fecha: string;
    cantidadDias: integer;
  end;

  archivoMaestro = file of empleado;
  archivoDetalle = file of detalle;

procedure corroborar(var m: archivoMaestro; det: detalle);
var
  emp: empleado;
begin
  Reset(m);
  while not eof(m) do begin
    read (m, emp);
    if (emp.codigo = det.codigo) then begin
      if (emp.cantidadDiasVacaciones >= det.cantidadDias) then begin
        emp.cantidadDiasVacaciones := emp.cantidadDiasVacaciones - det.cantidadDias;
        seek(m, filepos(m) - 1);
        write(m, emp);
        writeln('Al empleado ', emp.nombre, ' ', emp.apellido, ' le quedan ', emp.cantidadDiasVacaciones, ' dias de vacaciones.');
      end
      else begin
        writeln('El empleado ', emp.nombre, ' ', emp.apellido, ' no tiene suficientes dias de vacaciones');
      end;
    end;
  end;
  close(m);
end;

var
  m: archivoMaestro;
  d: archivoDetalle;
  det: detalle;
  emp: empleado;
begin 
// Lo hice con un solo archivo maestro y uno solo detalle. Lo otro sera mas complicado pero paja
  assign(m, 'maestro.dat');
  assign(d, 'detalle.dat');
  Rewrite(m);
  Rewrite(d);
  //Jeje, quedo medio larga la mierda esta
  emp.codigo := 1;
  emp.nombre := 'Juan';
  emp.apellido := 'Perez';
  emp.fechaNacimiento := '01/01/1990';
  emp.direccion := 'Calle falsa 123';
  emp.cantidadHijos := 2;
  emp.telefono := '123456';
  emp.cantidadDiasVacaciones := 10;
  write(m, emp);
  emp.codigo := 2;
  emp.nombre := 'Pedro';
  emp.apellido := 'Gomez';
  emp.fechaNacimiento := '01/01/1990';
  emp.direccion := 'Calle falsa 123';
  emp.cantidadHijos := 2;
  emp.telefono := '123456';
  emp.cantidadDiasVacaciones := 15;
  write(m, emp);
  emp.codigo := 3;
  emp.nombre := 'Maria';
  emp.apellido := 'Lopez';
  emp.fechaNacimiento := '01/01/1990';
  emp.direccion := 'Calle falsa 123';
  emp.cantidadHijos := 2;
  emp.telefono := '123456';
  emp.cantidadDiasVacaciones := 20;
  write(m, emp);
  close(m);

  //ahora el detalle
  det.codigo := 2;
  det.fecha := '01/01/2020';
  det.cantidadDias := 20;
  write(d, det);
  det.codigo := 3;
  det.fecha := '01/01/2020';
  det.cantidadDias := 10;
  write(d, det);
  close(d);
  reset(d);

  while not eof(d) do begin
    read(d, det);
    corroborar(m, det);
    end;
  close(d);
end.