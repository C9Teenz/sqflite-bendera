// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'edit_barang_bloc.dart';

@immutable
abstract class EditBarangState {}

class EditBarangInitial extends EditBarangState {}
class EditBarangLoading extends EditBarangState {}
class EditBarangSuccess extends EditBarangState {}
class EditBarangLoaded extends EditBarangState {
  final BarangModel data;
  EditBarangLoaded(
    this.data,
  );
}
