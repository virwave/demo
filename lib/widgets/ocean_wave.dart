import 'package:flutter/material.dart';

class OceanWave extends StatefulWidget {
  const OceanWave({super.key});

  @override
  _OceanWaveState createState() => _OceanWaveState();
}

class _OceanWaveState extends State<OceanWave> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _strokeWidthAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _strokeWidthAnimation = Tween<double>(begin: 1.0, end: 5.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(200, 100),
      painter: WavePainter(
        animation: _controller,
        strokeWidthAnimation: _strokeWidthAnimation,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class WavePainter extends CustomPainter {
  final Animation<double> animation;
  final Animation<double> strokeWidthAnimation;

  WavePainter({
    required this.animation,
    required this.strokeWidthAnimation,
  }) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final double waveHeight = size.height / 2;

    final Path path = Path()
      ..moveTo(0, size.height / 2)
      ..quadraticBezierTo(
          size.width / 4,
          size.height + waveHeight * animation.value,
          size.width / 2,
          size.height / 2)
      ..quadraticBezierTo(3 * size.width / 4, -waveHeight * animation.value,
          size.width, size.height / 2);

    // Draw the gradient line with varying stroke width
    final gradient = const LinearGradient(
      colors: [
        Color.fromARGB(255, 152, 74, 69),
        Color.fromARGB(255, 171, 132, 74),
        Color.fromARGB(255, 153, 145, 71),
        Color.fromARGB(255, 77, 159, 80),
        Color.fromARGB(255, 75, 125, 166),
        Color.fromARGB(255, 76, 86, 145),
        Color.fromARGB(255, 145, 74, 157),
      ],
    ).createShader(
        Rect.fromPoints(const Offset(0, 0), Offset(size.width, size.height)));

    paint.shader = gradient;
    paint.strokeWidth = strokeWidthAnimation.value;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
