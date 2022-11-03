import 'package:carikerja/domain/models/response/response_categori.dart';
import 'package:carikerja/domain/services/categori_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'categori_event.dart';
part 'categori_state.dart';

class CategoriBloc extends Bloc<CategoriEvent, CategoriState> {
  CategoriBloc() : super(CategoriInitial()) {
    on<CategoriEvent>(_onLoadCategoriList);
  }

  List<Categori> categoriList = [];

  Future<void> _onLoadCategoriList(
      CategoriEvent event, Emitter<CategoriState> emit) async {
    if (event is FetchCategori) {
      try {
        emit(CategoriInitial());
        List<Categori> list = await CategoriServices().getAllCategories();

        categoriList.addAll(list);
        list.isEmpty
            ? emit(CategoriInitialNotFound())
            : emit(LoadedCategori(categorilist: categoriList));
      } catch (e) {
        emit(ErrorCategoriState(message: e.toString()));
      }
    }
  }
}
