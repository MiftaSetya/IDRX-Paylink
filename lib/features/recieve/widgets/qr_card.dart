import 'package:flutter/material.dart';
import 'package:idrx_paylink/utils/amount_formatter.dart';
import 'package:idrx_paylink/widgets/card_container.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCard extends StatelessWidget {
  final String data;
  final int amount;

  const QrCard({super.key, required this.data, required this.amount});

  @override
  Widget build(BuildContext context) {
    return CardContainer(
      child: Column(
        children: [
          QrImageView(data: data, version: QrVersions.auto, size: 350),
          SizedBox(height: 15),
          Text(
            AmountFormatter.format(amount),
            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 32),
          ),
          Text(
            "IDRX",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 22,
              color: Colors.blue,
            ),
          ),
          SizedBox(height: 10),
          _networkBadge()
        ],
      ),
    );
  }

  Widget _networkBadge() => Container(
    decoration: BoxDecoration(
      color: Colors.blue.shade50,
      borderRadius: BorderRadius.circular(99),
    ),
    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 2),
    child: Text(
      "Base Network",
      style: TextStyle(color: Colors.blue, fontSize: 16),
    ),
  );
}
