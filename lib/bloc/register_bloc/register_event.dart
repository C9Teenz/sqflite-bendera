// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent {}

class OnRegisterEvent extends RegisterEvent {
  final RegisterModel regis;
  OnRegisterEvent(
    this.regis,
  );
}
