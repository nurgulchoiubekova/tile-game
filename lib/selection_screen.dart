import 'package:flutter/material.dart';
import 'package:tile_game/game_screen.dart';

class DifficultySelectionScreen extends StatelessWidget {
  const DifficultySelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Выбирайте уровень'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 75, vertical: 18),
                  textStyle: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold)),
              child: const Text('Легкий'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const GameScreen(gridSize: 4, timeLimit: 90),
                    maintainState: false,
                  ),
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 70, vertical: 18),
                  textStyle: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold)),
              child: const Text('Средний'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const GameScreen(gridSize: 5, timeLimit: 150),
                    maintainState: false,
                  ),
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 65, vertical: 18),
                  textStyle: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold)),
              child: const Text('Сложный'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const GameScreen(gridSize: 6, timeLimit: 210),
                    maintainState: false,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
