import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seventyfivehard/state/auth_provider.dart';
import 'package:seventyfivehard/state/home_provider.dart';
import 'package:seventyfivehard/ui/authentication/auth.dart';
import 'package:seventyfivehard/ui/home/home.dart';
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
        ChangeNotifierProvider(
          create: (context) => HomeProvider(),
        )
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
              home: StreamBuilder<User?>(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (context, snapshot) {
                  return snapshot.hasError
                      ? Text('An error occured')
                      : snapshot.connectionState == ConnectionState.active
                          ? snapshot.data == null
                              ? Authentication()
                              : Home()
                          : CircularProgressIndicator();
                },
              ),
            );
          },
        );
      },
    );
  }
}
