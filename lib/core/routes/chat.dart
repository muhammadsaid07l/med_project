import 'package:flutter/material.dart';
import 'package:med_project/core/functions/app_functions.dart';
import 'package:med_project/core/route_names/chat.dart';
import 'package:med_project/features/chat/presentation/pages/chat_screen.dart';


class ChatRoute {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case ChatRouteNames.chat:
        return fade(const ChatScreen());
    }
    return null;
  }
}
