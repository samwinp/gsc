import 'package:flutter/material.dart';
import 'package:vac_app/pages/home_page.dart';
import 'package:vac_app/widgets/widgets.dart';

class Bgc extends StatefulWidget {
  const Bgc({super.key});

  @override
  State<Bgc> createState() => _BgcState();
}

class _BgcState extends State<Bgc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: TextButton(
        onPressed: () {
          nextScreenReplace(context, const HomePage());
        },
        child: const Text("return back to home page"),
      ),
    );
  }
}