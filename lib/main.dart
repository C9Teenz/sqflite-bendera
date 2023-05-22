import 'package:crud_bendera/bloc/edit_barang/edit_barang_bloc.dart';
import 'package:crud_bendera/data/repositories/sql_repositories.dart';

import 'package:crud_bendera/ui/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/add_barang/barang_bloc.dart';
import 'bloc/home/home_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BarangBloc(SQLRepositories()),
        ),
        BlocProvider(
          create: (context) =>
              HomeBloc(SQLRepositories())..add(GetBarangEvent()),
        ),
        BlocProvider(
          create: (context) => EditBarangBloc(SQLRepositories()),
        )
      ],
      child: const MaterialApp(
        title: 'Flutter Demo',
        home: HomePage(),
      ),
    );
  }
}
