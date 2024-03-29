import 'package:flutter/material.dart';
import 'package:med_project/core/functions/app_functions.dart';
import 'package:med_project/core/route_names/app_route_name.dart';
import 'package:med_project/features/auth/presentation/pages/splash.dart';
import 'package:med_project/features/calendar/calendar_screen.dart';
import 'package:med_project/features/home/home.dart';



import '../../features/asosiy/presentation/pages/asosiy_screen.dart';
import '../../features/chat/presentation/pages/chat_screen.dart';
import '../../features/maqola/presentation/pages/maqola_screen.dart';
import '../../features/profile/presentation/pages/profile_screen.dart';

class AppRoute {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouteNames.splash:
        return fade(const SplashScreen());
      case AppRouteNames.asosiy:
        return fade(const AsosiyScreen());
      case AppRouteNames.maqola:
        return fade(const MaqolaScreen());
      case AppRouteNames.chat:
        return fade(const ChatScreen());
      case AppRouteNames.splash:
        return fade(const ProfileScreen());
      case AppRouteNames.calendar:
        return fade(const CalendarScreen());
      case AppRouteNames.home:
        return fade( HomePage());

      default:
        return fade(const Scaffold());
    }
  }
}
