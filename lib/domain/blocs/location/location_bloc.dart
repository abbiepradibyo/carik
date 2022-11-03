import 'package:carikerja/domain/services/location_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';
import 'package:carikerja/data/storage/location_storage.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc() : super(LocationInitial()) {
    on<OnCheckingLocation>(_onLocation);
  }

  Future<void> _onLocation(
      LocationEvent event, Emitter<LocationState> emit) async {
    emit(LocationInitial());
    try {
      var location = Location();
      var currentLocation = await location.getLocation();
      await locationStorage.deleteLocationStorage();
      await locationStorage.persistenLocation(currentLocation);

      final data = await locationService.getLocation(currentLocation);

      if (data.resp) {
        emit(LocationLoaded(location: data.address));
      } else {
        emit(LocationError(message: 'error'));
      }
    } catch (e) {
      emit(LocationError(message: 'error'));
    }
  }
}
