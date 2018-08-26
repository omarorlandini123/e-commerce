import 'package:Freeler/entidades/Archivo.dart';
import 'package:Freeler/entidades/TipoArchivo.dart';
import 'package:flutter/material.dart';
class FotoPreview extends Archivo{
    
    ImageProvider imageProvider;

    FotoPreview(int idArchivo, String nombre, String extension,this.imageProvider):
    super(idArchivo, nombre, extension,TipoArchivo.IMAGEN);
    
}