part of 'post_bloc.dart';

abstract class PostEvent {}

class FetchPost extends PostEvent {
  FetchPost();
}
