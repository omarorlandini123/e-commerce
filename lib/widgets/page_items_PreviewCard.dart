import 'package:Freeler/entidades/ItemAlmacen.dart';
import 'package:flutter/material.dart';

class PreviewCard extends StatelessWidget {
  final ItemAlmacen tag;
  final PreviewCardListener listener;
  final bool selected;
  PreviewCard(this.tag, this.selected, this.listener);

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
        onLongPress: () {
          this.listener.onLongTab(tag);
        },
        onTap: () {
          this.listener.ontTab(tag);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              // Hero(
              //   tag:'image-hero'+tag.titulo,
              //   child: Image.asset("assets/imgs/hamburguesa.jpg"),
              // ),
              Hero(
            tag: 'image-hero' + tag.titulo,
            child: Container(
                constraints: new BoxConstraints.expand(
                  height: 200.0,
                ),
                padding:
                    new EdgeInsets.only(left: 16.0, bottom: 8.0, right: 16.0),
                decoration: new BoxDecoration(
                  image: miniaturaDec(),
                ),
                child: contenido()),
          ),
        ));
  }

  DecorationImage miniaturaDec() {
    if (selected) {
      return new DecorationImage(
        colorFilter: new ColorFilter.mode(
            Colors.black.withOpacity(0.6), BlendMode.darken),
        image: AssetImage(
          'assets/imgs/hamburguesa.jpg',
        ),
        fit: BoxFit.cover,
      );
    }
    return new DecorationImage(
      colorFilter: new ColorFilter.mode(
          Colors.black.withOpacity(0.2), BlendMode.softLight),
      image: AssetImage(
        'assets/imgs/hamburguesa.jpg',
      ),
      fit: BoxFit.cover,
    );
  }

  Stack contenido() {
    if (selected) {
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
          Positioned(
            left: 0.0,
            top: 8.0,
            child: textoSuperiorIzq(),
          ),
        ],
      );
    }
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
        )
      ],
    );
  }

  Widget textoSuperiorIzq() {
    return new Container(
      padding: EdgeInsets.all(6.0),
      constraints: BoxConstraints.tightForFinite(),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.black.withAlpha(150),
      ),
      child: Icon(
        Icons.check,
        color: Colors.white,
        size: 24.0,
      ),
    );
  }

  Text textoSuperior() {
    return new Text("Cant. 3",
        style: new TextStyle(
          color: Colors.white,
          fontSize: 14.0,
        ));
  }

  Widget textoAbajo() {
    return new Text(this.tag.titulo,
        style: new TextStyle(
          color: Colors.white,
          fontSize: 14.0,
        ));
  }
}

abstract class PreviewCardListener {
  void onLongTab(ItemAlmacen item);
  void ontTab(ItemAlmacen item);
}
