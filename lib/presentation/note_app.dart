import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../infrastructure/note/repository/note_repository_impl.dart';
import '../domain/note/repository/note_repository.dart';

class NoteApp extends StatelessWidget {
  const NoteApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<NoteRepository>(
          create: (_) {
            final repository = NoteRepositoryImpl();
            return repository;
          },
        ),
      ],
      child: MaterialApp(title: "Note app",),
    );
  }
}
