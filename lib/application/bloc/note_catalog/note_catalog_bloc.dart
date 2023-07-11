import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';

import '../../../domain/core/core.dart';
import '../../../domain/note/entity/note_entity.dart';
import '../../../infrastructure/note/repository/note_repository_impl.dart';
import '../../../infrastructure/note/validator/note_validator.dart';

part 'note_catalog_state.dart';

part 'note_catalog_event.dart';

class NoteCatalogBloc extends Bloc<NoteCatalogEvent, NoteCatalogState> {
  final Logger _logger;
  final NoteRepositoryImpl _repository;

  NoteCatalogBloc(this._repository)
      : _logger = Logger(),
        super(
          NoteCatalogInitial(),
        ) {
    on<CatalogRefreshed>(_handleCatalogRefresh);
  }

  FutureOr<void> _handleCatalogRefresh(
      CatalogRefreshed event, Emitter<NoteCatalogState> emit) async {
    emit(NoteCatalogLoading());
    final Either<Failure, List<NoteEntity<NoteValidator>>> fetchResult =
        await _repository.getNotes();
    fetchResult.fold(
      (l) {
        emit(
          NoteCatalogError(),
        );
      },
      (r) {
        emit(
          NoteCatalogLoaded(list: r),
        );
      },
    );
  }

}
