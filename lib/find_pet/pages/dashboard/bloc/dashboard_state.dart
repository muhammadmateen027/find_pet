part of 'dashboard_bloc.dart';

@immutable
abstract class DashboardState {
  const DashboardState();

  List<Object> get props => [];
}

class DashboardInitial extends DashboardState {}

class DashboardLoading extends DashboardState {}

// When app successfully loads album, this state will be used to update the UI
class DogsLoaded extends DashboardState {
  const DogsLoaded({required this.dogs});

  final List<String> dogs;

  @override
  List<Object> get props => [dogs];
}
