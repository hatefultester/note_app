part of 'note_catalog_bloc.dart';

abstract class NoteCatalogState {}

class NoteCatalogInitial extends NoteCatalogState {

}

class NoteCatalogLoading extends NoteCatalogState {

}

class NoteCatalogLoaded extends NoteCatalogState {
  final List<NoteEntity<NoteValidator>> list;

  NoteCatalogLoaded({required this.list});
}

class NoteCatalogError extends NoteCatalogState {}