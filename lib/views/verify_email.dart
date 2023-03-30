import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
      body: Column(
        children: [
          const Text(
            'Please Verifiy Your Email',
          ),
          TextButton(
            onPressed: () async {
              final user = FirebaseAuth.instance.currentUser;
              await user?.sendEmailVerification();
            },
            child: const Text(
              "Send Email",
            ),
          ),
        ],
      ),
    );
  }
}
