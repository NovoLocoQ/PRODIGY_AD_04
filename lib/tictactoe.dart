import 'package:flutter/material.dart';

class Tictactoe extends StatefulWidget {
  const Tictactoe({super.key});

  @override
  State<Tictactoe> createState() => _TictactoeState();
}

class _TictactoeState extends State<Tictactoe> {
  List<String> gd = ['', '', '', '', '', '', '', '', ''];
  int p1 = 0;
  int p2 = 0;
  bool a = false;
  int fb = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
              Color.fromARGB(255, 61, 99, 172),
              Color(0xFF6DADDB),
              Color.fromARGB(255, 172, 212, 232),
            ])),
        child: Column(
          children: [
            Expanded(
                child: Container(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "Player 1",
                          style: TextStyle(
                              fontSize: 30,
                              color: Color.fromARGB(255, 64, 49, 223)),
                        ),
                        Text(p1.toString(),
                            style: TextStyle(
                                fontSize: 30,
                                color: Color.fromARGB(255, 64, 49, 223)))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text("Player 2",
                            style: TextStyle(
                                fontSize: 30,
                                color: Color.fromARGB(255, 64, 49, 223))),
                        Text(p2.toString(),
                            style: TextStyle(
                                fontSize: 30,
                                color: Color.fromARGB(255, 64, 49, 223)))
                      ],
                    ),
                  )
                ],
              ),
            )),
            Expanded(
              flex: 3,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemCount: 9,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        setsq(index);
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Color.fromARGB(255, 68, 74, 81))),
                      child: Center(
                        child: Text(
                          gd[index],
                          style: const TextStyle(
                              color: Color.fromARGB(255, 65, 194, 93),
                              fontSize: 50),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(child: Container())
          ],
        ),
      ),
    );
  }

  void setsq(int index) {
    if (a == false && gd[index] == "") {
      gd[index] = "x";
      fb++;
      win();
      a = true;
    } else if (a == true && gd[index] == "") {
      gd[index] = "o";
      fb++;
      win();
      a = false;
    }
  }

  Widget? win() {
    if ((gd[0] == gd[1] && gd[1] == gd[2] && gd[0] != "") ||
        (gd[3] == gd[4] && gd[4] == gd[5] && gd[3] != "") ||
        (gd[6] == gd[7] && gd[7] == gd[8] && gd[6] != "") ||
        (gd[0] == gd[4] && gd[4] == gd[8] && gd[0] != "") ||
        (gd[2] == gd[4] && gd[4] == gd[6] && gd[2] != "") ||
        (gd[0] == gd[3] && gd[3] == gd[6] && gd[0] != "") ||
        (gd[1] == gd[4] && gd[4] == gd[7] && gd[1] != "") ||
        (gd[2] == gd[5] && gd[5] == gd[8] && gd[2] != "")) {
      msg(0);
    } else if (fb == 9) {
      msg(1);
    }
  }

  Future<dynamic> msg(int flag) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: flag == 0
              ? Text("${a == false ? "Player 1" : "Player 2"}Won")
              : const Text("Draw"),
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    gd = ['', '', '', '', '', '', '', '', ''];
                    flag == 0
                        ? a == false
                            ? p1++
                            : p2++
                        : p1 = p1;
                    p2 = p2;
                    fb = 0;
                    Navigator.of(context).pop();
                  });
                },
                icon: const Icon(Icons.refresh_outlined))
          ],
        );
      },
    );
  }
}
