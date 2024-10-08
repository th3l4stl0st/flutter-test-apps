import 'package:flutter/material.dart';
import 'package:flutter_wordle/app/app_colors.dart';
import 'package:flutter_wordle/wordle/wordle.dart';


const _qwerty = [
  ['Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P'],
  ['A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L'],
  ['DEL','Z', 'X', 'C', 'V', 'B', 'N', 'M','ENTER'],
];

class Keyboard extends StatelessWidget {
  const Keyboard({ 
    Key? key,
    required this.onKeyTapped,
    required this.onDeleteTapped,
    required this.onEnterTapped,
    required this.letters,
  }) : super(key: key);

  final void Function(String) onKeyTapped;
  final VoidCallback onDeleteTapped;
  final VoidCallback onEnterTapped;
  final Set<Letter> letters;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _qwerty.map(
        (keyRow) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: keyRow.map(
          (letter) {
            if (letter == 'DEL') {
              return _KeyboardButton.delete(onTap: onDeleteTapped);
            } else if (letter == 'ENTER') {
              return _KeyboardButton.enter(onTap: onEnterTapped);
            }
            final letterKey = letters.firstWhere(
              (e) => e.val == letter,
              orElse: () => Letter.empty(),
            );
            return _KeyboardButton(
              onTap: () => onKeyTapped(letter),
              letter: letter,
              backgroundColor: letterKey != Letter.empty()
                ? letterKey.backgroundColor
                : Colors.grey,
            );
          },
        ).toList(),
        ),
      ).toList(),
    );
  }
}

class _KeyboardButton extends StatelessWidget{
  const _KeyboardButton({
    Key? key,
    this.height = 60,
    this.width = 37,
    required this.onTap,
    required this.letter,
    required this.backgroundColor,
  }) : super(key: key);

  factory _KeyboardButton.delete({required VoidCallback onTap}) =>
    _KeyboardButton(
      width: 56,
      onTap: onTap,
      letter: 'DEL',
      backgroundColor: Colors.redAccent,
    );

  factory _KeyboardButton.enter({required VoidCallback onTap}) =>
    _KeyboardButton(
      width: 56,
      onTap: onTap,
      letter: 'ENTER',
      backgroundColor: correctColor,
    );

  final double height;
  final double width;
  final VoidCallback onTap;
  final String letter;
  final Color backgroundColor;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 3.0,
        horizontal: 2.0,
      ),
      child: Material(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(4),
        child: InkWell(
          onTap: onTap,
          child: Container(
            height: height,
            width: width,
            alignment: Alignment.center,
            child: Text(
              letter,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
} 