import 'package:flutter/material.dart';
import 'package:idrx_paylink/features/recieve/screens/qr_display_screen.dart';
import 'package:idrx_paylink/features/recieve/widgets/amount_card.dart';
import 'package:idrx_paylink/features/recieve/widgets/note_card.dart';
import 'package:idrx_paylink/features/recieve/widgets/wallet_card.dart';
import 'package:idrx_paylink/models/payment_payload.dart';
import 'package:idrx_paylink/widgets/primary_button.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class RecieveScreen extends StatefulWidget {
  const RecieveScreen({super.key});

  @override
  State<RecieveScreen> createState() => _RecieveScreenState();
}

class _RecieveScreenState extends State<RecieveScreen> {
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  int _amountValue = 0;

  @override
  void initState() {
    super.initState();
    _amountController.addListener(_onAmountChanged);
  }

  void _onAmountChanged() {
    final text = _amountController.text;
    final clean = text.replaceAll(RegExp(r'[^0-9]'), '');
    _amountValue = int.tryParse(clean) ?? 0;
  }

  @override
  void dispose() {
    _amountController.dispose();
    _noteController.dispose();
    super.dispose();
  }

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
              AmountCard(controller: _amountController),
              NoteCard(controller: _noteController),
              Text(
                "Share the generated QR code with the payer to receive IDRX tokens directly to your wallet",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey.shade600),
              ),
              Spacer(),
              PrimaryButton(
                label: "Generate QR Code",
                icon: LucideIcons.qrCode,
                onPressed: () {
                  if (_amountValue <= 0) {
                    // show error
                    return;
                  }

                  final payload = PaymentPayload(
                    to: "0x1234...5678abcd",
                    amount: _amountValue,
                    note: _noteController.text.trim(),
                  );

                  final qrData = payload.toJson();

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          QrDisplayScreen(qrData: qrData, amount: _amountValue),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
