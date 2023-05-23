// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'list_barang_user_bloc.dart';

@immutable
abstract class ListBarangUserEvent {}
class OnListBarangUserEvent extends ListBarangUserEvent {
  final String name;
  OnListBarangUserEvent({
    required this.name,
  });
}
