import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/feature/accessibility/presentation/injection_containers/injections.dart';
import '../../../feature/note_catalog/presentation/injection_containers/injections.dart';

class InitialRepositoryInjectionWrapper extends StatelessWidget {
  final Widget child;

  const InitialRepositoryInjectionWrapper({Key? key, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        accessibilityInjectionContainer.injectRepository(),
        noteCatalogInjectionContainer.injectRepository(),
      ],
      child: child,
    );
  }
}
