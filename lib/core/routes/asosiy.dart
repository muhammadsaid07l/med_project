import 'package:flutter/material.dart';
import 'package:med_project/core/functions/app_functions.dart';
import 'package:med_project/core/route_names/asosiy.dart';
import 'package:med_project/features/asosiy/presentation/pages/asosiy_screen.dart';


class AsosiyRoute {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AsosiyRouteNames.asosiy:
        return fade(const AsosiyScreen());
    }
    return null;
  }
}
