import 'package:flutter/material.dart';

class CustomIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
            child: Container(
          child: CircularProgressIndicator(),
          width: 32.0,
          height: 32.0,
        )),
      ),
    );
  }
}
