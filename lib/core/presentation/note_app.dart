import 'package:flutter/material.dart';
import 'widgets/initial_bloc_injection_wrapper.dart';
import 'widgets/initial_repository_injection_wrapper.dart';
import 'routes/note_catalog_route.dart';

class NoteApp extends StatelessWidget {
  const NoteApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const InitialRepositoryInjectionWrapper(
      child: InitialBlocInjectionWrapper(
        child: MaterialApp(
          title: "Note app",
          home: NoteCatalogRoute(),
        ),
      ),
    );
  }
}
