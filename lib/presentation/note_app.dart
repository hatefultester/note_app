import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/application/bloc/note_catalog/note_catalog_bloc.dart';
import 'package:note_app/presentation/routes/note_catalog_route.dart';
import '../infrastructure/note/repository/note_repository_impl.dart';
import '../domain/note/repository/note_repository.dart';

class NoteApp extends StatelessWidget {
  const NoteApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<NoteRepositoryImpl>(
          create: (_) {
            final repository = NoteRepositoryImpl();
            return repository;
          },
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<NoteCatalogBloc>(
            create: (context) {
              final repository =
                  RepositoryProvider.of<NoteRepositoryImpl>(context);
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
