import 'package:flutter/material.dart';

import '../widgets/widgets.dart';
import 'home_page.dart';

class TyphoidVaccineInfoPage extends StatelessWidget {
  const TyphoidVaccineInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Typhoid Vaccine Information'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'What is the typhoid vaccine?',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'The typhoid vaccine is a vaccine used to protect against the bacteria that cause typhoid fever. It is available in two forms: an injectable vaccine and an oral vaccine. The injectable vaccine is given as a single shot, while the oral vaccine is given as a series of four pills taken over a week. ',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 16.0),
            const Text(
              'Who should get the typhoid vaccine?',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'The typhoid vaccine is recommended for people who are traveling to areas where typhoid fever is common, especially in parts of Asia, Africa, and South America. It is also recommended for people who work with the bacteria that cause typhoid fever, such as laboratory workers. ',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Are there any side effects of the typhoid vaccine?',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'The typhoid vaccine is generally safe and well-tolerated. However, it can cause some mild side effects, such as soreness or redness at the injection site, fever, headache, or nausea. Serious side effects are rare.',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),

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
