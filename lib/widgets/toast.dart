import 'package:flutter/material.dart';

enum ToastPosition { bottom, center, top }

class Toast {
  static void show(
      BuildContext context,
      String message, {
        Duration duration = const Duration(seconds: 2),
        ToastPosition position = ToastPosition.bottom,
      }) {

    final overlay = Overlay.of(context);

    final overlayEntry = OverlayEntry(
      builder: (_) => _ToastWidget(
        message: message,
        duration: duration,
        position: position,
      ),
    );

    overlay.insert(overlayEntry);

    // 自动移除
    Future.delayed(duration + const Duration(milliseconds: 300), () {
      overlayEntry.remove();
    });
  }
}

class _ToastWidget extends StatefulWidget {
  final String message;
  final Duration duration;
  final ToastPosition position;

  const _ToastWidget({
    required this.message,
    required this.duration,
    required this.position,
  });

  @override
  State<_ToastWidget> createState() => _ToastWidgetState();
}

class _ToastWidgetState extends State<_ToastWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller =
  AnimationController(vsync: this, duration: const Duration(milliseconds: 200));
  late final Animation<double> _fadeAnimation =
  CurvedAnimation(parent: _controller, curve: Curves.easeIn);

  @override
  void initState() {
    super.initState();
    _controller.forward();
    Future.delayed(widget.duration, () => _controller.reverse());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double get verticalPosition {
    final height = MediaQuery.of(context).size.height;
    if(widget.position == ToastPosition.bottom) {
      return height * 0.85;
    } else if(widget.position == ToastPosition.top) {
      return height * 0.1;
    } else {
      return height * 0.4;
    }
    return widget.position == ToastPosition.center ? height * 0.4 : height * 0.85;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: verticalPosition,
      left: 32,
      right: 32,
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.85),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              widget.message,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
        ),
      ),
    );
  }
}