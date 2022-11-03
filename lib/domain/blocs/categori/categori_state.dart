part of 'categori_bloc.dart';

abstract class CategoriState {}

class CategoriInitial extends CategoriState {}

class CategoriInitialNotFound extends CategoriState {}

class LoadedCategori extends CategoriState {
  final List<Categori> categorilist;

  LoadedCategori({required this.categorilist});
  List<Object> get props => [categorilist];
}

class ErrorCategoriState extends CategoriState {
  final String message;
  ErrorCategoriState({required this.message});
  List<Object> get props => [message];
}
