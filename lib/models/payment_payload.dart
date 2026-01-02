import 'dart:convert';

class PaymentPayload {
  final String to;
  final int amount;
  final String? note;
  final int expiredAt;

  PaymentPayload({
    required this.to,
    required this.amount,
    this.note,
    required this.expiredAt
  });

  Map<String, dynamic> toMap() {
    return {
      "to": to,
      "amount": amount,
      if (note != null && note!.isNotEmpty) "note" : note,
      "expiredAt": expiredAt
    };
  }

  String toJson() => jsonEncode(toMap());
}