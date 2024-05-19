import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  TextEditingController emailup = TextEditingController();
  TextEditingController passup = TextEditingController();
  TextEditingController passc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(
                  top: 100,
                ),
                child: Text(
                  "Register",
                  style: TextStyle(fontSize: 40),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              TextField(
                controller: emailup,
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: passup,
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: passc,
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: ElevatedButton(
                    onPressed: () async {
                      if (emailup.text.isEmpty &&
                          passup.text.isEmpty &&
                          passc.text.isEmpty) {
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
                      if (passc.text != passup.text) {
                        return showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            content: Text("match both passwords"),
                          ),
                        );
                      } else {
                        UserCredential? usercred;
                        try {
                          usercred = await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                                  email: emailup.text, password: passup.text);
                        } on FirebaseAuthException catch (e) {
                          AlertDialog(title: Text(e.toString()), actions: [
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.close),
                            ),
                          ]);
                        }
                      }
                    },
                    child: const Text("SignIn")),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
