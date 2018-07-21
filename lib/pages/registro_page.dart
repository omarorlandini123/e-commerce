import 'package:flutter/material.dart';
import 'productos_page.dart';
//import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';
import 'dart:async';

class RegistroPage extends StatefulWidget {
  static String tag = 'registro-page';
  @override
  _RegistroPageState createState() => _RegistroPageState();
}

class _RegistroPageState extends State<RegistroPage> {
  
  List _cities = [
    "Cluj-Napoca",
    "Bucuresti",
    "Timisoara",
    "Brasov",
    "Constanta"
  ];

  final double tamanoTexto=16.0;
  final double espaciado=8.0;

  List<DropdownMenuItem<String>> _dropDownMenuItems;
  final myController = TextEditingController();
  String _currentCity;
  String barcode = "";

  @override
  void initState() {
    _dropDownMenuItems = getDropDownMenuItems();
    _currentCity = _dropDownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String city in _cities) {
      items.add(new DropdownMenuItem(value: city, child: new Text(city)));
    }
    return items;
  }

  void changedDropDownItem(String selectedCity) {
    setState(() {
      _currentCity = selectedCity;
    });
  }

  @override
  Widget build(BuildContext context) {
    final txtDNI = TextFormField(
      controller: myController,
      enabled: false,
      style:
          TextStyle(fontSize: tamanoTexto, color: Colors.black, fontFamily: "Arial"),
      keyboardType: TextInputType.number,
      autofocus: false,
      decoration: InputDecoration(
          labelText: "Número de DNI",
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
    );
    final txtNombre = TextFormField(
      style:
          TextStyle(fontSize:tamanoTexto, color: Colors.black, fontFamily: "Arial"),
      keyboardType: TextInputType.text,
      autofocus: false,
      decoration: InputDecoration(
          labelText: "Nombre",
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
    );
final txtEmail = TextFormField(
      style:
          TextStyle(fontSize:tamanoTexto, color: Colors.black, fontFamily: "Arial"),
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
          labelText: "E-mail",
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
    );
    final txtCodigoRef = TextFormField(
      style:
          TextStyle(fontSize: tamanoTexto, color: Colors.black, fontFamily: "Arial"),
      keyboardType: TextInputType.text,
      autofocus: false,
      decoration: InputDecoration(
          labelText: "Código referido (Opcional)",
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
    );

    final txtApellidoPaterno = TextFormField(
      style:
          TextStyle(fontSize: tamanoTexto, color: Colors.black, fontFamily: "Arial"),
      keyboardType: TextInputType.text,
      autofocus: false,
      decoration: InputDecoration(
          labelText: "Apellido Paterno",
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
    );

    final txtApellidoMaterno = TextFormField(
      style:
          TextStyle(fontSize: tamanoTexto, color: Colors.black, fontFamily: "Arial"),
      keyboardType: TextInputType.text,
      autofocus: false,
      decoration: InputDecoration(
          labelText: "Apellido Materno",
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
    );


    final cbDepartamento = Container(
       
        padding: EdgeInsets.fromLTRB(20.0, 10.0, 25.0, 10.0),
        decoration: BoxDecoration(
            border: Border.all(
                color: Colors.grey, width: 1.0, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(10.0)),
        child: Row(children: <Widget>[          
          Expanded(child:DropdownButton(
            style: TextStyle(              
                fontSize: tamanoTexto, color: Colors.black, fontFamily: "Arial"),
            isDense: true,
            value: _currentCity,
            items: _dropDownMenuItems,
            onChanged: changedDropDownItem,
            elevation: 3,            
          ))
        ]));
    final cbLocalidad = Container(
        padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        decoration: BoxDecoration(
            border: Border.all(
                color: Colors.grey, width: 1.0, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(10.0)),
        child: Row(children: <Widget>[
          Expanded(child: 
          DropdownButton(
            style: TextStyle(
                fontSize: tamanoTexto, color: Colors.black, fontFamily: "Arial"),
            isDense: true,
            value: _currentCity,
            items: _dropDownMenuItems,
            onChanged: changedDropDownItem,
            elevation: 3,
          ),)
        ]));
    final cbProvincia = Container(
        padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        decoration: BoxDecoration(
            border: Border.all(
                color: Colors.grey, width: 1.0, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(10.0)),
        child: Row(children: <Widget>[
          Expanded(child: 
          DropdownButton(
            style: TextStyle(
                fontSize: tamanoTexto, color: Colors.black, fontFamily: "Arial"),
            isDense: true,
            value: _currentCity,
            items: _dropDownMenuItems,
            onChanged: changedDropDownItem,
            elevation: 3,
          )),
        ]));

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Ingresa tus Datos'),
        actions: <Widget>[
          FlatButton(
              textColor: Colors.white, 
              child: Text("SIG."), //onPressed: scan
              onPressed: () {
                Navigator.of(context).pushNamed(ProductosPage.tag);
              },
              ),
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        padding:
            EdgeInsets.only(top: 24.0, bottom: 24.0, left: 24.0, right: 24.0),
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(child: txtDNI),
              Container(
                  margin: EdgeInsets.only(left: 24.0),
                  child: RaisedButton(
                    color: Colors.purple,
                    textColor: Colors.white,
                    elevation: 2.0,
                    child: Text("Escanear"), 
                    onPressed: scan
                    ))
            ],
          ),
          SizedBox(
            height: espaciado,
          ),
          txtNombre,
          SizedBox(
            height: espaciado,
          ),
          txtApellidoPaterno,
          SizedBox(
            height: espaciado,
          ),
          txtApellidoMaterno,
          SizedBox(
            height: espaciado,
          ),
          cbDepartamento,
          SizedBox(
            height: espaciado,
          ),
          cbLocalidad,
          SizedBox(
            height: espaciado,
          ),
          cbProvincia,
          SizedBox(
            height: espaciado,
          ),
          txtCodigoRef,
          SizedBox(
            height: espaciado,
          ),
          txtEmail,
        ],
      ),
    );
  }

  Future scan() async {
    // try {
    //   String barcode = await BarcodeScanner.scan();
    //   setState(() {
    //     this.barcode = barcode;
    //     myController.text = barcode;
    //   });
    // } on PlatformException catch (e) {
    //   if (e.code == BarcodeScanner.CameraAccessDenied) {
    //     setState(() {
    //       this.barcode = 'The user did not grant the camera permission!';
    //     });
    //   } else {
    //     setState(() => this.barcode = 'Unknown error: $e');
    //   }
    // } on FormatException {
    //   setState(() => this.barcode =
    //       'null (User returned using the "back"-button before scanning anything. Result)');
    // } catch (e) {
    //   setState(() => this.barcode = 'Unknown error: $e');
    // }
  }
}
