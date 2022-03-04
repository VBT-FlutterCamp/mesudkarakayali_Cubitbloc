part of 'homepage_cubit.dart';

@immutable
abstract class HomepageState {}

class HomepageInitial extends HomepageState {}

class HomePageCompleted extends HomepageState {
  final List<PhotoModel> list;

  HomePageCompleted(this.list);
}

class HomePageLoadingState extends HomepageState {
  final bool isLoading;

  HomePageLoadingState(this.isLoading);
}

class HomePageError extends HomepageState{
final String error;

  HomePageError(this.error);
}
