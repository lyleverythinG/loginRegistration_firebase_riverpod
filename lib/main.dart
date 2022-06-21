import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_firebase/constants/constants.dart';
import 'package:riverpod_firebase/screens/loading.dart';
import 'router/app_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //TODO: Initialize this Flutter Project in Firebase for the functionalities to work.
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: Constants.kFirebaseWithRiverpod,
        debugShowCheckedModeBanner: false,
        theme: Constants.aTheme,
        initialRoute: LoadingScreen.route,
        onGenerateRoute: AppRouter.onNavigate,
      ),
    );
  }
}
