part of 'dashboard_bloc.dart';

@immutable
abstract class DashboardEvent {}

// This event will take [Artist] as a param and will pass to the bloc
class LoadDogs extends DashboardEvent {}
