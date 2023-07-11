import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/application/bloc/note/note_bloc.dart';
import 'package:note_app/infrastructure/note/repository/note_repository_impl.dart';

class NoteCreateRoute extends StatelessWidget {
  const NoteCreateRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NoteBloc>(
      create: (context) {
        final repository = RepositoryProvider.of<NoteRepositoryImpl>(context);
        return NoteBloc(repository)
          ..add(
            NewNoteStarted(
              value: none(),
            ),
          );
      },
      child: Scaffold(
        body: BlocConsumer<NoteBloc, NoteState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is NoteInitial || state is NoteLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is NoteLoaded) {
              return Column(
                children: [
                  TextFormField(
                    initialValue: state.note.title.object,
                    onChanged: (value) {
                      BlocProvider.of<NoteBloc>(context).add(
                        NoteTitleEdited(
                          value: value,
                        ),
                      );
                    },
                  ),
                  Text(state.note.title.value.fold((l) => "Invalid title", (r) => ""),),
                  TextFormField(
                    initialValue: state.note.description.object,
                    onChanged: (value) {
                      BlocProvider.of<NoteBloc>(context).add(
                        NoteDescriptionEdited(
                          value: value,
                        ),
                      );
                    },
                  ),

                  Text(state.note.description.value.fold((l) => "Invalid description", (r) => ""),),
                ]
              );
            } else {
              return const Center(
                child: Text('Error occurred'),
              );
            }
          },
        ),
      ),
    );
  }
}
