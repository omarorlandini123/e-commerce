import 'package:flutter/material.dart';
import 'package:Freeler/pages/page_registro.dart';
class ValidarNumeroPage extends StatefulWidget {
  static String tag = 'validar-numero-page';
  @override
  _ValidarNumeroPageState createState() => _ValidarNumeroPageState();
}

class _ValidarNumeroPageState extends State<ValidarNumeroPage> {
  @override
  Widget build(BuildContext context) {
    final lblCodigo = Text('Código',
        maxLines: 1,
        overflow: TextOverflow.fade,
        style: TextStyle(
            color: Colors.black, fontSize: 18.0, fontStyle: FontStyle.normal),
        textAlign: TextAlign.left);

    final codigo = TextFormField(
      keyboardType: TextInputType.number,
      autofocus: false,
      decoration: InputDecoration(
          hintText: 'Ingresa el código enviado a tu teléfono',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
 final registerButton = Padding(      
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        borderRadius: BorderRadius.circular(30.0),
        shadowColor: Colors.lightGreenAccent.shade100,
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 200.0,
          height: 42.0,
          onPressed: () {
            Navigator.of(context).pushNamed(RegistroPage.tag);
          },
          color: Theme.of(context).primaryColor,
          child: Text('Enviar Código', style: TextStyle(color: Colors.white)),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Confirma tu identidad'),        
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
           
            lblCodigo,
            codigo,
            Container(
                margin: EdgeInsets.only(left: 100.0),
                width: 300.0,
                alignment: Alignment.centerRight,
                child: registerButton),
          ],
        ),
      ),
    );
  }
}
