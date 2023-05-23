// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'package:crud_bendera/data/model/profile_model.dart';
import 'package:crud_bendera/data/repositories/api_repositories.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ApiRepositories data;
  ProfileBloc(
    this.data,
  ) : super(ProfileInitial()) {
    on<OnProfileEvent>((event, emit) async {
      emit(ProfileLoading());
      final result = await data.getProfile();
      emit(ProfileLoaded(result));
    });
    on<LogoutProfileEvent>((event, emit)async {
      emit(ProfileLoading());
      await data.logout();
      emit(ProfileLogouted());
    });
  }
}
