import 'dart:async';

import 'package:flutter/material.dart';
import 'package:idrx_paylink/features/recieve/widgets/qr_card.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class QrDisplayScreen extends StatefulWidget {
  final String qrData;
  final int amount;

  const QrDisplayScreen({
    super.key,
    required this.qrData,
    required this.amount,
  });

  @override
  State<QrDisplayScreen> createState() => _QrDisplayScreenState();
}

class _QrDisplayScreenState extends State<QrDisplayScreen> {
  static const int _initialSeconds = 15 * 60;
  late int _remainingSeconds;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _remainingSeconds = _initialSeconds;
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds <= 0) {
        timer.cancel();
        return;
      }

      setState(() {
        _remainingSeconds--;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String get _formattedTime {
    final minutes = _remainingSeconds ~/ 60;
    final seconds = _remainingSeconds % 60;
    return "${minutes.toString().padLeft(2, '0')} Min "
        "${seconds.toString().padLeft(2, '0')} Sec";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Payment QR Code",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 12,
            children: [
              Text(
                "Scan the QR code to pay",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 5,
                children: [
                  Icon(
                    LucideIcons.timer,
                    color: _remainingSeconds <= 30
                        ? Colors.red
                        : Colors.grey.shade600,
                    size: 20,
                  ),
                  Text(
                    _formattedTime,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: _remainingSeconds <= 30
                          ? Colors.red
                          : Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
              QrCard(data: widget.qrData, amount: widget.amount),
            ],
          ),
        ),
      ),
    );
  }
}
