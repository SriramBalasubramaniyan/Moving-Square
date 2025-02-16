import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      theme: ThemeData.light(),
      themeMode: ThemeMode.system, // Changes Theme based on the system
      home: const SquareMovementScreen(),
    );
  }
}

class SquareMovementScreen extends StatefulWidget {
  const SquareMovementScreen({super.key});

  @override
  _SquareMovementScreenState createState() => _SquareMovementScreenState();
}

class _SquareMovementScreenState extends State<SquareMovementScreen> {
  // Position of the cube
  late double _position;
  // Indicates the cube is being animated
  bool _isAnimating = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Initialize the position of the cube in center
    double screenWidth = MediaQuery.of(context).size.width;
    double squareSize = 100.0;
    _position = (screenWidth - squareSize) / 2;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double squareSize = 100.0;

    // gives a spacing of 5 on left side after positioning
    double leftPosition = 5;

    // gives a spacing of 5 on right side after positioning
    // screenWidth - squareSize - 25 to place the square at the right end of the screen.
    double rightPosition = screenWidth - squareSize - 30;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: screenWidth,
            height: 100,
            child: Stack(
              children: [
                AnimatedPositioned(
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOut,
                  left: _position,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      (_position == leftPosition) && !_isAnimating ? const SizedBox() : GestureDetector(onTap: (_isAnimating || _position == leftPosition)
                          ? null
                          : () => _moveSquare(leftPosition),child: const Icon(Icons.keyboard_arrow_left,color: Colors.green)),
                      Container(
                        width: squareSize,
                        height: squareSize,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      (_position == rightPosition) && !_isAnimating ? const SizedBox() : GestureDetector(onTap: (_isAnimating || _position == rightPosition)
                          ? null
                          : () => _moveSquare(rightPosition),child: const Icon(Icons.keyboard_arrow_right,color: Colors.green)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _moveSquare(double targetPosition) {
    // if being animated noting will return
    if (_isAnimating) return;

    setState(() {
      _isAnimating = true;
      // setting position to _position variable
      _position = targetPosition;
    });

    // animating end after 1 second
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _isAnimating = false;
      });
    });
  }
}
