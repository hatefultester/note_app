import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../feature/note_catalog/infrastructure/repositories/note_repository.dart';

class InitialRepositoryInjectionWrapper extends StatelessWidget {
  final Widget child;

  const InitialRepositoryInjectionWrapper({Key? key, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<NoteRepository>(
          create: (_) {
            final repository = NoteRepository();
            return repository;
          },
        ),
      ],
      child: child,
    );
  }
}
