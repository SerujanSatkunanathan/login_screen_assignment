import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:custom_clippers/custom_clippers.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _obscured = true;
  bool _checkbox = false;

  void passwordvisibility() {
    setState(() {
      _obscured = !_obscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: ListView(children: [
        Column(
          children: [
            ClipPath(
              clipper: SinCosineWaveClipper(
                horizontalPosition: HorizontalPosition.right,
              ),
              child: Container(
                height: screenHeight * 0.4,
                width: screenWidth,
                color: Colors.black,
                child: Image.asset(
                  'assets/bg.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    const Text(
                      "Sign in",
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      height: 2,
                      width: screenWidth * 0.2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.deepOrange,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Email",
                            style: TextStyle(fontSize: 18),
                          ),
                          TextFormField(
                            controller: _usernameController,
                            decoration: const InputDecoration(
                                hintText: "demo@gmail.com",
                                prefixIcon: Icon(Icons.email),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.deepOrange))),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            "Password",
                            style: TextStyle(fontSize: 18),
                          ),
                          TextFormField(
                            controller: _passwordController,
                            obscureText: _obscured,
                            decoration: InputDecoration(
                                hintText: "Enter your password",
                                prefixIcon: const Icon(Icons.lock),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscured
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                  ),
                                  onPressed: () {
                                    passwordvisibility();
                                  },
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.deepOrange))),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                    value: _checkbox,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        _checkbox = value ?? false;
                                      });
                                    },
                                    checkColor: Colors.black,
                                    activeColor: Colors.deepOrange,
                                  ),
                                  const Text(
                                    "Remember Me?",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                              const Text("Forgot Password?",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.deepOrange))
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    SafeArea(
                        child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        children: [
                          Container(
                            width: screenWidth * 0.9,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.deepOrange.shade200)),
                              child: const Text(
                                "Login",
                                style: TextStyle(
                                    fontSize: 25, color: Colors.black),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't you have an account? ",
                                style: TextStyle(fontSize: 18),
                              ),
                              InkWell(
                                child: Text(
                                  "SignUp",
                                  style: TextStyle(
                                      color: Colors.deepOrange,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ))
                  ],
                ),
              ),
            ),
          ],
        )
      ]),
    );
  }
}
