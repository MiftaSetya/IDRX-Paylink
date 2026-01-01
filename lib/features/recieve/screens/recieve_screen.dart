import 'package:flutter/material.dart';
import 'package:idrx_paylink/features/recieve/widgets/amount_card.dart';
import 'package:idrx_paylink/features/recieve/widgets/note_card.dart';
import 'package:idrx_paylink/features/recieve/widgets/wallet_card.dart';
import 'package:idrx_paylink/widgets/primary_button.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class RecieveScreen extends StatefulWidget {
  const RecieveScreen({super.key});

  @override
  State<RecieveScreen> createState() => _RecieveScreenState();
}

class _RecieveScreenState extends State<RecieveScreen> {
  final TextEditingController _ammountController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Recieve Payment",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            spacing: 20,
            children: [
              WalletCard(address: "0x1234...5678abcd"),
              AmountCard(controller: _ammountController),
              NoteCard(controller: _noteController),
              Text(
                "Share the generated QR code with the payer to receive IDRX tokens directly to your wallet",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey.shade600),
              ),
              Spacer(),
              PrimaryButton(label: "Generate QR Code", onPressed: () {}, icon: LucideIcons.qrCode)
            ],
          ),
        ),
      ),
    );
  }
}
