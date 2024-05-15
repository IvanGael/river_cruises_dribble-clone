
import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:river_cruises_dribble/constants/colors.dart';



class CustomBackground extends StatefulWidget {
  const CustomBackground({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CustomBackgroundState createState() => _CustomBackgroundState();
}

class _CustomBackgroundState extends State<CustomBackground>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late List<Particle> particles;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: false, period: Duration(seconds: 1));

    _initializeParticles();

    Timer.periodic(const Duration(seconds: 4), (Timer timer) {
      _initializeParticles();
    });
  }


  void _initializeParticles() {
    setState(() {
      particles = List.generate(
        50,
        (index) => Particle(
          position: Offset(
            Random().nextDouble() * 500,
            Random().nextDouble() * 500,
          ),
          size: Random().nextDouble() * 10 + 5,
          color: AppColors.primary.withOpacity(Random().nextDouble()),
          rotation: Random().nextDouble() * 180,
        ),
      );
    });
  }
 

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return CustomPaint(
                painter: ParticlePainter(particles, _controller.value),
                child: Container(),
              );
            },
          );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class ParticlePainter extends CustomPainter {
  final List<Particle> particles;
  final double progress;

  ParticlePainter(this.particles, this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    for (var particle in particles) {
      particle.draw(canvas, size, progress);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class Particle {
  final Offset position;
  final double size;
  final Color color;
  final double rotation;

  Particle({
    required this.position,
    required this.size,
    required this.color,
    required this.rotation,
  });

  void draw(Canvas canvas, Size size, double progress) {
    final paint = Paint()..color = color;

    final animatedX = position.dx + progress * 50;
    final animatedY = position.dy + progress * 50;

    final animatedSize = size.height * (1 - progress);

    canvas.save();
    canvas.translate(animatedX, animatedY);
    canvas.rotate(rotation * (1 - progress));

    canvas.drawCircle(const Offset(0, 0), animatedSize, paint);

    canvas.restore();
  }
}
