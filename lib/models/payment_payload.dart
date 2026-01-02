import 'dart:convert';

class PaymentPayload {
  final String to;
  final int amount;
  final String? note;
  final int timestamp;

  PaymentPayload({
    required this.to,
    required this.amount,
    this.note,
  }) : timestamp = DateTime.now().millisecondsSinceEpoch;

  Map<String, dynamic> toMap() {
    return {
      "type": "IDRX Payment",
      "to": to,
      "amount": amount,
      if (note != null && note!.isNotEmpty) "note" : note,
      "timestamp": timestamp
    };
  }

  String toJson() => jsonEncode(toMap());
}