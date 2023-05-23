part of 'list_barang_user_bloc.dart';

@immutable
abstract class ListBarangUserState {}

class ListBarangUserInitial extends ListBarangUserState {}
class ListBarangUserLoading extends ListBarangUserState {}
class ListBarangUserloaded extends ListBarangUserState {
  final List<BarangModel> barangUser;
  ListBarangUserloaded({
    required this.barangUser,
  });
}
