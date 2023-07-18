import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/domain/interfaces/i_bloc_injection_container.dart';

import '../../application/note_bloc.dart';
import '../../infrastructure/repositories/note_repository.dart';

class NoteInjectionContainer implements IBlocInjectionContainer<NoteBloc> {
  @override
  NoteBloc getBloc(BuildContext context) => BlocProvider.of<NoteBloc>(context);

  @override
  BlocProvider<NoteBloc> injectBloc() => BlocProvider(
        create: createBloc,
      );

  @override
  NoteBloc createBloc(BuildContext context) => NoteBloc(
        RepositoryProvider.of<NoteRepository>(context),
      )..add(
          NewNoteStarted(
            value: optionOf(null),
          ),
        );
}
