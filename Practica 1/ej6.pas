{
  Realizar un programa que permita:
a. Crear un archivo binario a partir de la información almacenada en un
archivo de texto. El nombre del archivo de texto es: “libros.txt”
b. Abrir el archivo binario y permitir la actualización del mismo. Se debe poder
agregar un libro y modificar uno existente. Las búsquedas se realizan por
ISBN.
NOTA: La información en el archivo de texto consiste en: ISBN (nro de 13 dígitos),
título del libro, género, editorial y año de edición. Cada libro se almacena en tres líneas
en el archivo de texto. La primera línea contendrá la información de ISBN y título del
libro, la segunda línea almacenará el año de edición y la editorial y en la tercera línea el
género del libro. (Analice otras posibles formas de representar la información en el txt)

}
Program ej6;
Type
  libro = record
    isbn: integer;
    titulo: string;
    genero: string;
    editorial: string;
    anio: integer;
  end;


var
  b: binaryfile;
  t: textfile;
  l: libro;
  isbn: integer;
begin
  assign(t, 'libros.txt');
  assign(b, 'libros.bin');
  reset(t);
  rewrite(b);
  while not eof(t) do begin
    readln(t, l.isbn);
    readln(t, l.titulo);
    readln(t, l.anio);
    readln(t, l.editorial);
    readln(t, l.genero);
    write(b, l);
    close(b);
    close(t);
    reset(b);
    write('ISBN a buscar: ');
    readln(isbn);
    while not eof do begin
      read(b, l);
      if l.isbn = isbn then begin 
        writeln('ISBN: ', l.isbn);
        writeln('Titulo: ', l.titulo);
        writeln('Anio: ', l.anio);
        writeln('Editorial: ', l.editorial);
        writeln('Genero: ', l.genero);
        writeln('Desea modificar el libro? (s/n)');
        readln(r);
        if r = 's' then begin
          writeln('Ingrese el nuevo ISBN: ');
          readln(l.isbn);
          writeln('Ingrese el nuevo titulo: ');
          readln(l.titulo);
          writeln('Ingrese el nuevo anio: ');
          readln(l.anio);
          writeln('Ingrese la nueva editorial: ');
          readln(l.editorial);
          writeln('Ingrese el nuevo genero: ');
          readln(l.genero);
          seek(b, filepos(b) - 1);
          write(b, l);
        end;
      end;
    end;
  end;
end.
//me dio paja e hice todo de una en el main, pero se puede hacer en un procedimiento el agregar y el modificar