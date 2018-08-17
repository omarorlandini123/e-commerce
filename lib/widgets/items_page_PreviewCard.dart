import 'package:ecommerce/entidades/ItemAlmacen.dart';
import 'package:flutter/material.dart';

class PreviewCard extends StatefulWidget {


  ItemAlmacen tag ;
  PreviewCardListener listener;

  PreviewCard(this.tag, this.listener);

  @override
  _PreviewCardState createState() => _PreviewCardState(this.tag, this.listener);
}

class _PreviewCardState extends State<PreviewCard> {

  ItemAlmacen tag ;
  PreviewCardListener listener;

  _PreviewCardState(this.tag, this.listener);

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
        onLongPress: (){
          this.listener.onLongTab(tag);
        },
        onTap: (){
          this.listener.ontTab(tag);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Hero(
            tag:'image-hero',
            child:Container(
              constraints: new BoxConstraints.expand(
                height: 200.0,
              ),
              padding: new EdgeInsets.only(left: 16.0, bottom: 8.0, right: 16.0),
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  colorFilter: new ColorFilter.mode(
                      Colors.black.withOpacity(0.4),
                      BlendMode.softLight
                  ),
                  image: AssetImage('assets/imgs/hamburguesa.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: contenido()
          ),),
        )
    );
  }

  Stack contenido() {
    return new Stack(
      children: <Widget>[
        new Positioned(
          left: 0.0,
          bottom: 0.0,
          child: textoAbajo(),
        ),
        new Positioned(
          right: 0.0,
          top: 8.0,
          child: textoSuperior(),
        ),
      ],
    );
  }

  Text textoSuperior() {
    return new Text("Cant. 3",
        style: new TextStyle(
          color: Colors.white,
          fontSize: 14.0,
        )
    );
  }

  Widget textoAbajo() {
    return new Text(this.tag.titulo,
        style: new TextStyle(
          color: Colors.white,
          fontSize: 14.0,
        )
    );
  }



}

abstract class PreviewCardListener{
  void onLongTab(ItemAlmacen item);
  void ontTab(ItemAlmacen item);
}