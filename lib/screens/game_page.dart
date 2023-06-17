import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:general/models/player_model.dart';

import '../widgets/dice_row.dart';
import '../widgets/player_button.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

const List<String> _list = ['1', '2', '3', '4', '5'];
List<Player> _players = [
  Player(id: "1", name: 'Player 1', color: Color.fromARGB(255, 255, 133, 119)),
  Player(id: "2", name: 'Player 2', color: Color.fromARGB(255, 15, 169, 88)),
  Player(id: "3", name: 'Player 3', color: Color.fromARGB(255, 199, 185, 255)),
  Player(id: "4", name: 'Player 4', color: Color.fromARGB(255, 105, 155, 247)),
  Player(id: "5", name: 'Player 5', color: Color.fromARGB(255, 255, 199, 0)),
];

class _GamePageState extends State<GamePage> {
  final Widget logo = SvgPicture.asset('assets/logo.svg', height: 60);
  Player currentPlayer = _players[0];

  AlertDialog alert = AlertDialog(
    title: Text('Pontuação'),
    content: Container(
      width: double.minPositive,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: _list.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(_list[index]),
            onTap: () {
              print('tap value');
            },
          );
        },
      ),
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
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: currentPlayer.color,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: logo),
                  const SizedBox(height: 16),
                  const Divider(
                    color: Colors.black87,
                    thickness: 2,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 24),
                    child: Text(
                      "Jogadores",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 16),
                          SizedBox(
                            width: 200,
                            child: ListView(
                              shrinkWrap: true,
                              children: [
                                for (final player in _players)
                                  PlayerButton(
                                    color: player.color,
                                    isPlaying: currentPlayer.id == player.id,
                                    playerName: player.name,
                                    onTap: () {
                                      setState(() {
                                        currentPlayer = player;
                                      });
                                    },
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const SizedBox(height: 16),
                          DiceRow(
                            svgPath: 'assets/d1.png',
                            openScoreDialog: openDialogList,
                          ),
                          DiceRow(
                            svgPath: 'assets/d2.png',
                            openScoreDialog: openDialogList,
                          ),
                          DiceRow(
                            svgPath: 'assets/d3.png',
                            openScoreDialog: openDialogList,
                          ),
                          DiceRow(
                            svgPath: 'assets/d4.png',
                            openScoreDialog: openDialogList,
                          ),
                          DiceRow(
                            svgPath: 'assets/d5.png',
                            openScoreDialog: openDialogList,
                          ),
                          DiceRow(
                            svgPath: 'assets/d6.png',
                            openScoreDialog: openDialogList,
                          ),
                          DiceRow(
                            text: 'Trinca',
                            openScoreDialog: openDialogList,
                          ),
                          DiceRow(
                            text: 'Quadra',
                            openScoreDialog: openDialogList,
                          ),
                          DiceRow(
                            text: 'Full-house',
                            openScoreDialog: openDialogList,
                          ),
                          DiceRow(
                            text: 'Sequencia baixa',
                            openScoreDialog: openDialogList,
                          ),
                          DiceRow(
                            text: 'Sequencia alta',
                            openScoreDialog: openDialogList,
                          ),
                          DiceRow(
                            text: 'General',
                            openScoreDialog: openDialogList,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: 16),
                                child: Text(
                                  "Pontuação",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 70,
                                height: 48,
                                child: Center(
                                  child: Text(
                                    "80",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
