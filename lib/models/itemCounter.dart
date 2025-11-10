import 'package:flutter/material.dart';
class QuantityCounter extends StatefulWidget {
  final Function(int) onQuantityChanged;

  const QuantityCounter({Key? key, required this.onQuantityChanged}) : super(key: key);

  @override
  _QuantityCounterState createState() => _QuantityCounterState();
}

class _QuantityCounterState extends State<QuantityCounter> {
  int _quantity = 1;

  void _increment() {
    setState(() {
      _quantity++;
      widget.onQuantityChanged(_quantity);
    });
  }

  void _decrement() {
    if (_quantity > 1) {
      setState(() {
        _quantity--;
        widget.onQuantityChanged(_quantity);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
          onPressed: _decrement,
          icon: const Icon(Icons.remove),
          style: IconButton.styleFrom(
            iconSize: 20,
            shape: const CircleBorder(),
            side: const BorderSide(color: Colors.grey),
            backgroundColor: Colors.white,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            '$_quantity',
            style: const TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
        IconButton(
          onPressed: _increment,
          icon: const Icon(Icons.add),
          style: IconButton.styleFrom(
            iconSize: 20,
            shape: const CircleBorder(),
            side: const BorderSide(color: Colors.grey),
            backgroundColor: Colors.white,
          ),
        ),
      ],
    );
  }
}

