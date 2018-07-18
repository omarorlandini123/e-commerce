import 'package:flutter/material.dart';

class OpcionMenu {

  Icon _icono;
  String _etiqueta;
  
  OpcionMenu(this._icono, this._etiqueta);

  Icon get icono => _icono;
  set icono(Icon icono) => _icono = icono;

  String get etiqueta=>_etiqueta;
  set etiqueta(String etiqueta) => _etiqueta=etiqueta;

}
