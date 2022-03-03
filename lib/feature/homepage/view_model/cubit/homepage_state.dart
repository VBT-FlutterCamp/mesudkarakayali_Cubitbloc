part of 'homepage_cubit.dart';

@immutable
abstract class HomepageState {}

class HomepageInitial extends HomepageState {}

class HomePageList extends HomepageState {
  final List<PhotoModel> list;

  HomePageList(this.list);
}

class HomePageLoadingState extends HomepageState {
  final bool isLoading;

  HomePageLoadingState(this.isLoading);
}
