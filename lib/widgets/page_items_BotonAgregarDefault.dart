import 'package:flutter/material.dart';

class BotonAgregarDefault extends StatefulWidget {

  final GestureTapCallback onPressed;

  BotonAgregarDefault(this.onPressed);

  @override
  _BotonAgregarDefaultState createState() => _BotonAgregarDefaultState(onPressed);
}

class _BotonAgregarDefaultState extends State<BotonAgregarDefault> {

  final GestureTapCallback onPressed;
  _BotonAgregarDefaultState(this.onPressed);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(onPressed: this.onPressed,
      child: Icon(Icons.add),
      backgroundColor: Theme.of(context).buttonColor,
    );
  }
}


