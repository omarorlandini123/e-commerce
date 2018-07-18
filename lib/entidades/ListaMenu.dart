import 'OpcionMenu.dart';

class ListaMenu {
  List<OpcionMenu> _opciones;

  ListaMenu() {
    this._opciones = new List<OpcionMenu>();
  }

  void add(OpcionMenu opcion) {
    _opciones.add(opcion);
  }

  get opciones => _opciones;
}
