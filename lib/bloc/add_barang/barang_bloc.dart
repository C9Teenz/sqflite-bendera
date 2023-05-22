// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:crud_bendera/data/repositories/sql_repositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';



part 'barang_event.dart';
part 'barang_state.dart';

class BarangBloc extends Bloc<BarangEvent, BarangState> {
  final SQLRepositories data;
  BarangBloc(
    this.data,
  ) : super(BarangInitial()) {
    on<AddBarangEvent>((event, emit) async {
      emit(BarangLoading());
      await data.insert(event.row);
      emit(BarangLoaded());
    });
  }
}
