import 'package:flutter/material.dart';

class DisplayScreen extends StatelessWidget {
  const DisplayScreen(
      {super.key,
      required this.name,
      required this.imageUrl,
      required this.title});
  final String name;
  final String imageUrl;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          title: Text(
            name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
        ),
        body: ListView(children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Image.network(
              imageUrl,
              fit: BoxFit.contain,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            padding: const EdgeInsets.all(20),
            child: Text(
              title,
              softWrap: true,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
        ]),
      ),
    );
  }
}
