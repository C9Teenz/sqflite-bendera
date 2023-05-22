part of 'edit_barang_bloc.dart';

@immutable
abstract class EditBarangEvent {}

class OnEditBarangEvent extends EditBarangEvent {
  final Map<String, dynamic> row;
  OnEditBarangEvent(
    this.row,
  );
}

class OneBarangEvent extends EditBarangEvent{
  final int id;
  OneBarangEvent(
    this.id,
  );
}
