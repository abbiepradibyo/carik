import 'package:carikerja/data/storage/location_storage.dart';
import 'package:carikerja/domain/models/response/response_post.dart';
import 'package:carikerja/domain/services/post_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial()) {
    on<PostEvent>(_onLoadPostList);
  }

  List<Post> postList = [];
  int start = 0, limit = 6;
  late String lat, long;

  Future<void> _onLoadPostList(PostEvent event, Emitter<PostState> emit) async {
    if (event is FetchPost) {
      try {
        if (start == 0) {
          start++;
          print('pertana');
          print(start);
          print('pertama');
          emit(PostInitial());
          lat = (await locationStorage.readLatitude())!;
          long = (await locationStorage.readLongitude())!;

          List<Post> list =
              await PostServices().getAllPostHome(lat, long, start, limit);

          postList.addAll(list);
          print(list.length);
          list.isEmpty
              ? emit(PostInitialNotFound())
              : emit(LoadedPost(postlist: postList, hasMax: false));
        } else {
          start++;
          print('kedua');
          print(start);
          print('kedua');
          List<Post> list =
              await PostServices().getAllPostHome(lat, long, start, limit);
          postList.addAll(list);

          print(list.length);
          list.isEmpty
              ? emit(LoadedPost(postlist: postList, hasMax: true))
              : emit(LoadedPost(postlist: postList, hasMax: false));
        }
      } catch (e) {
        start--;
        emit(ErrorState(message: e.toString()));
      }
    }
  }
}
