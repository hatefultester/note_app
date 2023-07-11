import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/bloc/note_catalog/note_catalog_bloc.dart';

class NoteCatalogRoute extends StatelessWidget {
  const NoteCatalogRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<NoteCatalogBloc, NoteCatalogState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is NoteCatalogLoading || state is NoteCatalogInitial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is NoteCatalogLoaded) {
            return Center(
              child: Text(
                state.list.toString(),
              ),
            );
          } else {
            return const Center(
              child: Text('error occurred'),
            );
          }
        },
      ),
    );
  }
}