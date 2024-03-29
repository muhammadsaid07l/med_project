import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:med_project/core/injector/injector.dart';
import 'package:med_project/core/routes/app_route.dart';
import 'package:med_project/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:med_project/features/calendar/presentation/bloc/bloc/calendar_bloc.dart';
import 'package:med_project/features/calendar/presentation/bloc/task_bloc/calendar_bloc.dart';
import 'package:med_project/features/home/bloc/bnb_bloc.dart';

import 'package:med_project/firebase_options.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await getItInjector();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    const MainApp(),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return 

      MultiBlocProvider(
        providers: [
          // BlocProvider(create: (context) => AuthenticationBloc()),
          // BlocProvider(
          //   create: (_) => AuthenticationBloc(),
          // ),
          BlocProvider(
            create: (context) => CalendarTaskBloc(),
          ),
          BlocProvider(
            create: (context) => CalendarBloc(),
          ),
          BlocProvider(
            create: (context) => BnbBloc(),
          ),
          BlocProvider(
            create: (context) => AuthBloc(),
          ),
        
       
   
      
        ],
        child: MaterialApp(
          // theme: context.theme.lightTheme(),
          themeMode: ThemeMode.dark,
          themeAnimationDuration: const Duration(milliseconds: 250),
          themeAnimationCurve: Curves.slowMiddle,
          // darkTheme: context.theme.darkTheme(),
          debugShowCheckedModeBanner: false,
          useInheritedMediaQuery: true,
          onGenerateRoute: AppRoute.onGenerateRoute,
          
         
        ),
     
    );
  }
}
