// ignore_for_file: non_constant_identifier_names, prefer_final_fields, camel_case_types

import 'package:recycle_app/core/enum.dart';

class HomeState_E {
  ParentsChosenNavigationItem chosenNavigationItem =
      ParentsChosenNavigationItem.home;
  int navigationIndex = 0;

  LoadingState loadingState = LoadingState.initial;

  LoadingState savedLoadingState = LoadingState.initial;

  SelectedJobAppliedSection selectedAppliedSection =
      SelectedJobAppliedSection.Active;

// ignore: unused_field
  CartDetails cartDetails = CartDetails.checkout;
}
