// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'package:crud_bendera/data/model/register_model.dart';
import 'package:crud_bendera/data/repositories/api_repositories.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final ApiRepositories data;
  RegisterBloc(
    this.data,
  ) : super(RegisterInitial()) {
    on<OnRegisterEvent>((event, emit) async {
      emit(RegisterLoading());
      await data.register(event.regis);
      emit(RegisterSuccess());
    });
  }
}
