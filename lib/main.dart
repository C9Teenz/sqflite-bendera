import 'package:crud_bendera/bloc/list_barang_user/list_barang_user_bloc.dart';

import 'bloc/barang_user/barang_user_bloc.dart';
import 'bloc/edit_barang/edit_barang_bloc.dart';
import 'bloc/login_bloc/login_bloc.dart';
import 'bloc/profil_bloc/profile_bloc.dart';
import 'bloc/register_bloc/register_bloc.dart';
import 'data/repositories/api_repositories.dart';
import 'data/repositories/sql_repositories.dart';

import 'ui/register_page.dart';
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
        ),
        BlocProvider(
          create: (context) => RegisterBloc(ApiRepositories()),
        ),
        BlocProvider(
          create: (context) => LoginBloc(ApiRepositories()),
        ),
        BlocProvider(
          create: (context) =>
              ProfileBloc(ApiRepositories()),
        ),
        BlocProvider(
          create: (context) => BarangUserBloc(ApiRepositories()),
        ),
        BlocProvider(
          create: (context) => ListBarangUserBloc(ApiRepositories()),
        )
      ],
      child: const MaterialApp(
        title: 'Flutter Demo',
        home: RegisterPage(),
      ),
    );
  }
}
