import 'package:flutter/material.dart';

class PreviewCard extends StatelessWidget {

  String tag = "";

  PreviewCard(this.tag);

  @override
  Widget build(BuildContext context) {

    final Widget image = new GestureDetector(
        onTap: () {  },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Hero(
              key: new Key("preview-card"),
              tag: this.tag,
              child: new Image.asset(
                "assets/imgs/hamburguesa.jpg",
                fit: BoxFit.cover,
              )
          ),
        )
    );

    return image;
  }


}
