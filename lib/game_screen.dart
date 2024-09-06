import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  final int gridSize;
  final int timeLimit;

  // ignore: use_key_in_widget_constructors
  const GameScreen({required this.gridSize, required this.timeLimit});

  @override
  // ignore: library_private_types_in_public_api
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  List<List<int?>> grid = [];
  late int timeLeft;
  late bool isRunning;

  @override
  void initState() {
    super.initState();
    resetGame();
    timeLeft = widget.timeLimit;
    isRunning = true;
    startTimer();
  }

  void resetGame() {
    setState(() {
      grid = List.generate(widget.gridSize, (row) {
        return List.generate(widget.gridSize, (col) {
          if (row == 0 && col == 0) {
            return null; // Пустая первая ячейка
          } else if (row == 0 || col == 0) {
            return 0; // Бирюзовые плитки
          } else {
            return 1; // Цифровые плитки
          }
        });
      });
    });
  }

  void startTimer() {
    Future.delayed(const Duration(seconds: 1), () {
      if (isRunning && timeLeft > 0) {
        setState(() {
          timeLeft--;
        });
        startTimer();
      }
    });
  }

  void onTileTap(int row, int col) {
    if (grid[row][col] != null && grid[row][col] != 0) {
      // Только цифровые плитки можно нажимать
      setState(() {
        grid[row][col] = (grid[row][col]! % 5) + 1;
      });
    }
  }

  Color getTileColor(int? value) {
    switch (value) {
      case 1:
        return Colors.green;
      case 2:
        return Colors.blue;
      case 3:
        return Colors.purple;
      case 4:
        return Colors.orange;
      case 5:
        return Colors.red;
      default:
        return Colors.teal;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tile Game'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: GridView.builder(
                  padding: const EdgeInsets.all(10),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: widget.gridSize,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  itemCount: widget.gridSize * widget.gridSize,
                  itemBuilder: (context, index) {
                    int row = index ~/ widget.gridSize;
                    int col = index % widget.gridSize;
                    return GestureDetector(
                      onTap: () {
                        onTileTap(row, col);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: grid[row][col] == null
                              ? Colors.transparent // Пустая ячейка
                              : getTileColor(grid[row][
                                  col]), // Цвет цифры в зависимости от значения
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text(
                            grid[row][col] == null
                                ? '' // Пустая ячейка
                                : grid[row][col] == 0
                                    ? '' // Бирюзовые плитки
                                    : grid[row][col]
                                        .toString(), // Цифровые плитки
                            style: const TextStyle(
                                fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 98, 69, 58),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      'Timer: $timeLeft',
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: const Color.fromARGB(255, 36, 82, 37),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 10),
                        textStyle: const TextStyle(
                          fontSize: 20,
                        )),
                    onPressed: () {
                      setState(() {
                        resetGame();
                        timeLeft = widget.timeLimit; // Сброс таймера
                      });
                    },
                    child: const Wrap(
                      children: <Widget>[
                        Icon(
                          Icons.restart_alt,
                          color: Colors.white,
                          size: 24.0,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Restart", style: TextStyle(fontSize: 20)),
                      ],
                    ),

                    // child: const Text('Restart'),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
