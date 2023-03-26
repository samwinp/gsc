import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';


class ShowWarn extends StatefulWidget {
  late String name;
  ShowWarn({super.key,required String name}){
    this.name = name;
  }

  @override
  State<ShowWarn> createState() => _ShowWarnState();
}

class _ShowWarnState extends State<ShowWarn> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: ListTile(
        leading: Icon(Icons.info, color: Colors.blue,),
        title: Text("${widget.name}",
        style: TextStyle(
          color: Colors.black
        ),
        ),
      ),
    );
  }
}