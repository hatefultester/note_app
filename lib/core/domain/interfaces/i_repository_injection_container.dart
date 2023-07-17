import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class IRepositoryInjectionContainer<T> {
  T createRepository(
    BuildContext context,
  );

  RepositoryProvider<T> injectRepository() => RepositoryProvider(
        create: createRepository,
      );

  T getRepository(BuildContext context) => RepositoryProvider.of<T>(
        context,
      );
}
