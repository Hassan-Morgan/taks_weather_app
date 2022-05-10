import 'package:flutter/material.dart';

class DetailsDivider extends StatelessWidget {
  const DetailsDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: double.infinity,
      height: 1.5,
      color: Theme.of(context).primaryColor,
    );
  }
}
