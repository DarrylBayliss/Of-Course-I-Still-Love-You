
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Use this as a header item within a ListView.
class HeaderListItem extends StatelessWidget {
  final String heading;

  HeaderListItem(this.heading);

  @override
  Widget build(BuildContext context) {
    return Text(
      heading, textDirection: TextDirection.ltr
    );
  }
}