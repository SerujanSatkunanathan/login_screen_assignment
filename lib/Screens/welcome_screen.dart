import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login_screen/Screens/login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          ClipPath(
            clipper: Curve(),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
              child: Image.asset(
                'assets/bg.jpg',
                fit: BoxFit.fill,
                height: screenHeight * 0.90,
                width: screenWidth,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.4),
              Padding(
                padding: EdgeInsets.only(
                    top: screenHeight * 0.35, left: screenWidth * 0.1),
                child: Text(
                  "Welcome",
                  style: TextStyle(
                    fontSize: screenWidth * 0.1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: screenWidth * 0.1,
                  ),
                  child: const Text(
                      "Hey there! Discover something amazing today!"),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: screenWidth * 0.7, bottom: screenHeight * 0.05),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()));
                  },
                  child: Row(
                    children: [
                      const Text('Continue'),
                      SvgPicture.asset(
                        'assets/arrow.svg',
                        height: screenWidth * 0.075,
                        width: screenWidth * 0.075,
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
    path.lineTo(0, size.height * 0.67);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.6,
        size.width * 0.55, size.height * 0.7);
    path.quadraticBezierTo(
        size.width * 0.85, size.height * 0.8, size.width, size.height * 0.75);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
