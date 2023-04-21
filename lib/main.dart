import 'package:aer_v2/src/presentation/widgets/createAer.dart';
import 'package:aer_v2/src/presentation/widgets/home.dart';
import 'package:aer_v2/src/presentation/widgets/login.dart';
import 'package:aer_v2/src/presentation/widgets/signup.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Aer());
}

class Aer extends StatelessWidget {
  const Aer({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) {
          return const LoginScreen();
        },
        '/signup': (BuildContext context) {
          return const SignupScreen();
        },
        '/aer': (BuildContext context) {
          return const CreateAer();
        },
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
