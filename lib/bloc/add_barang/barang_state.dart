part of 'barang_bloc.dart';

@immutable
abstract class BarangState {}

class BarangInitial extends BarangState {}

class BarangLoading extends BarangState {}

class BarangLoaded extends BarangState {}
