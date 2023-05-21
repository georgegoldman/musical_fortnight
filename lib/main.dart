import 'package:aer_v2/src/application/services/authentication.dart';
import 'package:aer_v2/src/presentation/view/account.dart';
import 'package:aer_v2/src/presentation/view/createAer.dart';
import 'package:aer_v2/src/presentation/widgets/home.dart';
import 'package:aer_v2/src/presentation/view/login.dart';
import 'package:aer_v2/src/presentation/view/settings.dart';
import 'package:aer_v2/src/presentation/view/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
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
    FirebaseAuth auth = FirebaseAuth.instance;

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Authentication(context: context)),
      ],
      child: MaterialApp(
        theme: ThemeData(useMaterial3: true),
        home: StreamBuilder(
          stream: auth.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const Home();
            } else {
              return const LoginScreen();
            }
          },
        ),
        routes: <String, WidgetBuilder>{
          '/signup': (BuildContext context) {
            return const SignupScreen();
          },
          '/aer': (BuildContext context) {
            return const CreateAer();
          },
          '/settings': (BuildContext context) {
            return const Settings();
          },
          '/account': (BuildContext context) {
            return const Account();
          }
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
