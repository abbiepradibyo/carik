part of 'post_bloc.dart';

abstract class PostState {}

class PostInitial extends PostState {}

class PostInitialNotFound extends PostState {}

class LoadedPost extends PostState {
  final List<Post> postlist;
  bool hasMax;

  LoadedPost({required this.postlist, required this.hasMax});
  List<Object> get props => [postlist];
}

class ErrorState extends PostState {
  final String message;
  ErrorState({required this.message});
  List<Object> get props => [message];
}
