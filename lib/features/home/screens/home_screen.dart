import 'package:flutter/material.dart';
import 'package:idrx_paylink/features/home/widgets/action_button.dart';
import 'package:idrx_paylink/features/home/widgets/balance_card.dart';
import 'package:idrx_paylink/features/pay/screens/pay_screen.dart';
import 'package:idrx_paylink/features/recieve/screens/recieve_screen.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "IDRX Paylink",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              Text("Crypto Payment Made Easy", style: TextStyle(fontSize: 14)),
              SizedBox(height: 20),
              BalanceCard(balance: 2400000),
              SizedBox(height: 20),
              Text(
                "Payment Action",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  ActionButton(
                    label: "Recieve Payment",
                    icon: LucideIcons.qrCode,
                    color: Colors.green,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RecieveScreen(),
                        ),
                      );
                    },
                  ),
                  SizedBox(width: 20),
                  ActionButton(
                    label: "Pay / Scan QR",
                    icon: LucideIcons.scanLine,
                    color: Colors.blue,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PayScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
