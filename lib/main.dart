import 'package:flutter/material.dart';
import 'package:my_note/constants/routes.dart';
import 'package:my_note/services/auth/auth_service.dart';
import 'package:my_note/views/login_view.dart';
import 'package:my_note/views/notes_view.dart';
import 'package:my_note/views/register_view.dart';
import 'package:my_note/views/verify_email_view.dart';

void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    routes: {
      loginRoute: (context) => const LoginView(),
      registerRoute: (context) => const RegisterView(),
      notesRoute: (context) => const NotesView(),
      verifyEmailRoute: (context) => const VerifiedEmailView(),
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
      future: AuthService.firebase().initialize(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            final user = AuthService.firebase().currentUser;
            if (user != null) {
              if (user.isEmailVerified) {
                return const NotesView();
              } else {
                return const VerifiedEmailView();
              }
            } else {
              return const LoginView();
            }
          default:
            return const CircularProgressIndicator.adaptive();
        }
      },
    );
  }
}
