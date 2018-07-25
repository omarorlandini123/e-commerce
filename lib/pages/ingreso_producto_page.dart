import 'package:flutter/material.dart';
import 'package:ecommerce/pages/pedidos_page.dart';
import 'package:ecommerce/entidades/OpcionMenu.dart';
import 'package:ecommerce/pages/ingreso_producto_page.dart';
import 'package:ecommerce/pages/mis_empresas_page.dart';

class IngresoProductoPage extends StatefulWidget {
  static String tag = 'ingreso-producto-page';
  @override
  _IngresoProductoPageState createState() => _IngresoProductoPageState();
}

class _IngresoProductoPageState extends State<IngresoProductoPage> {
  List<DropdownMenuItem<String>> _dropDownMenuItems;
  List<DropdownMenuItem<String>> _dropDownMenuItems2;
  String _currentCity;
  String _currentCity2;

  List _cities = [
    "Empresa 1",
    "Empresa 2",
    "Empresa 3",
  ];

  List _cities2 = [
    "Articulo",
    "Combo",
  ];

  final double tamanoTexto = 16.0;
  final double espaciado = 8.0;

  @override
  void initState() {
    _dropDownMenuItems = getDropDownMenuItems();
    _dropDownMenuItems2 = getDropDownMenuItems2();
    _currentCity = _dropDownMenuItems[0].value;
    _currentCity2 = _dropDownMenuItems2[0].value;
    super.initState();
  }

  void changedDropDownItem(String selectedCity) {
    setState(() {
      _currentCity = selectedCity;
    });
  }

  void changedDropDownItem2(String selectedCity) {
    setState(() {
      _currentCity2 = selectedCity;
    });
  }

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String city in _cities) {
      items.add(new DropdownMenuItem(value: city, child: new Text(city)));
    }
    return items;
  }

  List<DropdownMenuItem<String>> getDropDownMenuItems2() {
    List<DropdownMenuItem<String>> items = new List();
    for (String city in _cities2) {
      items.add(new DropdownMenuItem(value: city, child: new Text(city)));
    }
    return items;
  }

   Card tarjeta(String image, String nombre, String costo) {
    return new Card(
      elevation: 3.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
                top: 10.0, bottom: 10.0, left: 10.0, right: 10.0),
            child: CircleAvatar(
              radius: 35.0,
              backgroundImage: new AssetImage(image),
            ),
          ),
          Expanded(
            child: Container(
                margin: EdgeInsets.only(top: 10.0,left:5.0 ),
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Material(
                            child: Text(
                          nombre,
                          style: TextStyle(fontSize: 16.0),
                        )),
                        SizedBox(
                          height: 10.0,
                        ),
                        Material(
                            child: Text(
                          costo,
                          style: TextStyle(fontSize: 16.0),
                        ))
                      ],
                    )),
                    Container(
                        alignment: Alignment.centerRight,
                        margin: EdgeInsets.only(
                            top: 10.0, bottom: 10.0, right: 15.0),
                        child: IconButton(
                          icon: Icon(Icons.share),
                          onPressed: () {},
                          iconSize: 30.0,
                        ))
                  ],
                )),
          )
        ],
      ),
      margin: EdgeInsets.only(right: 20.0, left: 20.0, top: 10.0, bottom: 10.0),
    );
  }


  @override
  Widget build(BuildContext context) {
    final cbEmpresa = Container(
        padding: EdgeInsets.fromLTRB(20.0, 10.0, 25.0, 10.0),
        decoration: BoxDecoration(
            border: Border.all(
                color: Colors.grey, width: 1.0, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(10.0)),
        child: Row(children: <Widget>[
          Container(
              child: DropdownButton(
            style: TextStyle(
                fontSize: tamanoTexto,
                color: Colors.black,
                fontFamily: "Arial"),
            isDense: true,
            value: _currentCity,
            items: _dropDownMenuItems,
            onChanged: changedDropDownItem,
            elevation: 3,
          ))
        ]));
    final cbTipo = Container(
        padding: EdgeInsets.fromLTRB(20.0, 10.0, 25.0, 10.0),
        decoration: BoxDecoration(
            border: Border.all(
                color: Colors.grey, width: 1.0, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(10.0)),
        child: Row(children: <Widget>[
          Container(
              child: DropdownButton(
            style: TextStyle(
                fontSize: tamanoTexto,
                color: Colors.black,
                fontFamily: "Arial"),
            isDense: true,
            value: _currentCity2,
            items: _dropDownMenuItems2,
            onChanged: changedDropDownItem2,
            elevation: 3,
          ))
        ]));


        
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Mis Empresas'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.save, color: Colors.white,),
              onPressed: (){},
            )
           
          ],
        ),
        body: new ListView(
          shrinkWrap: true,
          padding:
              EdgeInsets.only(top: 24.0, bottom: 24.0, left: 24.0, right: 24.0),
          children: <Widget>[
            Row(children: <Widget>[
              cbEmpresa,
              IconButton(
                icon: Icon(Icons.image),
                onPressed: () {},
              ),
              
            ]),
            SizedBox(
                height: espaciado,
              ),
              cbTipo
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
            backgroundColor: Colors.purple,
            icon: Icon(Icons.add),
            label: Text('Añadir Empresa'),
            onPressed: () {}));
  }
}
