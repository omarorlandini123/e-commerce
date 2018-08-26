import 'package:Freeler/entidades/Archivo.dart';
import 'package:Freeler/entidades/TipoArchivo.dart';
import 'package:Freeler/entidades/TipoFotoDocumento.dart';
import 'package:Freeler/entidades/Documento.dart';
class FotoDocumento extends Archivo{
    TipoFotoDocumento tipo;
    Documento documento;

    FotoDocumento(int idArchivo, String nombre, String extension, this.tipo, this.documento):super(idArchivo, nombre, extension,TipoArchivo.IMAGEN);
    
}