import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/domain/interfaces/i_bloc_injection_container.dart';
import '../../../../core/domain/interfaces/i_repository_injection_container.dart';
import '../../infrastructure/repositories/accessibility_repository.dart';

import '../../application/accessibility_bloc.dart';

class AccessibilityInjectionContainer
    implements
        IRepositoryInjectionContainer<AccessibilityRepository>,
        IBlocInjectionContainer<AccessibilityBloc> {
  @override
  AccessibilityBloc createBloc(BuildContext context) {
    return AccessibilityBloc(
      getRepository(context),
    )..add(
        StartAccessibility(),
      );
  }

  @override
  AccessibilityRepository createRepository(BuildContext context) {
    return AccessibilityRepository();
  }

  @override
  AccessibilityBloc getBloc(BuildContext context) {
    return BlocProvider.of<AccessibilityBloc>(context);
  }

  @override
  AccessibilityRepository getRepository(BuildContext context) {
    return RepositoryProvider.of<AccessibilityRepository>(context);
  }

  @override
  BlocProvider<AccessibilityBloc> injectBloc() {
    return BlocProvider(
      create: createBloc,
    );
  }

  @override
  RepositoryProvider<AccessibilityRepository> injectRepository() {
    return RepositoryProvider(
      create: createRepository,
    );
  }
}
