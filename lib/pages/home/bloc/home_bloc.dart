import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:machine_test/pages/home/bloc/data/home_model.dart';
import 'package:machine_test/pages/home/bloc/data/home_repo.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepo _homeRepo;
  HomeBloc(this._homeRepo) : super(HomeLoadingState());

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is HomeLoadEvent) {
      yield HomeLoadingState();

      try {
        HomeModel homeData = await _homeRepo.getHomeData();
        yield HomeLoadedState(homeData: homeData);
      } catch (e) {
        yield HomeLoadFailedState(errorMsg: e.toString());
      }
    } else if (event is HomeCategoryChangeEvent) {
      yield HomeLoadingState();
      _homeRepo.homeModel.selectedIndex = event.newIndex;
      yield HomeLoadedState(homeData: _homeRepo.homeModel);
    }
  }
}
