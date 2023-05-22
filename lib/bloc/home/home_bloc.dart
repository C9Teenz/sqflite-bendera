// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:crud_bendera/data/repositories/sql_repositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'package:crud_bendera/data/model/barang_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final SQLRepositories data;
  HomeBloc(
    this.data,
  ) : super(HomeInitial()) {
    on<GetBarangEvent>((event, emit) async {
      emit(HomeLoading());
      final response = await data.queryAllRows();
      emit(HomeLoaded(response));
    });
    on<DeleteBarangEvent>(
      (event, emit) async {
        emit(HomeLoading());
        await data.delete(event.id);
        emit(HomeSuccessDelete("success delete"));
      },
    );
  }
}
