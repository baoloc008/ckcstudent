import 'package:flutter/material.dart';

class CKCProgressIndicator extends StatelessWidget {
  final double value;

  const CKCProgressIndicator({Key key, this.value}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).primaryColor;
    return Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(color),
        value: value,
      ),
    );
  }
}
