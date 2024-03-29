import 'package:flutter/material.dart';
import 'package:med_project/core/functions/app_functions.dart';
import 'package:med_project/core/route_names/profile.dart';
import 'package:med_project/features/profile/presentation/pages/profile_screen.dart';

class ProfileRoute {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case ProfileRouteNames.profile:
        return fade(const ProfileScreen());
    }
    return null;
  }
}
  