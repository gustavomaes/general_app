import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:general/widgets/button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Widget logo = SvgPicture.asset('assets/logo.svg', height: 60);

  AlertDialog alert = AlertDialog(
    title: const Text('Novo jogador'),
    content: Container(
      child: Text(''),
    ),
  );

  openDialogList() {
    showDialog(
      context: context,
      builder: (context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(child: logo),
                const SizedBox(height: 16),
                const Divider(
                  color: Colors.black87,
                  thickness: 2,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 24),
                  child: Column(
                    children: [
                      Text(
                        "Bem vindo!",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: Text(
                          "Adicone os jogadores para começar uma nova partida.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Button(
                    onTap: openDialogList,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
