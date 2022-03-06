part of 'uplabsview_cubit.dart';

@immutable
abstract class UplabsviewState {}

class UplabsviewInitial extends UplabsviewState {}

class UplabsviewLoading extends UplabsviewState {}

class UplabsviewCompleted extends UplabsviewState {
  final UserModel? userlist;
  final List<TrendTitleModel?> trendTitlelist;
  final List<PopularTitleModel?> popularTitlelist;

  UplabsviewCompleted(
      this.userlist, this.trendTitlelist, this.popularTitlelist);
}
