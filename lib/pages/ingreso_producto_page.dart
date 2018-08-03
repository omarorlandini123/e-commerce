import 'package:flutter/material.dart';
import 'package:ecommerce/pages/detalle_producto_page.dart';

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
                margin: EdgeInsets.only(top: 10.0, left: 5.0),
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

        body: new CustomScrollView(

          slivers: <Widget>[

             SliverAppBar(

              actions: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.photo_camera,
                    color: Colors.white,
                  ),
                  onPressed: (){

                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.save,
                    color: Colors.white,
                  ),
                  onPressed: (){

                  },
                ),

              ],
              pinned: true,
              elevation: 4.0,
              expandedHeight: 250.0,
              //31334300

              flexibleSpace:  FlexibleSpaceBar(

                background: Image.asset("assets/imgs/hamburguesa.jpg",
                  fit: BoxFit.cover ,
                  color: Color.fromRGBO(23,34, 45, 0.2),
                  colorBlendMode: BlendMode.darken,),
                title: Text('Nuevo Producto')),

            ),
             new SliverFixedExtentList(
                itemExtent: 220.0,

              delegate: new SliverChildBuilderDelegate(

                    (BuildContext context, int index) {

                  return  new ListView(
                       shrinkWrap: true,
                         padding:
                             EdgeInsets.only(top: 24.0, bottom: 24.0, left: 24.0, right: 24.0),
                         children: <Widget>[
                           Row(children: <Widget>[
                             Expanded(child:cbEmpresa),


                           ]),
                           SizedBox(
                               height: espaciado,
                             ),
                         ],
                       );
                },childCount: 1,
              ),

            ),
            new SliverFixedExtentList(
              itemExtent: 50.0,
              delegate: new SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return new Container(
                    alignment: Alignment.center,
                    color: Colors.lightBlue[100 * (index % 9)],
                    child: new Text('list item $index'),
                  );
                },childCount: 3,
              ),
            ),

          ],
        ),

        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: botonesFlotantes(),),);
  }
  int _statusButton=0;

  static const  int inicial=0;
  static const int precionado=1;

  List<Widget> botonesFlotantes(){
    switch(_statusButton){
      case precionado:
        return <Widget>[
        AnimatedOpacity(
          opacity: 1.0,
          child:
          FloatingActionButton(
              backgroundColor: Colors.purple,
              child: Icon(Icons.add),
              onPressed: () {
                setState(() {

                  _statusButton=inicial;
                });
              }),  duration: Duration(seconds: 5))

        ];
      case inicial:
        return <Widget>[
          FloatingActionButton(
              heroTag: "buscar-item",
              backgroundColor: Colors.grey.withOpacity(0.6),
              child: Icon(Icons.search),
              onPressed: () {}),
          SizedBox(
              height:10.0
          ),
          FloatingActionButton(
              heroTag: "nuevo-item",
              backgroundColor: Colors.grey.withOpacity(0.6),
              child: Icon(Icons.create),
              onPressed: () {}
              ),
          SizedBox(
              height:10.0
          ),
          AnimatedOpacity(
            opacity: 1.0,
              child:
          FloatingActionButton.extended(
              backgroundColor: Colors.purple,
              icon: Icon(Icons.add),
              label: Text('Añadir Item'),
              onPressed: () {
                setState(() {
                  _statusButton=precionado;
                });
              })
              , duration: Duration(milliseconds: 3000))

        ];

    }
    return null;

  }

  List<Color> coloresSobraTexto(){

    List<Color> colores = new List<Color>();
    colores.add(Theme.of(context).primaryColor.withOpacity(0.2));
    colores.add(Theme.of(context).primaryColor.withOpacity(0.2));

  return colores;
  }

}
