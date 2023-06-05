import 'package:flutter/material.dart';

class PlayerButton extends StatefulWidget {
  final Color color;
  bool isPlaying;
  String playerName;
  VoidCallback onTap;

  PlayerButton({
    super.key,
    required this.color,
    required this.isPlaying,
    required this.playerName,
    required this.onTap,
  });

  @override
  State<PlayerButton> createState() => _PlayerButtonState();
}

class _PlayerButtonState extends State<PlayerButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: InkWell(
        onTap: widget.onTap,
        child: SizedBox(
          width: 200,
          child: Row(
            children: [
              Container(
                width: widget.isPlaying ? 48 : 32,
                height: widget.isPlaying ? 48 : 32,
                decoration: BoxDecoration(
                  border: Border.all(width: 3),
                  borderRadius: BorderRadius.circular(8),
                  color: widget.color,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  widget.playerName.length > 10
                      ? '${widget.playerName.substring(0, 10)}...'
                      : widget.playerName,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight:
                        widget.isPlaying ? FontWeight.w700 : FontWeight.normal,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
