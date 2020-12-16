part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeLoadingState extends HomeState {}

class HomeLoadedState extends HomeState {
  final HomeModel homeData;
  HomeLoadedState({@required this.homeData});

  @override
  List<Object> get props => [homeData];
}

class HomeLoadFailedState extends HomeState {
  final String errorMsg;
  HomeLoadFailedState({@required this.errorMsg});

  @override
  List<Object> get props => [errorMsg];
}
