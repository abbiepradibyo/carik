part of 'location_bloc.dart';

abstract class LocationState {}

class LocationInitial extends LocationState {}

class LocationLoaded extends LocationState {
  final String location;
  LocationLoaded({required this.location});
}

class LocationError extends LocationState {
  final String message;
  LocationError({required this.message});
}
