import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_note/firebase_options.dart';
import 'package:my_note/views/login_view.dart';
import 'package:my_note/views/register_view.dart';
import 'package:my_note/views/verify_email.dart';

void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    routes: {
      '/login/': (context) => const LoginView(),
      '/register/': (context) => const RegisterView(),
    },
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    title: 'My Notes',
    debugShowCheckedModeBanner: false,
    home: const HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      ),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            final user = FirebaseAuth.instance.currentUser;
            if (user != null) {
              if (user.emailVerified) {
                print("email is Verified");
              } else {
                return const VerifiedEmailView();
              }
            } else {
              return const LoginView();
            }
            return const Text("Done");
          default:
            return const CircularProgressIndicator.adaptive();
        }
      },
    );
  }
}
