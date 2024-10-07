import 'package:flutter/material.dart';
import 'package:flutter_wordle/wordle/wordle.dart';

class BoardTile extends StatelessWidget{
  const BoardTile({
    Key? key,
    required this.letter,
  }) : super(key: key);

  final Letter letter;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      margin: const EdgeInsets.all(4),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: letter.backgroundColor,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: letter.borderColor),
      ),
      child: Text(
        letter.val,
        style: const TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}