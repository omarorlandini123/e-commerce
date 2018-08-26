import 'package:Freeler/entidades/Persona.dart';
import 'package:Freeler/entidades/TipoDocumento.dart';
import 'package:Freeler/entidades/FotoDocumento.dart';
class Documento{

  int idDocumento;
  TipoDocumento tipoDocumento;
  String nroDocumento;
  Persona persona;
  FotoDocumento fotoDeltantera;
  FotoDocumento fotoReverso;
  int esPrincipal;

  Documento(this.idDocumento,
  this.tipoDocumento, 
  this.esPrincipal,
  this.nroDocumento,[this.persona, this.fotoDeltantera, this.fotoReverso]);
  
}
