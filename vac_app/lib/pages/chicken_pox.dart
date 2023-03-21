import 'package:flutter/material.dart';

import '../widgets/widgets.dart';
import 'home_page.dart';

class ChickenpoxVaccineInfoPage extends StatelessWidget {
  const ChickenpoxVaccineInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chickenpox Vaccine Information'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'What is the chickenpox vaccine?',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            const Text(
              'The chickenpox vaccine is a vaccine used to protect against the varicella-zoster virus, which causes chickenpox. It is made from a weakened form of the virus and is typically given as two doses, several weeks apart. ',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Who should get the chickenpox vaccine?',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'The chickenpox vaccine is recommended for children and adults who have not had chickenpox or have not been vaccinated against it. It is typically given to children between 12 and 15 months of age, with a booster dose given between 4 and 6 years of age. Adults who have not had chickenpox should also receive the vaccine. ',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Are there any side effects of the chickenpox vaccine?',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'The chickenpox vaccine is generally safe and well-tolerated. However, it can cause some mild side effects, such as soreness or swelling at the injection site, fever, or a mild rash. Serious side effects are rare.',
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
