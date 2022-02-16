import 'package:flutter/material.dart';
import 'package:newpeter/myicons.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailcontroller;
  var passwordcontroller;
  @override
  void initState() {
    super.initState();
    emailcontroller = TextEditingController();
    passwordcontroller = TextEditingController();
  }

  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: const Icon(
          MyFlutterApp.naturesprideb,
          size: 55.0,
          color: Colors.red,
        ),
        title: const Text("Welcome"),
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.blueGrey, Colors.cyan],
                begin: Alignment.topCenter,
                end: Alignment.bottomLeft),
            image: DecorationImage(
              opacity: 0.2,
              fit: BoxFit.fitHeight,
              image: AssetImage("assets/natpri.jpeg"),
            )),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 50.0),
          child: Column(
            children: [
              Container(
                color: Colors.black54,
                child: const Text(
                  "Log In / Sign Up ",
                  style: TextStyle(
                    backgroundColor: Colors.black38,
                    color: Colors.white70,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextFormField(
                controller: emailcontroller,
                decoration: const InputDecoration(
                    icon: const Icon(Icons.mail),
                    iconColor: Colors.greenAccent,
                    hintText: "Email",
                    hintStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.greenAccent,
                    )),
              ),
              TextFormField(
                controller: passwordcontroller,
                obscureText: true,
                decoration: const InputDecoration(
                    icon: const Icon(Icons.password),
                    iconColor: Colors.greenAccent,
                    hintText: "Password",
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.greenAccent,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: ElevatedButton(
                  onPressed: () {
                    print(emailcontroller.text);
                    print(passwordcontroller.text);
                  },
                  child: const Text("Sign In"),
                ),
              ),
              const SizedBox(height: 40.0),
              const Text(
                "Do not Have An Account?",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13.0,
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: OutlinedButton(
          onPressed: () {},
          child: const Text("Sign Up"),
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateColor.resolveWith((states) => Colors.blueGrey))),
    );
  }
}

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}
