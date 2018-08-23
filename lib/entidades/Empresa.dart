import 'package:ecommerce/entidades/Local.dart';
import 'package:ecommerce/entidades/TipoDocumento.dart';
import 'package:ecommerce/entidades/TipoEmpresa.dart';
class Empresa {
  static const int TIPO_EMPRESA_PERSONAL = 0;
  static const int TIPO_EMPRESA_JURIDICA = 1;
  static const int TIPO_EMPRESA_PERSONA_LIBRE = 2;

  String nombre;
  String descripcion;
  String documento;
  TipoDocumento tipoDocumento;
  TipoEmpresa tipoEmpresa;
  List<Local> locales;

  Empresa(this.nombre, this.descripcion, this.documento, this.tipoDocumento, this.tipoEmpresa);

}

