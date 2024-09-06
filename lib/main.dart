import 'package:flutter/material.dart';
import 'package:tile_game/selection_screen.dart';

void main() {
  runApp(const TileGame());
}

class TileGame extends StatelessWidget {
  const TileGame({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tile Game',
      theme: ThemeData(primarySwatch: Colors.orange),
      home: const DifficultySelectionScreen(),
    );
  }
}
