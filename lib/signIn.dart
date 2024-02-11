import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignInPage(),
    );
  }
}

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF12372A), // This is an approximate dark green background color
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomPaint(
              size: Size(MediaQuery.of(context).size.width, 300), // Adjust the size as needed
              painter: CurvePainter(),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(flex: 3),
              // Replace with your logo asset path
              Image.asset('assets/mainIcon.png', width: MediaQuery.of(context).size.width * 20),
              Spacer(),
              CheckboxListTile(
                title: const Text(
                  'terms and conditions',
                  style: TextStyle(color: Colors.white),
                ),
                value: false,
                onChanged: (bool? value) {
                  // Handle checkbox state change
                },
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: Color(0xFF12372a),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // TODO: Implement create account action
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF12372a), // Background color
                  onPrimary: Colors.white, // Text color
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 32),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text('Create an Account'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // TODO: Implement sign-in action
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF12372a), // Background color
                  onPrimary: Colors.white, // Text color
                  padding: EdgeInsets.symmetric(vertical: 17, horizontal: 32),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text('Sign In'),
              ),
              Spacer(flex: 5),
            ],
          ),
        ],
      ),
    );
  }
}

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Color(0xFFF0EFEF) // This is an approximate off-white color for the curve
      ..style = PaintingStyle.fill;

    var path = Path();
    path.moveTo(0, size.height * 0.5);
    path.quadraticBezierTo(size.width * 0.2, size.height * 0.45, size.width * 0.35, size.height * 0.5);
    path.quadraticBezierTo(size.width * 0.5, size.height * 0.55, size.width * 0.65, size.height * 0.5);
    path.quadraticBezierTo(size.width * 0.8, size.height * 0.45, size.width, size.height * 0.5);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
