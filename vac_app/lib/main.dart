
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:vac_app/pages/home_page.dart';
import 'package:vac_app/pages/login_page.dart';
import 'firebase_options.dart';
import 'helper/helper_function.dart';


void main() async {
  // to ensure that the widget is initialized
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);

  runApp(const MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}





class _MyAppState extends State<MyApp> {
 
  bool _isSingnedIn = false;


  @override
  void initState() {
  
    super.initState();
    getUserloggedInStatus();

  }

  getUserloggedInStatus() async{
    await HelperFunctions.getUserloggedInStatus().then((value) {
      if(value != null){     
        setState(() {
           _isSingnedIn = value;                 
        });         
      }
    }); 
  }

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(      
     debugShowCheckedModeBanner: false,
     theme: ThemeData(
      primaryColor: Colors.black87,
     ),
     home:  LoginPage(),
    );
  }
}




