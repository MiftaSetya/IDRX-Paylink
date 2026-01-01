import 'package:flutter/material.dart';
import 'package:idrx_paylink/widgets/card_container.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class BalanceCard extends StatefulWidget {
  final String balance;

  const BalanceCard({super.key, required this.balance});

  @override
  State<BalanceCard> createState() => _BalanceCardState();
}

class _BalanceCardState extends State<BalanceCard> {
  bool _showBalance = true;

  @override
  Widget build(BuildContext context) {
    return CardContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(width: 8),
              Text(
                "Total Balance",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Spacer(),
              IconButton(
                onPressed: () {
                  setState(() {
                    _showBalance = !_showBalance;
                  });
                },
                icon: Icon(
                  _showBalance ? LucideIcons.eye : LucideIcons.eyeOff,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: 8),
              Text(
                "IDR",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 8),
              Text(
                _showBalance ? widget.balance : "•••••",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  letterSpacing: _showBalance ? 0 : 4,
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
        ],
      ),
    );
  }
}
