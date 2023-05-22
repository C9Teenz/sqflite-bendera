// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'barang_bloc.dart';

@immutable
abstract class BarangEvent {}

class AddBarangEvent extends BarangEvent {
  final Map<String, dynamic> row;
  AddBarangEvent(
    this.row,
  );
}


