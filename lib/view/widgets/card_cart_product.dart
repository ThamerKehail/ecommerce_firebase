import 'package:flutter/material.dart';

class CardCartProduct extends StatelessWidget {
  const CardCartProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 110,
            height: 120,
            child: Image.asset(
              "assets/images/man.jpg",
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "T-chert man",
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              Text("Clothes"),
              Text("120 JOD"),
              Container(
                width: 110,
                height: 30,
                color: Colors.grey[200],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.remove,
                          color: Colors.black,
                        )),
                    const Text('1'),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.add,
                          color: Colors.black,
                        )),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
