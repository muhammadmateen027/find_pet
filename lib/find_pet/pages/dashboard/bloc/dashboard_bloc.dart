
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:network/network.dart';
import 'package:repository/repository.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc({required this.repository}) : super(DashboardInitial()) {
    on<LoadDogs>(_loadDogs);
  }

  final RepositoryService repository;

  void _loadDogs(LoadDogs event, Emit<DashboardState> emit) async {
    try {
      final response = await repository.loadRandomDogImages();
      var dogs = await compute(_parseDogs, response.data);

      return;
    } on NetworkException {
      return;
    }
  }
}

// A function that converts a response body into a TopAlbumsModel
Dogs _parseDogs(dynamic responseBody) {
  return Dogs.fromJson(responseBody);
}
