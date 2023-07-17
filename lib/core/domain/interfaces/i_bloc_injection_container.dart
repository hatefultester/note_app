import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class IBlocInjectionContainer<T extends Bloc> {
  T createBloc(
    BuildContext context,
  );

  BlocProvider<T> injectBloc() => BlocProvider<T>(
        create: createBloc,
      );

  T getBloc(BuildContext context) => BlocProvider.of<T>(
        context,
      );
}
