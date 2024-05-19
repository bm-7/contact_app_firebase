import 'package:contact_app_firebase/screens/signinandup/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(
            top: 100,
          ),
          child: Text(
            "LogIn",
            style: TextStyle(fontSize: 40),
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: TextField(
            controller: email,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), hintText: "email"),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: TextField(
            controller: pass,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), hintText: "pass"),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Center(
          child: ElevatedButton(
              onPressed: () async {
                if (email.text.isEmpty && pass.text.isEmpty) {
                  return showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                              content: Row(
                            children: [
                              const Text("enter feilds"),
                              const SizedBox(
                                width: 100,
                              ),
                              IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(Icons.close))
                            ],
                          )));
                }
                try {
                  UserCredential? usercred;
                  usercred = await FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: email.text, password: pass.text);
                } on FirebaseAuthException catch (e) {
                  // ignore: use_build_context_synchronously
                  showDialog(
                    context: context,
                    builder: (context) =>
                        AlertDialog(title: Text(e.toString()), actions: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.close),
                      ),
                    ]),
                  );
                }
              },
              child: const Text("SignIn")),
        ),
        const SizedBox(
          height: 50,
        ),
        Center(
          child: Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 170),
                child: Text("Dont have account"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignUp(),
                    ),
                  );
                },
                child: const Text("SignUp"),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
