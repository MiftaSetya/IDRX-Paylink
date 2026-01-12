import 'package:flutter/material.dart';
import 'package:idrx_paylink/features/pay/widgets/scanner_overlay_painter.dart';

class ScannerOverlay extends StatelessWidget {
  final double size = 260;

  const ScannerOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ColorFiltered(
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.6),
            BlendMode.srcOut,
          ),
          child: Stack(
            children: [
              Container(color: Colors.black),
              Center(
                child: Container(
                  width: size,
                  height: size,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ],
          ),
        ),

        // Frame
        Center(
          child: SizedBox(
            width: size,
            height: size,
            child: CustomPaint(
              painter: ScannerOverlayPainter(
                color: Colors.blue.shade400,
                strokeWidth: 5,
                cornerRadius: 20,
                cornerLength: 50
              ),
            ),
          ),
        )
      ],
    );
  }
}
