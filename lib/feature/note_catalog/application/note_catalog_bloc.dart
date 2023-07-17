import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';

import '../../../core/domain/core.dart';
import '../domain/entities/note_entity.dart';
import '../infrastructure/repositories/note_repository.dart';
import '../infrastructure/validators/note_validator.dart';

part 'note_catalog_state.dart';

part 'note_catalog_event.dart';

class NoteCatalogBloc extends Bloc<NoteCatalogEvent, NoteCatalogState> {
  final Logger _logger;
  final NoteRepository _repository;

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
