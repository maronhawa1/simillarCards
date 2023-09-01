import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        title: Text('Simillar pictures'),
        backgroundColor: Colors.indigo[800],
      ),
      body: Imagepage(),
    ),
  ));
}

class Imagepage extends StatefulWidget {
  const Imagepage({super.key});

  @override
  State<Imagepage> createState() => _ImagepageState();
}

class _ImagepageState extends State<Imagepage> {
  var leftImageNumber = 1;
  var rightImageNumber = 2;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          leftImageNumber == rightImageNumber ? 'congratulations' : 'Try again',
          style: TextStyle(fontSize: 42.0, color: Colors.white),
        ),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(
                    20.0), // for make spaces between images
                child: TextButton(
                    onPressed: () {
                      setState(() {
                        leftImageNumber = Random().nextInt(8) + 1;
                        rightImageNumber = Random().nextInt(8) + 1;
                      });
                    },
                    child: Image.asset('images/image-$leftImageNumber.png')),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextButton(
                    onPressed: () {
                      setState(() {
                        rightImageNumber = Random().nextInt(8) + 1;
                        leftImageNumber = Random().nextInt(8) + 1;
                      });
                    },
                    child: Image.asset('images/image-$rightImageNumber.png')),
              ),
            ),
          ],
        )
      ],
    );
  }
}
