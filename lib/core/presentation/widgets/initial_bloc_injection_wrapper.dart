import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../feature/note_catalog/application/note_catalog_bloc.dart';
import '../../../feature/note_catalog/infrastructure/repositories/note_repository.dart';

class InitialBlocInjectionWrapper extends StatelessWidget {
  final Widget child;

  const InitialBlocInjectionWrapper({Key? key, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NoteCatalogBloc>(
          create: (context) {
            final repository = RepositoryProvider.of<NoteRepository>(context);
            return NoteCatalogBloc(repository)
              ..add(
                CatalogRefreshed(),
              );
          },
        )
      ],
      child: child,
    );
  }
}
