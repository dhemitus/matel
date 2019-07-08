import 'package:flutter/material.dart';

import 'package:flutter_mata_elang/widgets/buttons/key_button.dart';
import 'package:flutter_mata_elang/style/style.dart';

const List<int> _space = [
  10,
  10,
  10,
  5,
  5,
  5,
];

const List<int> _rspace = [
  5,
  5,
  5,
  10,
  10,
  10,
];

const List<List<String>> _keyslist = [
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
    'KEY',
    'z',
    'x',
    'c',
    'v',
    'b',
    'n',
    'm',
    'SWC'
  ],
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
];

const List<List<String>> _rkeyslist = [
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
    'KEY',
    'z',
    'x',
    'c',
    'v',
    'b',
    'n',
    'm',
    'SWC'
  ]
];

enum KeyType {text, symbol}
enum KeyAction {type, backspace, delete, hide, rotate}

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

  bool _turn = true;
  List<List<String>> _keys = _keyslist.map((e) => e).toList();
  List<int> _rows = _space.map((e) => e).toList();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: widget.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: _up()
      )
    );
  }

  List<Widget> _up() {
    List<Widget> rows = List.generate(
      _keys.length,
      (int i) {
        return Material(
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: List.generate(
              _keys[i].length,
              (int u) {
                Widget _child;
                KeyboardKey _key;
                if(_keys[i][u] == 'BSC') {
                  _child = Icon(Icons.backspace, color: Style.oldred,);
                  _key = KeyboardKey(key: _keys[i][u], type: KeyType.symbol, action: KeyAction.backspace);
                } else if(_keys[i][u] == 'DEL'){
                  _child = Icon(Icons.cancel, color: Style.oldred);
                  _key = KeyboardKey(key: _keys[i][u], type: KeyType.symbol, action: KeyAction.delete);
                } else if(_keys[i][u] == 'KEY'){
                  _child = Icon(Icons.keyboard, color: Style.oldred);
                  _key = KeyboardKey(key: _keys[i][u], type: KeyType.symbol, action: KeyAction.hide);
                } else if(_keys[i][u] == 'SWC'){
                  _child = Icon(Icons.rotate_90_degrees_ccw, color: Style.oldred);
                  _key = KeyboardKey(key: _keys[i][u], type: KeyType.symbol, action: KeyAction.rotate);
                } else {
                  _key = KeyboardKey(key: _keys[i][u], type: KeyType.text, action: KeyAction.type);
                  _child = Text(_keys[i][u].toUpperCase(), style: Style.key.copyWith(color: Style.oldred));
                }
                if(_keys[i][u] == 'KEY') {
                  return Expanded(
                    child: KeyButton(
                      height: widget.height / _keyslist.length,
                      width: MediaQuery.of(context).size.width / _rows[i],
                      child: _child,
                      onPressed: (context) => widget.onPressed(_key),
                    ),
                  );
                } else if(_keys[i][u] == 'SWC') {
                  return Expanded(
                    child: KeyButton(
                      height: widget.height / _keyslist.length,
                      width: MediaQuery.of(context).size.width / _rows[i],
                      child: _child,
                      onPressed: (context) => setState(() {
                        _turn = !_turn;
                        if(_turn) {
                          _keys = _keyslist.map((e) => e).toList();
                          _rows = _space.map((e) => e).toList();

                        } else {
                          _keys = _rkeyslist.map((e) => e).toList();
                          _rows = _rspace.map((e) => e).toList();
                        }
                      }),
                    ),
                  );
                } else {
                  return KeyButton(
                    height: widget.height / _keys.length,
                    width: MediaQuery.of(context).size.width / _rows[i],
                    child: _child,
                    onPressed: (context) => widget.onPressed(_key),
                  );

                }
              }
            )
          )
        );
      }
    );
    return rows;
  }
}