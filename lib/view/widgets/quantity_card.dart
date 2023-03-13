import 'package:flutter/material.dart';

class QuantityCard extends StatelessWidget {
  final int q;
  final void Function() add;
  final void Function() remove;

  const QuantityCard(
      {Key? key, required this.q, required this.add, required this.remove})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 35,
      decoration: BoxDecoration(
        color: Colors.blueAccent[100],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
              onPressed: remove,
              icon: const Icon(
                Icons.remove,
                color: Colors.black,
              )),
          Text(q.toString()),
          IconButton(
              onPressed: add,
              icon: const Icon(
                Icons.add,
                color: Colors.black,
              )),
        ],
      ),
    );
  }
}
