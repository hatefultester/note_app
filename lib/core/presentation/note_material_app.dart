import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../feature/accessibility/application/accessibility_bloc.dart';
import 'routes/note_catalog_route.dart';
import 'widgets/initial_bloc_injection_wrapper.dart';
import 'widgets/initial_repository_injection_wrapper.dart';

class NoteMaterialApp extends StatelessWidget {
  const NoteMaterialApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InitialRepositoryInjectionWrapper(
      child: InitialBlocInjectionWrapper(
        child: BlocBuilder<AccessibilityBloc, AccessibilityState>(
          builder: (context, state) {
            if (state is AccessibilityLoaded) {
              return MaterialApp(
                theme: ThemeData(
                  brightness: state.entity.brightness,
                  textTheme: TextTheme(
                    displayLarge: TextStyle(
                      fontSize: 45 * state.entity.fontSize.object,
                    ),
                    displayMedium: TextStyle(
                      fontSize: 40 * state.entity.fontSize.object,
                    ),
                    displaySmall: TextStyle(
                      fontSize: 35 * state.entity.fontSize.object,
                    ),
                    headlineLarge: TextStyle(
                      fontSize: 30 * state.entity.fontSize.object,
                    ),
                    headlineMedium: TextStyle(
                      fontSize: 28 * state.entity.fontSize.object,
                    ),
                    headlineSmall: TextStyle(
                      fontSize: 24 * state.entity.fontSize.object,
                    ),
                    titleLarge: TextStyle(
                      fontSize: 22 * state.entity.fontSize.object,
                    ),
                    titleMedium: TextStyle(
                      fontSize: 20 * state.entity.fontSize.object,
                    ),
                    titleSmall: TextStyle(
                      fontSize: 18 * state.entity.fontSize.object,
                    ),
                    bodyLarge: TextStyle(
                      fontSize: 16 * state.entity.fontSize.object,
                    ),
                    bodyMedium: TextStyle(
                      fontSize: 14 * state.entity.fontSize.object,
                    ),
                    bodySmall: TextStyle(
                      fontSize: 12 * state.entity.fontSize.object,
                    ),
                    labelLarge: TextStyle(
                      fontSize: 14 * state.entity.fontSize.object,
                    ),
                    labelMedium: TextStyle(
                      fontSize: 12 * state.entity.fontSize.object,
                    ),
                    labelSmall: TextStyle(
                      fontSize: 10 * state.entity.fontSize.object,
                    ),
                  ),
                  colorSchemeSeed: state.entity.themeColor.object,
                ),
                title: "Note app",
                home: const NoteCatalogRoute(),
              );

            }
            return const MaterialApp(
              home: Material(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            );

          },
        ),
      ),
    );
  }
}
