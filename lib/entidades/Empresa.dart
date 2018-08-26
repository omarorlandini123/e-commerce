import 'package:Freeler/entidades/Local.dart';
import 'package:Freeler/entidades/CuentaBancaria.dart';
import 'package:Freeler/entidades/TipoEmpresa.dart';
import 'package:Freeler/entidades/Freeler.dart';
import 'package:Freeler/entidades/Ubicacion.dart';
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

