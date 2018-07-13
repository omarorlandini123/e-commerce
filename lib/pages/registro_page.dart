import 'package:flutter/material.dart';
import 'productos_page.dart';

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

  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _currentCity;

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
      style:
          TextStyle(fontSize: 22.0, color: Colors.black, fontFamily: "Arial"),
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
          TextStyle(fontSize: 22.0, color: Colors.black, fontFamily: "Arial"),
      keyboardType: TextInputType.text,
      autofocus: false,
      decoration: InputDecoration(
          labelText: "Nombre",
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
    );

    final txtCodigoRef = TextFormField(
      style:
          TextStyle(fontSize: 22.0, color: Colors.black, fontFamily: "Arial"),
      keyboardType: TextInputType.text,
      autofocus: false,
      decoration: InputDecoration(
          labelText: "Código referido (Opcional)",
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))),
    );

    final cbDepartamento = Container(
        padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        decoration: BoxDecoration(
            border: Border.all(
                color: Colors.grey, width: 1.0, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(10.0)),
        child: Row(children: <Widget>[
          Text('Departamento: ',
              style: TextStyle(
                  fontSize: 22.0, color: Colors.black, fontFamily: "Arial")),
          SizedBox(
            width: 25.0,
          ),
          DropdownButton(
            style: TextStyle(
                fontSize: 22.0, color: Colors.black, fontFamily: "Arial"),
            isDense: true,
            value: _currentCity,
            items: _dropDownMenuItems,
            onChanged: changedDropDownItem,
            elevation: 3,
          )
        ]));
    final cbLocalidad = Container(
        padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        decoration: BoxDecoration(
            border: Border.all(
                color: Colors.grey, width: 1.0, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(10.0)),
        child: Row(children: <Widget>[
          Text('Localidad: ',
              style: TextStyle(
                  fontSize: 22.0, color: Colors.black, fontFamily: "Arial")),
          SizedBox(
            width: 25.0,
          ),
          DropdownButton(
            style: TextStyle(
                fontSize: 22.0, color: Colors.black, fontFamily: "Arial"),
            isDense: true,
            value: _currentCity,
            items: _dropDownMenuItems,
            onChanged: changedDropDownItem,
            elevation: 3,
          )
        ]));
    final cbProvincia = Container(
        padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        decoration: BoxDecoration(
            border: Border.all(
                color: Colors.grey, width: 1.0, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(10.0)),
        child: Row(children: <Widget>[
          Text('Provincia: ',
              style: TextStyle(
                  fontSize: 22.0, color: Colors.black, fontFamily: "Arial")),
          SizedBox(
            width: 25.0,
          ),
          DropdownButton(
            style: TextStyle(
                fontSize: 22.0, color: Colors.black, fontFamily: "Arial"),
            isDense: true,
            value: _currentCity,
            items: _dropDownMenuItems,
            onChanged: changedDropDownItem,
            elevation: 3,
          )
        ]));

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Ingresa tus Datos'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.assignment_turned_in),
            onPressed: () {
              //Next Page
              Navigator.of(context).pushNamed(ProductosPage.tag);
            },
          )
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        padding:
            EdgeInsets.only(top: 24.0, bottom: 24.0, left: 24.0, right: 24.0),
        children: <Widget>[
          txtDNI,
          SizedBox(
            height: 24.0,
          ),
          txtNombre,
          
          SizedBox(
            height: 24.0,
          ),
          cbDepartamento,
          SizedBox(
            height: 24.0,
          ),
          cbLocalidad,
          SizedBox(
            height: 24.0,
          ),
          cbProvincia,
          SizedBox(
            height: 24.0,
          ),
          txtCodigoRef
        ],
      ),
    );
  }
}
