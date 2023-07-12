import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../application/bloc/note_catalog/note_catalog_bloc.dart';
import 'routes/note_catalog_route.dart';
import '../infrastructure/note/repository/note_repository.dart';

class NoteApp extends StatelessWidget {
  const NoteApp({Key? key}) : super(key: key);

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
      child: MultiBlocProvider(
        providers: [
          BlocProvider<NoteCatalogBloc>(
            create: (context) {
              final repository =
                  RepositoryProvider.of<NoteRepository>(context);
              return NoteCatalogBloc(repository)..add(CatalogRefreshed(),);
            },
          )
        ],
        child: const MaterialApp(
          title: "Note app",
          home: NoteCatalogRoute(),
        ),
      ),
    );
  }
}
