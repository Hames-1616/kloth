import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kloth/core/providers.dart';
import 'package:kloth/features/auth/screens/start_page.dart';
import 'package:kloth/features/home/controller/home_Controller.dart';
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

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    super.initState();
    ref.read(homeControllerProvider.notifier).checkToken();
  }

  @override
  Widget build(BuildContext context) {
    final login = ref.watch(loginscreen);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarBrightness: Brightness.dark,
    ));
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: primaryAccent,
          useMaterial3: false,
            colorScheme: ColorScheme.fromSwatch()
                .copyWith(primary: primaryAccent, secondary: secondaryAccent,),
            scaffoldBackgroundColor: Colors.white),
        home: login ?   Homepage() : const StartPage()
        );
  }
}
