part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomeLoadEvent extends HomeEvent {}

class HomeCategoryChangeEvent extends HomeEvent {
  final int newIndex;
  HomeCategoryChangeEvent({@required this.newIndex});

  @override
  List<Object> get props => [newIndex];
}
