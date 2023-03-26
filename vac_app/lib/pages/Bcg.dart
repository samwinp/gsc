import 'package:flutter/material.dart';
import 'package:vac_app/pages/home_page.dart';
import 'package:vac_app/widgets/widgets.dart';




class BgcVaccineInfoPage extends StatelessWidget {
  const BgcVaccineInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BGC Vaccine Information'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'What is the BGC vaccine?',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'The BGC vaccine is a vaccine used to protect against tuberculosis (TB). It is made from a weakened strain of the bacteria that causes TB. The vaccine is given as a shot in the arm.',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Who should get the BGC vaccine?',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'The BGC vaccine is recommended for infants and children who live in areas with a high incidence of TB. It is typically given at birth or shortly thereafter. The vaccine is not recommended for adults or people who have already been infected with TB.',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Are there any side effects of the BGC vaccine?',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'The BGC vaccine is generally safe and well-tolerated. However, it can cause some mild side effects, such as swelling or redness at the injection site, fever, and irritability. Serious side effects are rare.',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),

            const SizedBox(height: 10,),
            
            TextButton(
              onPressed: () {
              nextScreenReplace(context, const HomePage());
             },
          child: const Text("return back to home page"),
        ),

          ],
        ),
      ),
    );
  }
}









// class Bgc extends StatefulWidget {
//   const Bgc({super.key});

//   @override
//   State<Bgc> createState() => _BgcState();
// }

// class _BgcState extends State<Bgc> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
      
//       body: TextButton(
//         onPressed: () {
//           nextScreenReplace(context, const HomePage());
//         },
//         child: const Text("return back to home page"),
//       ),
//     );
//   }
// }