import 'package:ecommerce/entidades/Local.dart';
import 'package:ecommerce/entidades/CuentaBancaria.dart';
import 'package:ecommerce/entidades/TipoEmpresa.dart';
import 'package:ecommerce/entidades/Freeler.dart';
import 'package:ecommerce/entidades/Ubicacion.dart';
class Empresa {

  String nombre;
  String descripcion;
  String direccion;
  String ruc;
  int verificada;
  TipoEmpresa tipoEmpresa;
  Ubicacion ubicacion;
  List<Local> locales;
  List<Freeler> freelers;
  List<CuentaBancaria> cuentasBancarias;
  

  Empresa(this.nombre, this.descripcion, this.ruc,  this.tipoEmpresa);

}

