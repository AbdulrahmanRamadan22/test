import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_firebase/widgets/text_form_field.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final GlobalKey<FormState> formstate = GlobalKey();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: formstate,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Center(
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(32)),
                        height: 70,
                        child: Image.asset("assets/scholar.png")),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const Text(
                    'Login',
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Login To Continue Using The App',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Email',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text_Form_Field(
                      hint: 'Email',
                      controller: email,
                    ),
                  ),
                  const Text(
                    'Password',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text_Form_Field(
                      hint: 'Password',
                      controller: password,
                    ),
                  ),
                  Container(
                    alignment: Alignment.topRight,
                    child: const Text(
                      'Forget Password ??',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
              MaterialButton(
                height: 40,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Colors.blueGrey[400],
                textColor: Colors.white,
                onPressed: () async {
                  if (formstate.currentState!.validate()) {
                    try {
                      final credential = await FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                              email: email.text, password: password.text);
                      Navigator.of(context).pushReplacementNamed("HomePage");
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {

                      } else if (e.code == 'wrong-password') {

                      }
                    }
                  }
                },
                child: const Text('Login'),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  'OR LogIn With',
                  textAlign: TextAlign.center,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                      child: const Icon(
                    Icons.facebook,
                    size: 45.0,
                    color: Colors.blue,
                  )),
                  GestureDetector(
                      child: const Icon(
                    FontAwesomeIcons.google,
                    size: 40.0,
                    color: Colors.red,
                  )),
                  GestureDetector(
                      child: const Icon(
                    Icons.apple,
                    size: 50.0,
                    color: Colors.black,
                  )),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pushReplacementNamed("Signup");
                    },
                    child: Text.rich(TextSpan(
                      children: [
                        const TextSpan(
                          text: "Don't Have An Account? ",
                          style: TextStyle(color: Colors.black),
                        ),
                        TextSpan(
                            text: ' Register',
                            style: TextStyle(
                              color: Colors.blueGrey[400],
                              fontWeight: FontWeight.bold,
                            ))
                      ],
                    )),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
