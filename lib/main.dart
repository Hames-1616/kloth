import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kloth/core/loadingScreen.dart';
import 'package:kloth/core/providers.dart';
import 'package:kloth/features/auth/screens/start_page.dart';
import 'package:kloth/features/home/screens/homescreen.dart';
import 'package:kloth/utlis/color.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarBrightness: Brightness.dark,
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: primaryAccent, scaffoldBackgroundColor: Colors.white),
      home: ref.watch(stringToken).when(
          data: (data) {
            if (data != null) {
              return const Homepage();
            }
            return const StartPage();
          },
          error: (error, st) {
            return  Center(child: Text(error.toString()),);
          },
          loading: () => const Loading()),
    );
  }
}
