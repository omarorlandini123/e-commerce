import 'package:flutter/material.dart';
import 'package:ecommerce/widgets/items_page_BotonAgregarDefault.dart';
import 'package:ecommerce/widgets/items_page_PreviewCard.dart';
import 'package:ecommerce/entidades/ItemAlmacen.dart';


class ItemsPage extends StatefulWidget {
  static String tag = "items-page";
  @override
  _ItemsPageState createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {

  List<ItemAlmacen> items;

  @override
  void initState() {
    super.initState();
    items = new List<ItemAlmacen>();
    items.add(new ItemAlmacen("Laptop", "Laptop color negro HP", 1.0));
    items.add(new ItemAlmacen("Televisor LG", "Televisor LG32\'\' ", 1.0));
  }


  List<PreviewCard> miniaturas(){
    return items.map((item) => new PreviewCard(item.titulo)).toList();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Mi Almacen"),
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

            //List.generate(100, (index) {
            //  return Center(
            //    child: Text(
            //      'Item $index',
            //      style: Theme.of(context).textTheme.headline,
            //    ),
            //  );
            //}),
          ));
        },
      ),
      floatingActionButton: new BotonAgregarDefault((){}),

    );
  }
}


