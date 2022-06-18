import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(15),
          width: double.infinity,
          child: Column(
            children: [
              TextField(
                maxLines: 1,
                textAlign: TextAlign.start,
              )
            ],
          ),
        ),
      ),
    );
  }
}