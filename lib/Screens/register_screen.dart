import 'package:flutter/material.dart';
import 'package:login_screen/Screens/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpasswordController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _obscured = true;

  void _passwordVisibility() {
    setState(() {
      _obscured = !_obscured;
    });
  }

  void passwordChecker() {
    if (_passwordController.text == _confirmpasswordController.text) {
      return print("PassWords are same");
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              "Warning!",
              style: TextStyle(),
            ),
            content: const Text("Passwords are not the same."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("OK"),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              ClipPath(
                clipper: Curve(),
                /*SinCosineWaveClipper(
                  horizontalPosition: HorizontalPosition.right,
                ),*/
                child: Container(
                  height: screenHeight * 0.23,
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
                      const Text(
                        "Sign up",
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        height: 2,
                        width: screenWidth * 0.2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.deepOrange,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Email", style: TextStyle(fontSize: 18)),
                            TextFormField(
                              controller: _emailController,
                              decoration: const InputDecoration(
                                hintText: "demo@gmail.com",
                                prefixIcon: Icon(Icons.email),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.deepOrange,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            const Text("Phone Number",
                                style: TextStyle(fontSize: 18)),
                            TextFormField(
                              controller: _phoneController,
                              decoration: const InputDecoration(
                                hintText: "0755078933",
                                prefixIcon: Icon(Icons.phone),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.deepOrange,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            const Text("Password",
                                style: TextStyle(fontSize: 18)),
                            TextFormField(
                              controller: _passwordController,
                              obscureText: _obscured,
                              decoration: InputDecoration(
                                hintText: "Password",
                                prefixIcon: const Icon(Icons.lock),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscured
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                  ),
                                  onPressed: _passwordVisibility,
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.deepOrange,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            const Text("Confirm Password",
                                style: TextStyle(fontSize: 18)),
                            TextFormField(
                              controller: _confirmpasswordController,
                              obscureText: _obscured,
                              decoration: InputDecoration(
                                hintText: "Confirm password",
                                prefixIcon: const Icon(Icons.lock),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscured
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                  ),
                                  onPressed: _passwordVisibility,
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.deepOrange,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                      const SizedBox(height: 60),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          children: [
                            Container(
                              width: screenWidth * 0.9,
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    passwordChecker();
                                  });
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                    const Color(0xFFfc8484),
                                  ),
                                ),
                                child: const Text(
                                  "Register",
                                  style: TextStyle(
                                      fontSize: 25, color: Colors.black),
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Text(
                                  "Already have an account? ",
                                  style: TextStyle(fontSize: 18),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const LoginScreen()));
                                  },
                                  child: const Text(
                                    "Sign In",
                                    style: TextStyle(
                                        color: Colors.deepOrange,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Curve extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.65);
    path.quadraticBezierTo(size.width * 0.2, size.height * 0.55,
        size.width * 0.45, size.height * 0.85);
    path.quadraticBezierTo(
        size.width * 0.7, size.height * 1.1, size.width, size.height * 0.85);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
