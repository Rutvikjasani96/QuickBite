import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
      // widget.onChanged(_counter);
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
        // widget.onChanged(_counter);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Spacer(),
        Container(
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: _decrementCounter,
                icon: Icon(Icons.remove),
              ),
              SizedBox(width: 16),
              Text(
                _counter.toString(),
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(width: 16),
              IconButton(
                onPressed: _incrementCounter,
                icon: Icon(Icons.add),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 15,
        ),
      ],
    );
  }
}
