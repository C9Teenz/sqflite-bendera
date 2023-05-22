// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class GetBarangEvent extends HomeEvent {}

class DeleteBarangEvent extends HomeEvent {
  final int id;
  DeleteBarangEvent(
    this.id,
  );
}

