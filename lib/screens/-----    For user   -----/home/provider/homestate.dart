// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'package:recycle_app/core/enum.dart';

class HomeState_U {
  ParentsChosenNavigationItem chosenNavigationItem =
      ParentsChosenNavigationItem.home;
  int navigationIndex = 0;

  LoadingState loadingState = LoadingState.initial;

  LoadingState savedLoadingState = LoadingState.initial;
}
