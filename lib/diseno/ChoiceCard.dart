import 'package:flutter/material.dart';
import 'package:ecommerce/diseno/Choice.dart';

const List<Choice> choices = const <Choice>[
  const Choice(title: '', icon: Icons.check),
];

class TextCard extends StatelessWidget {
  const TextCard({Key key, this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return Card(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(this.text, style: textStyle,
            textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}