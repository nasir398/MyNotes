import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;

import 'package:mynotes/constants/routes.dart';
import 'package:mynotes/services/auth/auth_service.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({Key? key}) : super(key: key);

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Verify')),
      body: Column(
        children: [
          const Text("We've sent verification email, please check your inbox."),
          const Text(
              'If you have not received email, please press the below link to send again. '),
          TextButton(
              onPressed: () async {
                final user = AuthService.firebase().currentUser;

                devtools.log(user.toString());
                await AuthService.firebase().sendEmailVerification();
              },
              child: const Text("Send email Verification")),
          TextButton(
              onPressed: () async {
                await AuthService.firebase().logOut();

                Navigator.of(context).pushNamedAndRemoveUntil(
                  registerRoute,
                  (route) => false,
                );
              },
              child: const Text("Restart"))
        ],
      ),
    );
  }
}
