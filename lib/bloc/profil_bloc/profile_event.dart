part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent {}

class OnProfileEvent extends ProfileEvent {}

class LogoutProfileEvent extends ProfileEvent {}
