import 'package:flutter/material.dart';

import 'package:flutter_mata_elang/widgets/buttons/key_button.dart';
import 'package:flutter_mata_elang/style/style.dart';

const List<int> _space = [
  5,
  5,
  5,
  10,
  10,
  10
];

const List<List<String>> _keyslist = [
  const [
    'BSC',
    '1',
    '2',
    '3',
    'DEL'
  ],
  const [
    '4',
    '5',
    '6'
  ],
  const [
    '0',
    '7',
    '8',
    '9',
    '0'
  ],
  const [
    'q',
    'w',
    'e',
    'r',
    't',
    'y',
    'u',
    'i',
    'o',
    'p'
  ],
  const [
    'a',
    's',
    'd',
    'f',
    'g',
    'h',
    'j',
    'k',
    'l'
  ],
  const [
    'z',
    'x',
    'c',
    'v',
    'b',
    'n',
    'm'
  ]
];

enum KeyType {text, symbol}
enum KeyAction {type, backspace, delete}

class KeyboardKey {
  final String key;
  final KeyType type;
  final KeyAction action;

  KeyboardKey({this.key, this.type, this.action});
}

class SpecialKeyboard extends StatefulWidget {

  final double height;
  final Function onPressed;

  SpecialKeyboard({Key key, this.height, this.onPressed}) : super(key: key);
  @override
  _SpecialKeyboardState createState() => _SpecialKeyboardState();
}

class _SpecialKeyboardState extends State<SpecialKeyboard> {

  @override
  Widget build(BuildContext context) {

    return Container(
      width: MediaQuery.of(context).size.width,
      height: widget.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: _rows()
      )
    );
  }

  List<Widget> _rows() {

    List<Widget> rows = List.generate(
      _keyslist.length,
      (int i) {
        return Material(
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: List.generate(
              _keyslist[i].length,
              (int u) {
                Widget _child;
                KeyboardKey _key;
                if(_keyslist[i][u] == 'BSC') {
                  _child = Icon(Icons.backspace, color: Style.oldred,);
                  _key = KeyboardKey(key: _keyslist[i][u], type: KeyType.symbol, action: KeyAction.backspace);
                } else if(_keyslist[i][u] == 'DEL'){
                  _child = Icon(Icons.cancel, color: Style.oldred);
                  _key = KeyboardKey(key: _keyslist[i][u], type: KeyType.symbol, action: KeyAction.delete);
                } else {
                  _key = KeyboardKey(key: _keyslist[i][u], type: KeyType.text, action: KeyAction.type);
                  _child = Text(_keyslist[i][u], style: Style.key.copyWith(color: Style.oldred));
                }
                return KeyButton(
                  height: widget.height / _keyslist.length,
                  width: MediaQuery.of(context).size.width / _space[i],
                  child: _child,
                  onPressed: (context) => widget.onPressed(_key),
                );
              }
            )
          )
        );
      }
    );

    return rows;
  }
}