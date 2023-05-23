// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'barang_user_bloc.dart';

@immutable
abstract class BarangUserEvent {}

class AddBarangUserEvent extends BarangUserEvent {
  final String name;
  final BarangModel barang;
  AddBarangUserEvent({
    required this.name,
    required this.barang,
  });
}
