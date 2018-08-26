import 'package:Freeler/entidades/Ubicacion.dart';
import 'package:Freeler/entidades/Documento.dart';
class Persona{
  int idPersona;
  String nombre;
  String apellidoPaterno;
  String apellidoMaterno;
  String email;
  String direccion;
  Ubicacion ubicacion;
  List<Documento> documentos;
  

  Persona(this.idPersona, 
  [this.nombre,
   this.apellidoPaterno, 
   this.apellidoMaterno, 
   this.email, this.direccion, this.ubicacion]);

}