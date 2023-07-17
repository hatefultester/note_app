import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/domain/interfaces/i_bloc_injection_container.dart';
import '../../../../core/domain/interfaces/i_repository_injection_container.dart';

import '../../application/note_catalog_bloc.dart';
import '../../infrastructure/repositories/note_repository.dart';


class NoteCatalogInjectionContainer
    implements
        IBlocInjectionContainer<NoteCatalogBloc>,
        IRepositoryInjectionContainer<NoteRepository> {

  @override
  NoteCatalogBloc getBloc(BuildContext context) => BlocProvider.of<NoteCatalogBloc>(context);

  @override
  NoteRepository getRepository(BuildContext context) => RepositoryProvider.of<NoteRepository>(context);

  @override
  BlocProvider<NoteCatalogBloc> injectBloc() => BlocProvider(create: createBloc,);

  @override
  RepositoryProvider<NoteRepository> injectRepository() => RepositoryProvider(create: createRepository,);

  @override
  NoteCatalogBloc createBloc(BuildContext context) => NoteCatalogBloc(
        getRepository(context),
      );

  @override
  NoteRepository createRepository(BuildContext context) => NoteRepository();
}
