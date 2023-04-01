import 'package:flutter/material.dart';
import 'package:my_note/constants/routes.dart';
import 'package:my_note/services/auth/auth_service.dart';

class VerifiedEmailView extends StatefulWidget {
  const VerifiedEmailView({super.key});

  @override
  State<VerifiedEmailView> createState() => _VerifiedEmailViewState();
}

class _VerifiedEmailViewState extends State<VerifiedEmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Verification"),
      ),
      body: Center(
        child: Column(
          children: [
            const Text(
              "we've sent you a email verification, please open your email and verify.",
              textAlign: TextAlign.center,
            ),
            const Text(
              textAlign: TextAlign.center,
              "If you haven't received a verification email, press the button below. ",
            ),
            ElevatedButton(
              onPressed: () async {
                await AuthService.firebase().sendEmailVerfication();
              },
              child: const Text(
                "Send Email Verification",
              ),
            ),
            TextButton(
                onPressed: () async {
                  await AuthService.firebase().logOut();
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil(registerRoute, (route) => false);
                },
                child: const Text("Restart"))
          ],
        ),
      ),
    );
  }
}
