import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seventyfivehard/state/auth_provider.dart';
import 'package:seventyfivehard/ui/authentication/auth.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => AuthProvider(),
          ),
        ],
        builder: (context, child) {
          return Sizer(
            builder: (context, orientation, deviceType) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: '75 Hard',
                theme: ThemeData(
                  fontFamily: 'Ubuntu',
                  primarySwatch: Colors.grey,
                ),
                home: Authentication(),
              );
            },
          );
        });
  }
}
