// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'package:crud_bendera/data/model/login_model.dart';
import 'package:crud_bendera/data/repositories/api_repositories.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final ApiRepositories data;
  LoginBloc(
    this.data,
  ) : super(LoginInitial()) {
    on<OnLoginEvent>((event, emit) async {
      emit(LoginLoading());
      await data.login(event.login);
      emit(LoginSuccess());
    });
  }
}
