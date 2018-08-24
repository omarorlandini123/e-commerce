import 'package:ecommerce/entidades/Archivo.dart';
import 'package:ecommerce/entidades/TipoArchivo.dart';
import 'package:flutter/material.dart';
class FotoPreview extends Archivo{
    
    ImageProvider imageProvider;

    FotoPreview(int idArchivo, String nombre, String extension,this.imageProvider):
    super(idArchivo, nombre, extension,TipoArchivo.IMAGEN);
    
}