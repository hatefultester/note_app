import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class BaseScaffoldView extends StatelessWidget {
  final Widget child;
  final AppBar? appBar;

  const BaseScaffoldView({
    Key? key,
    required this.child,
    this.appBar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: child,
    );
  }
}
