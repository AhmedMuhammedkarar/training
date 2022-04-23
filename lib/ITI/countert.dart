import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  final Function(int) onUpdate;

  const Counter({Key key, this.onUpdate}) : super(key: key);

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _counter = 0;

  _onUpdate(int delta) {
    if (widget.onUpdate != null) {
      widget.onUpdate(delta);
    }
  }

  _increment() {
    setState(() {
      _counter++;
    });
    _onUpdate(1);
  }

  _decrement() {
    if (_counter <= 0) return;

    setState(() {
      _counter--;
    });
    _onUpdate(-1);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      // mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
            onPressed: _counter > 0 ? _decrement : null,
            icon: const Icon(Icons.remove)),
        Text("$_counter"),
        IconButton(onPressed: _increment, icon: const Icon(Icons.add)),
      ],
    );
  }
}