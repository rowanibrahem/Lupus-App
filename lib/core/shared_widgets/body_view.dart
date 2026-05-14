import 'package:flutter/material.dart';

class BodyView extends StatelessWidget {
  const BodyView(this.bodyWidget, {super.key});
  final Widget bodyWidget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: bodyWidget,

        // child: SingleChildScrollView(
        //   padding: EdgeInsets.all(16),
        //   child: bodyWidget,
        // ),
      ),
    );
  }
}
