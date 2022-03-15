import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:mynotes/constants/routes.dart';

import '../utilities/show_error_dialog.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Column(
        children: [
          TextField(
            controller: _email,
            enableSuggestions: false,
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(hintText: 'Enter Email'),
          ),
          TextField(
            controller: _password,
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            decoration: const InputDecoration(hintText: 'Enter Password'),
          ),
          TextButton(
            onPressed: () async {
              final email = _email.text;
              final password = _password.text;

              try {
                await FirebaseAuth.instance.signInWithEmailAndPassword(
                  email: email,
                  password: password,
                );

                Navigator.of(context).pushNamedAndRemoveUntil(
                  notesRoute,
                  (route) => false,
                );
              } on FirebaseAuthException catch (e) {
                if (e.code == 'user-not-found') {
                  await showErrorDialog(
                    context,
                    "User not found",
                  );
                  // devtools.log("User not found");
                  //devtools.log(e.code);
                  // } else if (e.code == 'invalid-email') {
                  //   devtools.log("Invalid email");
                } else if (e.code == 'wrong-password' ||
                    (e.code == 'invalid-email')) {
                  await showErrorDialog(
                    context,
                    "Invlaid Credentials",
                  );
                  // devtools.log("Wrong Password");
                } else if (e.code == 'weak-password') {
                  //devtools.log("Weak Passwrod");
                  await showErrorDialog(
                    context,
                    "Weak Passwrod",
                  );
                } else {
                  await showErrorDialog(
                    context,
                    "Error : ${e.code}",
                  );
                }
              } catch (e) {
                await showErrorDialog(
                  context,
                  "Error : ${e.toString()}",
                );
              }
            },
            child: const Text('Login'),
          ),
          TextButton(
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  registerRoute,
                  (route) => false,
                );
              },
              child: const Text("Not registered yet, Register here "))
        ],
      ),
    );
  }
}
