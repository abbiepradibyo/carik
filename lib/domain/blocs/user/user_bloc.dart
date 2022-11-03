import 'package:carikerja/domain/models/response/response_user.dart';
import 'package:carikerja/domain/services/user_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UserState()) {
    on<OnGetUserAuthenticationEvent>(_onGetUserAuthentication);
  }

  Future<void> _onGetUserAuthentication(
      OnGetUserAuthenticationEvent event, Emitter<UserState> emit) async {
    try {
      final data = await userService.getUserById();

      emit(state.copyWith(user: data.user, postsUser: data.postsUser));
    } catch (e) {
      emit(FailureUserState(e.toString()));
    }
  }
}
