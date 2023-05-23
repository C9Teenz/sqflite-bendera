part of 'barang_user_bloc.dart';

@immutable
abstract class BarangUserState {}

class BarangUserInitial extends BarangUserState {}
class BarangUserLoading extends BarangUserState {}
class BarangUserSuccess extends BarangUserState {}

