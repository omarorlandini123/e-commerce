import 'package:ecommerce/entidades/Persona.dart';
import 'package:ecommerce/entidades/TipoDocumento.dart';
import 'package:ecommerce/entidades/FotoDocumento.dart';
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
