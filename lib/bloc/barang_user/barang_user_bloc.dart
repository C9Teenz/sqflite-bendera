// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:crud_bendera/data/model/barang_model.dart';
import 'package:crud_bendera/data/repositories/api_repositories.dart';

part 'barang_user_event.dart';
part 'barang_user_state.dart';

class BarangUserBloc extends Bloc<BarangUserEvent, BarangUserState> {
  final ApiRepositories data;
  BarangUserBloc(
    this.data,
  ) : super(BarangUserInitial()) {
    on<AddBarangUserEvent>((event, emit) async{
      emit(BarangUserLoading());
      await data.addBarangUser(event.name, event.barang);
      emit(BarangUserSuccess());
    });
  }
}
