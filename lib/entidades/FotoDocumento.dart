import 'package:ecommerce/entidades/Archivo.dart';
import 'package:ecommerce/entidades/TipoArchivo.dart';
import 'package:ecommerce/entidades/TipoFotoDocumento.dart';
import 'package:ecommerce/entidades/Documento.dart';
class FotoDocumento extends Archivo{
    TipoFotoDocumento tipo;
    Documento documento;

    FotoDocumento(int idArchivo, String nombre, String extension, this.tipo, this.documento):super(idArchivo, nombre, extension,TipoArchivo.IMAGEN);
    
}