import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ecommerce/widgets/items_page_BotonAgregarDefault.dart';
import 'package:ecommerce/widgets/items_page_PreviewCard.dart';
import 'package:ecommerce/entidades/ItemAlmacen.dart';
import 'package:ecommerce/pages/items_detalle_page.dart';

class ItemsPage extends StatefulWidget {
  static String tag = "items-page";
  @override
  _ItemsPageState createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage>
  implements PreviewCardListener
{

  List<ItemAlmacen> items;
  List<ItemAlmacen> itemsSelected;

  @override
  void initState() {
    super.initState();
    items = new List<ItemAlmacen>();
    itemsSelected= new List<ItemAlmacen>();
    items.add(new ItemAlmacen("Laptop", "Laptop color negro HP", 1.0));
    items.add(new ItemAlmacen("Televisor LG", "Televisor LG32\'\' ", 1.0));

  }


  @override
  void onLongTab(ItemAlmacen item) {
    print("Presioné largo"+item.titulo);
  }

  @override
  void ontTab(ItemAlmacen item) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ItemsDetallePage(item)),
    );
  }

  PreviewCard convertirItemAlmacenACard(ItemAlmacen item){
    return new PreviewCard(item,this);
  }

  List<PreviewCard> miniaturas(){
    return items.map(convertirItemAlmacenACard).toList();
  }


  Future<Null> _convertirACombo() async {
    DateTime _date = new DateTime.now();
    //DateTime _date = null;
    Future<Null> _selectDate(BuildContext context) async {
      final DateTime picked = await showDatePicker(
          context: context,
          initialDate: _date,
          firstDate: new DateTime(1960),
          lastDate: new DateTime(2030));
      if (picked != null && picked != _date) {
        print('Selected Date ${_date.toString()}');
        setState(() {
          _date = picked;
        });
      }
    }

    final txtFecha = Container(
      height: 43.0,
      alignment: Alignment.centerLeft,
      //decoration: BoxDecoration(
      //  border: Border.all(
      //    color: Colors.black54,
      //  ),
      //  borderRadius: BorderRadius.circular(10.0),
      //),
      padding: EdgeInsets.only(left: 23.0),
      child: Row(
        children: <Widget>[
          Text('Válido: '+'${_date.toString()}'.substring(0, 10) + ' (Opcional)'),
          Expanded(child:Container(
              alignment: Alignment.centerRight,
              child:IconButton(
                icon:Icon(Icons.calendar_today),
                onPressed: (){
                  _selectDate(context);
                },
              )
          ))
        ],
      ),
    );

    final txtPrecioCombo = TextFormField(

      style: TextStyle(
          fontSize: 18.0, color: Colors.black, fontFamily: "Arial"),
      keyboardType: TextInputType.numberWithOptions(
        decimal: true
      ),
      autofocus: false,

      decoration: InputDecoration(
          labelText: "S/. Precio",
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          ),
    );

    final txtDescripcionCombo = TextFormField(
      style: TextStyle(
          fontSize: 18.0, color: Colors.black, fontFamily: "Arial"),
      keyboardType: TextInputType.text,
      autofocus: false,

      decoration: InputDecoration(

          labelText: "Descripcion",
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
         ));

    return showDialog<Null>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return new AlertDialog(
          title: new Text('Ofrecer este Combo'),
          content: new SingleChildScrollView(
            child: new ListBody(
              children: <Widget>[
                txtPrecioCombo,
                txtDescripcionCombo,
                txtFecha,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                  new Checkbox(
                    value: false,
                    onChanged: (bool value) {
                      setState(() {

                      });
                    },
                  ),
                  new Text("Permitir que otro Freeler ofrezca este producto")
                ],)

                //txtFechaCombo,  // Fecha de vigencia se coloca opcional,si el usuario no inserta info se asume como ilimitado
                //chkCompartirCombo, // Check box para habilitar venta de terceros -> titulo "[x] Permitir que otro Freeler ofrezca este producto"
              ],
            ),
          ),
          actions: <Widget>[
            new FlatButton(
              child: new Text('Regret'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Mi Almacen"),
        actions: <Widget>[
         FlatButton(
           child: Text(
             "Combo",
                 style: TextStyle(
                   color: Colors.white,
                 ),
           ),
           onPressed: (){
              _convertirACombo();
           },
         )
        ],
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return Padding(
            padding: EdgeInsets.all(8.0),
              child:GridView.count(
            // Create a grid with 2 columns in portrait mode, or 3 columns in
            // landscape mode.
            crossAxisCount: orientation == Orientation.portrait ? 2 : 4,
            // Generate 100 Widgets that display their index in the List
            children: miniaturas(),

          ));
        },
      ),
      floatingActionButton: new BotonAgregarDefault((){}),

    );
  }


}


