import 'package:flutter/material.dart';
import 'package:idrx_paylink/widgets/card_container.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class NoteCard extends StatelessWidget {
  final TextEditingController controller;

  const NoteCard({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return CardContainer(child: Column(children: [_header(), _input()]));
  }

  Widget _header() => Row(
    spacing: 8,
    children: [
      Icon(LucideIcons.fileText, size: 20, color: Colors.grey.shade600),
      Text("Note", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
      Text("(Optional)", style: TextStyle(color: Colors.grey.shade600)),
    ],
  );

  Widget _input() => Container(
    decoration: BoxDecoration(
      color: Colors.grey.shade100,
      borderRadius: BorderRadius.circular(20),
    ),
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    child: TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: "e.g. Coffee payment",
        hintStyle: TextStyle(color: Colors.grey),
        border: InputBorder.none,
        isCollapsed: true,
      ),
    ),
  );
}
