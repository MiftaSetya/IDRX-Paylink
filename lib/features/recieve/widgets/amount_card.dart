import 'package:flutter/material.dart';
import 'package:idrx_paylink/utils/amount_input_formatter.dart';
import 'package:idrx_paylink/widgets/card_container.dart';

class AmountCard extends StatelessWidget {
  final TextEditingController controller;

  const AmountCard({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return CardContainer(
      child: Column(
        children: [
          Text(
            "Payment Amount",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
          ),
          SizedBox(height: 25),
          Center(child: _amount()),
        ],
      ),
    );
  }

  Widget _amount() => Column(
    children: [
      TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
        decoration: InputDecoration(
          hintText: "0",
          hintStyle: TextStyle(
            fontSize: 45,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
          border: InputBorder.none,
          isCollapsed: true,
        ),
        inputFormatters: [AmountInputFormatter()],
      ),
      SizedBox(height: 25),
      Container(
        decoration: BoxDecoration(
          color: Colors.blue.shade50,
          borderRadius: BorderRadius.circular(99),
        ),
        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(99),
              ),
              child: Center(
                child: Text(
                  "X",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            SizedBox(width: 5),
            Text(
              "IDRX",
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
      SizedBox(height: 10),
      Text(
        "Indonesian Rupiah Stablecoin",
        style: TextStyle(color: Colors.grey.shade600),
      ),
    ],
  );
}
