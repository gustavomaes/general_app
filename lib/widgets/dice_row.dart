import 'package:flutter/material.dart';

class DiceRow extends StatefulWidget {
  String? svgPath;
  String? text;
  VoidCallback openScoreDialog;

  DiceRow({
    super.key,
    this.svgPath,
    this.text,
    required this.openScoreDialog,
  });

  @override
  State<DiceRow> createState() => _DiceRowState();
}

class _DiceRowState extends State<DiceRow> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (widget.svgPath != null)
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Image.asset(
                widget.svgPath as String,
                width: 48,
                height: 48,
              ),
            ),
          if (widget.text != null)
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Text(
                widget.text as String,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          InkWell(
            onTap: widget.openScoreDialog,
            child: Container(
              width: 70,
              height: 48,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 3),
                borderRadius: BorderRadius.circular(100),
              ),
              child: const Center(
                child: Text(
                  "4",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
