// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:crud_bendera/data/model/barang_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'package:crud_bendera/data/repositories/sql_repositories.dart';

part 'edit_barang_event.dart';
part 'edit_barang_state.dart';

class EditBarangBloc extends Bloc<EditBarangEvent, EditBarangState> {
  final SQLRepositories data;
  EditBarangBloc(
    this.data,
  ) : super(EditBarangInitial()) {
    on<OnEditBarangEvent>((event, emit) async {
      emit(EditBarangLoading());
      await data.update(event.row);
      emit(EditBarangSuccess());
    });
    on<OneBarangEvent>((event, emit) async {
      emit(EditBarangLoading());
      final result = await data.getOneCell(event.id);
      emit(EditBarangLoaded(result));
    });
  }
}
