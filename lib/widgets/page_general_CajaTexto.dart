import 'package:flutter/material.dart';

class CajaTexto extends StatelessWidget {
  String valorInicial;
  String hint;
  double fontSize;
  VoidCallback callback;
  TipoCajaTexto tipo;
  TextEditingController controller;

  CajaTexto(
      String valorInicial, String hint, double fontSize, TipoCajaTexto tipo,
      [this.callback]) {
    this.controller = new TextEditingController();
    this.valorInicial = valorInicial;
    this.hint = hint;
    this.fontSize = fontSize;
    this.tipo = tipo;
  }

  String getText() {
    return controller.text;
  }

  Widget cajaFecha() {
    return new Container(
      height: 43.0,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black54,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      padding: EdgeInsets.only(left: 23.0),
      child: Row(
        children: <Widget>[
          Text(valorInicial),
          Expanded(
              child: Container(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    icon: Icon(Icons.calendar_today),
                    onPressed: callback,
                  )))
        ],
      ),
    );
  }

  Widget cajaTexto() {
    return new TextFormField(
      controller: this.controller,
      initialValue: valorInicial,
      style: TextStyle(
          fontSize: this.fontSize, color: Colors.black, fontFamily: "Arial"),
      keyboardType: TextInputType.text,
      autofocus: false,
      decoration: InputDecoration(
          prefixText: tipo == TipoCajaTexto.TEXTO ? "" : "S/ ",
          labelText: hint,
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (TipoCajaTexto.FECHA == tipo) {
      return cajaFecha();
    }else{
      return cajaFecha();
    }
  }
}

enum TipoCajaTexto { TEXTO, MONEDA, FECHA }
