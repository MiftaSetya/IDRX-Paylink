import 'package:flutter/material.dart';
import 'package:idrx_paylink/widgets/card_container.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class WalletCard extends StatelessWidget {
  final String address;
  // final VoidCallback onCopy;

  const WalletCard({super.key, required this.address});

  @override
  Widget build(BuildContext context) {
    return CardContainer(
      child: Row(
        children: [
          _icon(),
          SizedBox(width: 15),
          Expanded(child: _info()),
          SizedBox(width: 10),
          _copyButton(),
        ],
      ),
    );
  }

  Widget _icon() => Container(
    padding: const EdgeInsets.all(14),
    decoration: BoxDecoration(
      color: Colors.blue.shade50,
      shape: BoxShape.circle,
    ),
    child: const Icon(LucideIcons.wallet, color: Colors.blue),
  );

  Widget _info() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Your Wallet",
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Colors.grey.shade600,
        ),
      ),
      Text(
        "0x1234...5678abcd",
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: 16),
      ),
    ],
  );

  Widget _copyButton() => Container(
    padding: const EdgeInsets.all(14),
    decoration: BoxDecoration(
      color: Colors.grey.shade100,
      shape: BoxShape.circle,
    ),
    child: const Icon(LucideIcons.copy),
  );
}
