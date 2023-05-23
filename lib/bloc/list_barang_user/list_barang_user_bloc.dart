// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'package:crud_bendera/data/model/barang_model.dart';
import 'package:crud_bendera/data/repositories/api_repositories.dart';

part 'list_barang_user_event.dart';
part 'list_barang_user_state.dart';

class ListBarangUserBloc extends Bloc<ListBarangUserEvent, ListBarangUserState> {
  final ApiRepositories data;
  ListBarangUserBloc(
    this.data,
  ) : super(ListBarangUserInitial()) {
    on<OnListBarangUserEvent>((event, emit)async {
      emit(ListBarangUserLoading());
      final result=await data.getBarangUser(event.name);
      emit(ListBarangUserloaded(barangUser: result));
    });
  }
}
