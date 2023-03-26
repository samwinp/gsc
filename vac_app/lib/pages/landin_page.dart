import 'package:flutter/material.dart';
import 'package:vac_app/pages/Bcg.dart';
import 'package:vac_app/pages/chicken_pox.dart';
import 'package:vac_app/pages/typhoid.dart';
import 'package:vac_app/pages/vaccine_info.dart';


class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
              child: Text(
                "Welcome, To Vaxi",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 45, 45),
                  fontSize: 50,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                "     Vacination Articles",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 350,
              child: Align(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children:  [
                    VaccineInfo(vacInfo: "The BCG vaccine is made from a weakened strain of TB bacteria", vacName: "BGC",page: BgcVaccineInfoPage(),),
                    VaccineInfo(vacInfo: "Chickenpox is an infection caused by the varicella-zoster virus",vacName: "Chicked Pox",page:ChickenpoxVaccineInfoPage(),),
                    VaccineInfo(vacInfo: "Typhoid fever is a bacterial infection causing high fevers", vacName: "Ty21a",page: TyphoidVaccineInfoPage(),),
                  ],
                ),
              ),
            ),
          ],
        );
  }
}