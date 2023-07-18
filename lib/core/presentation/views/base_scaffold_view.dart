import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/feature/accessibility/application/accessibility_bloc.dart';
import 'package:note_app/feature/accessibility/presentation/injection_containers/injections.dart';

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
      body: BlocBuilder<AccessibilityBloc, AccessibilityState>(
        builder: (context, state) {
          if (state is AccessibilityLoaded) {
            if (state.entity.isTextSelectable) {
              return SelectionArea(child: child);
            }
          }
          return child;
        },
      )
    );
  }
}
