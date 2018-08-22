import 'package:ecommerce/entidades/Local.dart';
class Empresa {
  static const int TIPO_EMPRESA_PERSONAL = 0;
  static const int TIPO_EMPRESA_JURIDICA = 1;
  static const int TIPO_EMPRESA_PERSONA_LIBRE = 2;

  static const int TIPO_DOCUMENTO_DNI = 0;
  static const int TIPO_DOCUMENTO_RUC = 1;
  static const int TIPO_DOCUMENTO_CARNE_EXTRAN = 2;

  String nombre;
  String descripcion;
  String documento;
  int tipoDocumento;
  int tipoEmpresa;
  List<Local> locales;

  Empresa(this.nombre, this.descripcion, this.documento, this.tipoDocumento, this.tipoEmpresa);

}

