import 'dart:math';

import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  VoidCallback onTap;

  Button({
    super.key,
    required this.onTap,
  });

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  final List<Color> _colors = [
    const Color.fromARGB(255, 255, 133, 119),
    const Color.fromARGB(255, 15, 169, 88),
    const Color.fromARGB(255, 199, 185, 255),
    const Color.fromARGB(255, 105, 155, 247),
    const Color.fromARGB(255, 255, 199, 0),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ElevatedButton(
        onPressed: widget.onTap,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return _colors[Random().nextInt(_colors.length - 1)];
              }
              return Colors.white;
            },
          ),
          elevation: MaterialStateProperty.resolveWith((states) => 0),
          shape: MaterialStateProperty.resolveWith(
            (states) => RoundedRectangleBorder(
              side: const BorderSide(
                color: Colors.black,
                width: 3,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        child: const Text(
          'Adicionar jogador',
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
      ),
    );
  }
}
