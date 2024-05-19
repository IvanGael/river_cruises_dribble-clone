// import 'package:flutter/material.dart';
// import 'package:river_cruises_dribble/constants/colors.dart';

// class CruiseShowView extends StatefulWidget {
//   final int index;
//   final Widget child;
//   const CruiseShowView({super.key, required this.index, required this.child});

//   @override
//   State<CruiseShowView> createState() => _CruiseShowViewState();
// }

// class _CruiseShowViewState extends State<CruiseShowView> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//       fit: StackFit.expand,
//       children: [
//         Hero(
//         tag: widget.index,
//         child: widget.child,
//       )
//       ],
//     ),
//     floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
//     floatingActionButton: IconButton(
//           style: ButtonStyle(
//             backgroundColor: WidgetStateProperty.all(AppColors.white)
//           ),
//           onPressed: (){
//             Navigator.of(context).pop();
//           }, 
//           icon: Icon(Icons.arrow_back_ios, color: AppColors.primary,),
//         ),
//     );
//   }
// }







import 'package:flutter/material.dart';
import 'package:river_cruises_dribble/constants/colors.dart';

class CruiseShowView extends StatefulWidget {
  final int index;
  final Widget child;

  const CruiseShowView({super.key, required this.index, required this.child});

  @override
  State<CruiseShowView> createState() => _CruiseShowViewState();
}

class _CruiseShowViewState extends State<CruiseShowView> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Hero(
            tag: widget.index,
            child: PixelRevealAnimation(
              controller: _controller,
              child: widget.child,
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: IconButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(AppColors.white),
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Icon(Icons.arrow_back_ios, color: AppColors.primary),
      ),
    );
  }
}

class PixelRevealAnimation extends StatelessWidget {
  final Animation<double> controller;
  final Widget child;

  const PixelRevealAnimation({super.key, required this.controller, required this.child});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return ClipPath(
          clipper: PixelClipper(progress: controller.value),
          child: child,
        );
      },
      child: child,
    );
  }
}

class PixelClipper extends CustomClipper<Path> {
  final double progress;

  PixelClipper({required this.progress});

  @override
  Path getClip(Size size) {
    final path = Path();
    final totalPixels = size.width * size.height;
    final revealedPixels = (totalPixels * progress).round();
    final columns = size.width.round();
    // final rows = size.height.round();
    final pixelsPerColumn = revealedPixels ~/ columns;

    for (int i = 0; i < columns; i++) {
      for (int j = 0; j < pixelsPerColumn; j++) {
        if (i * pixelsPerColumn + j >= revealedPixels) {
          break;
        }
        path.addRect(Rect.fromLTWH(i.toDouble(), j.toDouble(), 1, 1));
      }
    }

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
