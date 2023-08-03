import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get_login_firebase/presentation/loginscreeen.dart';
import 'package:get_login_firebase/presentation/userscreen.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'controllers/bindings.dart';
import 'database/hivedtabse.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(UserAdapter().typeId)) {
    Hive.registerAdapter(UserAdapter());
  }

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Flutter login',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple),
      appBarTheme: const AppBarTheme(color: Colors.deepPurple),
    ),
    initialRoute: '/login', // Set the initial route to the LoginScreen.
    getPages: [
      GetPage(
          name: '/login', page: () => LoginScreen(), binding: AuthBinding()),
      GetPage(name: '/user', page: () => UserScreen()),
    ],
  ));
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const MyPhone(),
//     );
//   }
// }
