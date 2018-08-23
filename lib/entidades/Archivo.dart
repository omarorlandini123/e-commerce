import 'package:ecommerce/entidades/TipoArchivo.dart';
class Archivo{
    int idArchivo;
    String nombre;
    String contenido;
    TipoArchivo tipoArchivo;
    String extension;
    
    Archivo(this.idArchivo, this.nombre, this.extension, this.tipoArchivo, [this.contenido]);
}